/**
 * Warhammer: The Old World — Unit Strength
 * =========================================
 *
 * Puts the "Unit Strength" cost on every model and the max-20 cap on every unit in
 * Battle March, replacing the UNIT STRENGTH 1/2/3 category system.
 *
 * The system it replaces — the paired modifiers counting UNIT STRENGTH 1/2/3
 * categories, their inert `max -1` constraints, and the categories themselves — has
 * already been removed from the data.
 *
 * What the script writes — everything carries the MARKER comment, nothing else is touched:
 *
 *   1. on every `model` : a `set <US>` modifier on the Unit Strength cost
 *   2. on every `mount` : the same, using the mount's OWN troop type
 *   3. on every `model` that has a mount among its descendants: a `multiply 0`
 *      modifier on the Unit Strength cost, conditioned on "a mount is selected".
 *      The mount then carries the Unit Strength of the pair instead of the rider.
 *   4. on every `unit`  : a `max -1` constraint on the Unit Strength cost (inert
 *      outside Battle March) plus a modifier raising it to 20 inside the
 *      "5. Battle March" force.
 *
 * Why modifiers instead of plain `costs`: a BattleScribe cost has no `comment` field,
 * so nothing would identify what the script wrote. A modifier does.
 *
 * Why `multiply 0` and not `set 0` for step 3: `modify()` sorts modifiers by TYPE,
 * not by declaration order (bs_modifiers.ts `modifiersOrder`: set=0, multiply=2). A
 * `multiply` therefore always lands after the base `set`, whatever the array order.
 * Two `set` modifiers would depend on insertion order instead.
 *
 * IDEMPOTENT: each pass first deletes every child carrying MARKER, then rewrites. The
 * unit constraint id is reused when one already exists, so a second run produces a
 * byte-identical file.
 *
 * Troop type resolution, first match wins: the troop-type categoryLink carried by the
 * entry itself (569/585 models and 101/125 mounts have one), then its own "Unit"
 * profile, then the nearest ancestor. Anything left unresolved is listed in the final
 * report, never guessed.
 *
 * Source of the Unit Strength values: the rulebook's Troop Type table
 * (https://tow.whfb.app/troop-types-at-a-glance/troop-type-table). Monstrous
 * Creatures, Behemoths and War Machines are "As Starting Wounds", so their value is
 * read off the W characteristic of the entry's "Model" profile rather than hardcoded.
 */

const DRY_RUN = false; // true = report only, write nothing

const MARKER = "Unit strenght script";
const US_COST_TYPE_ID = "73ea-910d-c188-35d0"; // "Unit Strength" cost type
const BATTLE_MARCH_FORCE_ID = "e40a-36c4-0c66-472a"; // "5. Battle March" force
const MOUNT_CATEGORY_ID = "c96a-608-5de4-b943"; // "MOUNT" category
const MODEL_PROFILE_TYPE_ID = "b070-143a-73f-2772"; // "Model" profile (M WS BS S T W I A Ld)
const MAX_UNIT_STRENGTH = 20;

/** Sentinel for the troop types whose Unit Strength is "As Starting Wounds". */
const AS_STARTING_WOUNDS = "wounds";

/**
 * Unit Strength per troop type, from the rulebook's Troop Type table.
 * The fixed values match, without conflict, the 232 UNIT STRENGTH 1/2/3 categories
 * placed by commit 49da4f0 — that pass covered only these ten troop types.
 */
const UNIT_STRENGTH_BY_TROOP_TYPE = {
  "regular infantry": 1,
  "heavy infantry": 1,
  "war beast": 1,
  "light cavalry": 2,
  "heavy cavalry": 2,
  "monstrous infantry": 3,
  swarms: 3,
  "monstrous cavalry": 3,
  "light chariot": 3,
  "heavy chariot": 5,

  "monstrous creature": AS_STARTING_WOUNDS,
  behemoth: AS_STARTING_WOUNDS,
  "war machine": AS_STARTING_WOUNDS,
};

/** Troop-type categoryLink target -> key of the table above. */
const TROOP_TYPE_CATEGORIES = {
  "f3f7-ca43-674e-115f": "regular infantry",
  "ca7e-d004-ccde-caf3": "heavy infantry",
  "600c-7d08-5be1-fe0c": "light cavalry",
  "5165-d052-cfc2-5887": "heavy cavalry",
  "5c55-f9d6-b181-92f8": "monstrous infantry",
  "2c85-5f2b-9288-1257": "monstrous cavalry",
  "fb36-5275-617-c895": "monstrous creature",
  "19f9-8dd8-bba4-625b": "war beast",
  "db92-54fd-e023-d69f": "swarms",
  "7dce-b0f0-2217-2820": "light chariot",
  "d768-7cf0-de0a-c249": "heavy chariot",
  "3755-6732-99b2-c713": "behemoth",
  "9fcf-19ad-fe84-9c61": "war machine",
  // "Cavalry" (36e4-45e0-c904-55d1) is deliberately absent: it is carried by only
  // five `unit` entries, never by a model, and is not a rulebook troop type.
};

function pathOf(node) {
  const path = [node.name || "(unnamed)"];
  let cur = node;
  while (cur.parent) {
    cur = cur.parent;
    path.push(cur.name || "?");
  }
  return path.reverse().join(" / ");
}

function bump(obj, key) {
  obj[key] = (obj[key] || 0) + 1;
}

function isRealEntry(node) {
  if (!node || typeof node.getType !== "function") return false;
  if (node.isLink && node.isLink()) return false; // a link does not carry the cost
  return true;
}

/** Troop type carried by the entry's own categoryLinks, or null. */
function troopTypeFromCategories(node) {
  const found = new Set();
  for (const link of node.categoryLinks || []) {
    const key = TROOP_TYPE_CATEGORIES[link.targetId];
    if (key) found.add(key);
  }
  if (found.size === 1) return [...found][0];
  return null; // 0 = none; 2+ = ambiguous (Miao Ying), let the next step decide
}

/**
 * Troop type read off the entry's "Unit" profile.
 * Normalises the 45 spellings present in the data: case, whitespace, the
 * "(character)" / "(named character, Orion)" suffixes, the "war beasts" plural, and
 * compound labels ("Regular infantry (Skink handlers), War beasts..." or
 * "Heavy Infantry (named character)/Behemoth...") of which the first term is kept.
 */
function troopTypeFromProfile(node) {
  const profile = (node.profiles || []).find((o) => o.typeName === "Unit");
  const characteristic = profile && (profile.characteristics || []).find((o) => o.name === "Troop Type");
  const raw = characteristic && characteristic.$text;
  if (!raw) return null;

  let text = String(raw)
    .toLowerCase()
    .replace(/\s+/g, " ")
    .split(/[,/]/)[0]
    .replace(/\([^)]*\)/g, "")
    .trim();
  if (text === "war beasts") text = "war beast";
  return text in UNIT_STRENGTH_BY_TROOP_TYPE ? text : null;
}

/** Troop type of the entry, then of its ancestors, stopping at the first hit. */
function resolveTroopType(node) {
  let cur = node;
  while (cur) {
    const fromCategory = troopTypeFromCategories(cur);
    if (fromCategory) return fromCategory;
    const fromProfile = troopTypeFromProfile(cur);
    if (fromProfile) return fromProfile;
    cur = cur.parent;
  }
  return null;
}

/** Every "Model" profile reachable from the entry, inlined ones and infoLinks alike. */
function modelProfiles(node) {
  const found = [];
  for (const profile of node.profiles || []) {
    if (profile.typeId === MODEL_PROFILE_TYPE_ID || profile.typeName === "Model") found.push(profile);
  }
  for (const link of node.infoLinks || []) {
    const target = link.target;
    if (!target) continue;
    if (target.typeId === MODEL_PROFILE_TYPE_ID || target.typeName === "Model") found.push(target);
  }
  return found;
}

/**
 * Starting Wounds of the entry, or null.
 * Ridden monsters print the wounds they ADD to their rider rather than their own
 * ("+4", "(+6)"). We take that number — it is what the mount contributes — and flag
 * the entry in the report so the choice stays visible.
 */
function startingWounds(node) {
  for (const profile of modelProfiles(node)) {
    const characteristic = (profile.characteristics || []).find((o) => o.name === "W");
    const raw = characteristic && characteristic.$text;
    if (raw === undefined || raw === null) continue;

    const text = String(raw).trim();
    const plain = text.match(/^(\d+)$/);
    if (plain) return { value: parseInt(plain[1], 10), fromBonus: false };

    const bonus = text.match(/^\(?\+(\d+)\)?$/);
    if (bonus) return { value: parseInt(bonus[1], 10), fromBonus: true };
  }
  return null;
}

/** Does the subtree of `node` contain a mount? */
function hasMount(node) {
  let found = false;
  node.forEachObjectWhitelist((nested) => {
    if (nested === node) return;
    if (found) return;
    const target = nested.target || nested;
    if (typeof target.getType === "function" && target.getType() === "mount") found = true;
    else if ((nested.name || "").toLowerCase() === "mount") found = true;
  });
  return found;
}

function unitStrengthModifier(value) {
  return { comment: MARKER, type: "set", value: value, field: US_COST_TYPE_ID };
}

function dismountModifier() {
  return {
    comment: MARKER,
    type: "multiply",
    value: 0,
    field: US_COST_TYPE_ID,
    conditions: [],
    conditionGroups: [
      {
        type: "or",
        conditions: [
          {
            type: "atLeast",
            value: 1,
            field: "selections",
            scope: "self",
            childId: MOUNT_CATEGORY_ID,
            includeChildSelections: true,
            shared: true,
          },
          {
            type: "atLeast",
            value: 1,
            field: "selections",
            scope: "self",
            childId: "mount",
            includeChildSelections: true,
            shared: true,
          },
        ],
      },
    ],
  };
}

function unitStrengthConstraint(id) {
  return {
    comment: MARKER,
    type: "max",
    value: -1,
    field: US_COST_TYPE_ID,
    scope: "self",
    shared: true,
    includeChildSelections: true,
    id: id,
  };
}

function battleMarchCapModifier(constraintId) {
  return {
    comment: MARKER,
    type: "set",
    value: MAX_UNIT_STRENGTH,
    field: constraintId,
    conditions: [
      {
        type: "instanceOf",
        value: 1,
        field: "selections",
        scope: "ancestor",
        childId: BATTLE_MARCH_FORCE_ID,
        shared: true,
      },
    ],
  };
}

export default {
  name: "Unit Strength",
  description:
    "Sets the Unit Strength cost on every model and mount from its troop type, zeroes a rider " +
    "when it takes a mount, and caps each unit at 20 Unit Strength inside the Battle March force. " +
    "Safe to re-run: it removes its own previous output first.",
  arguments: [{ name: "catalogues", type: "catalogue[]" }],

  async run(catalogues) {
    const report = {
      modelModifiers: 0,
      mountModifiers: 0,
      dismountModifiers: 0,
      unitConstraints: 0,
      removed: 0,
      byTroopType: {},
      unresolvedModels: [],
      unresolvedMounts: [],
      noWounds: [],
      woundsFromBonus: [],
      skippedCrew: 0,
    };

    /** Removes every child of `node[key]` left by a previous run. */
    function clearMarked(node, key) {
      for (const child of [...(node[key] || [])]) {
        if (child.comment === MARKER) {
          if (!DRY_RUN) $store.del_node(child);
          report.removed++;
        }
      }
    }

    function processModelOrMount(node, kind) {
      clearMarked(node, "modifiers");

      const troopType = resolveTroopType(node);
      if (!troopType) {
        (kind === "mount" ? report.unresolvedMounts : report.unresolvedModels).push(pathOf(node));
        return;
      }

      let value = UNIT_STRENGTH_BY_TROOP_TYPE[troopType];
      let label = troopType + " &rarr; US " + value;

      if (value === AS_STARTING_WOUNDS) {
        const wounds = startingWounds(node);
        if (!wounds) {
          report.noWounds.push(pathOf(node) + " [" + troopType + "]");
          return;
        }
        value = wounds.value;
        label = troopType + " &rarr; US = starting wounds";
        if (wounds.fromBonus) report.woundsFromBonus.push(pathOf(node) + " [W " + value + "]");
      }

      if (!DRY_RUN) $store.add_node("modifiers", node, unitStrengthModifier(value));
      bump(report.byTroopType, label);
      if (kind === "mount") report.mountModifiers++;
      else report.modelModifiers++;

      // The rider drops to 0 as soon as a mount is selected: the mount carries the
      // Unit Strength of the pair. Models only — a mount cannot itself be mounted.
      if (kind === "model" && hasMount(node)) {
        if (!DRY_RUN) $store.add_node("modifiers", node, dismountModifier());
        report.dismountModifiers++;
      }
    }

    function processUnit(node) {
      // Reusing the existing id keeps the file stable from one run to the next.
      const previous = (node.constraints || []).find((o) => o.comment === MARKER);
      const constraintId = previous ? previous.id : node.catalogue.generateNonConflictingId();

      clearMarked(node, "constraints");
      clearMarked(node, "modifiers");

      if (!DRY_RUN) {
        $store.add_node("constraints", node, unitStrengthConstraint(constraintId));
        $store.add_node("modifiers", node, battleMarchCapModifier(constraintId));
      }
      report.unitConstraints++;
    }

    for (const catalogue of catalogues) {
      const pending = [];

      catalogue.forEachObjectWhitelist((node) => {
        if (!isRealEntry(node)) return;
        const kind = node.getType();
        if (kind === "model" || kind === "mount") pending.push(() => processModelOrMount(node, kind));
        else if (kind === "unit") pending.push(() => processUnit(node));
        else if (kind === "crew") report.skippedCrew++;
      });

      // Mutations are deferred: add_node / del_node change the very arrays that
      // forEachObjectWhitelist is walking.
      for (const apply of pending) apply();
    }

    const out = [];
    out.push("<h2>" + (DRY_RUN ? "Dry run — nothing was written" : "Unit Strength written") + "</h2>");
    out.push(
      "<ul>" +
        "<li>modifiers on models: <b>" + report.modelModifiers + "</b></li>" +
        "<li>modifiers on mounts: <b>" + report.mountModifiers + "</b></li>" +
        "<li>'mount selected' modifiers: <b>" + report.dismountModifiers + "</b></li>" +
        "<li>units capped at " + MAX_UNIT_STRENGTH + ": <b>" + report.unitConstraints + "</b></li>" +
        "<li>children removed from a previous run: <b>" + report.removed + "</b></li>" +
        "<li><code>crew</code> entries skipped: <b>" + report.skippedCrew + "</b></li>" +
        "</ul>"
    );

    const breakdown = Object.keys(report.byTroopType).sort();
    if (breakdown.length) {
      out.push("<h3>Breakdown</h3>");
      out.push("<ul>" + breakdown.map((k) => "<li>" + k + ": <b>" + report.byTroopType[k] + "</b></li>").join("") + "</ul>");
    }

    function warn(title, lines) {
      if (!lines.length) return;
      out.push("<h3>" + title + " (" + lines.length + ")</h3>");
      out.push("<ul>" + lines.map((o) => "<li>" + o + "</li>").join("") + "</ul>");
    }

    // Ridden monsters whose profile shows a wound BONUS to the rider rather than a
    // standalone W. The bonus is used as the Unit Strength; worth an eyeball.
    warn("Unit Strength taken from a wound bonus, not a standalone W", report.woundsFromBonus);
    warn("'As Starting Wounds' troop types with no readable W, skipped", report.noWounds);
    // Unresolved mounts matter more than unresolved models: the rider still gets its
    // `multiply 0` when one of these is selected, so the pair would contribute 0.
    warn("MOUNTS with no resolvable troop type (they zero their rider)", report.unresolvedMounts);
    warn("Models with no resolvable troop type", report.unresolvedModels);

    return out;
  },
};
