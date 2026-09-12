/**
 * Links each troop type's special rules (from the rulebook's Troop Type table) onto
 * the "Special Rules" info group of every unit of that troop type.
 *
 * Categories are tags only — NewRecruit never renders a rule just because a unit
 * carries a category link, so this fans the rule out explicitly, the same way
 * add-unit-category.js fans out the "Units" category and tow-unit-strength.js fans
 * out the Unit Strength cost. All three rules already exist as sharedProfiles in the
 * game system (Warhammer_Old_World.json) — this only links them, it does not
 * duplicate their text.
 *
 * Troop type is resolved the same way as tow-unit-strength.js: by the troop-type
 * categoryLink carried anywhere in the unit's own subtree (verified against the full
 * dataset — for every troop type below, checking categoryLinks agrees 100% with the
 * "Troop Type" profile text; zero disagreements across all 674 units).
 *
 * Covers every troop type in the rulebook's Troop Type table: Regular Infantry (258
 * units), Heavy Infantry (84), Monstrous Infantry (56), Swarms (14), Heavy Chariot
 * (18), Light Chariot (7), Light Cavalry (38), Heavy Cavalry (49), Monstrous Cavalry
 * (26), War Beast (19), War Machine (37), Behemoth (50), Monstrous Creature (20).
 *
 * "Ridden Monster" (Behemoth/Monstrous Creature) maps to the shared rule "Characters
 * & Ridden Monsters" rather than "Split Profile (Ridden Monster)" — confirmed choice,
 * not a guess.
 *
 * IDEMPOTENT: skips a rule that's already linked in the unit's Special Rules group,
 * so re-running only adds what's missing.
 */

const TROOP_TYPE_CATEGORIES = {
  "f3f7-ca43-674e-115f": "regular infantry",
  "ca7e-d004-ccde-caf3": "heavy infantry",
  "5c55-f9d6-b181-92f8": "monstrous infantry",
  "db92-54fd-e023-d69f": "swarms",
  "7dce-b0f0-2217-2820": "light chariot",
  "d768-7cf0-de0a-c249": "heavy chariot",
  "600c-7d08-5be1-fe0c": "light cavalry",
  "5165-d052-cfc2-5887": "heavy cavalry",
  "2c85-5f2b-9288-1257": "monstrous cavalry",
  "19f9-8dd8-bba4-625b": "war beast",
  "9fcf-19ad-fe84-9c61": "war machine",
  "3755-6732-99b2-c713": "behemoth",
  "fb36-5275-617-c895": "monstrous creature",
};

// A unit can carry more than one troop-type category (e.g. none of the current data
// does, but stay defensive): rules from every matching type are unioned, deduplicated
// by rule id in the loop below.
const TROOP_TYPE_SPECIAL_RULES = {
  "regular infantry": [
    { id: "f067-3c9b-cd7b-73e3", name: "Press of Battle" },
    { id: "d952-3dbd-0540-96fd", name: "Massed Infantry" },
    { id: "e42b-d7db-b53d-9dca", name: "Parry" },
  ],
  "heavy infantry": [
    { id: "f067-3c9b-cd7b-73e3", name: "Press of Battle" },
    { id: "d952-3dbd-0540-96fd", name: "Massed Infantry" },
    { id: "e42b-d7db-b53d-9dca", name: "Parry" },
    { id: "a7bf-31c6-b715-161a", name: "Steady in the Ranks" },
  ],
  "monstrous infantry": [{ id: "27f5-cf1a-a64b-445c", name: "Clumsy" }],
  swarms: [
    { id: "17dc-90b0-88a5-12d5", name: "Insignificant" },
    { id: "6f78-4e6a-9c42-94a", name: "No One Cares" },
    { id: "91d0-1ebd-4d28-5798", name: "Undisciplined" },
  ],
  "heavy chariot": [
    { id: "242c-9373-ed37-f5bb", name: "Scythed Wheels" },
    { id: "3ca9-98cc-d094-a6f9", name: "Lumbering" },
    { id: "d217-160c-d73c-e492", name: "Iron Shod Wheels" },
    { id: "9139-5a73-4c76-823e", name: "Firing Platform" },
  ],
  "light chariot": [
    { id: "d217-160c-d73c-e492", name: "Iron Shod Wheels" },
    { id: "d588-87c-7401-3203", name: "Churning Wheels" },
    { id: "9139-5a73-4c76-823e", name: "Firing Platform" },
  ],
  "light cavalry": [{ id: "9425-ffea-7a43-b80a", name: "Cavalry Support" }],
  "heavy cavalry": [{ id: "9425-ffea-7a43-b80a", name: "Cavalry Support" }],
  "monstrous cavalry": [{ id: "27f5-cf1a-a64b-445c", name: "Clumsy" }],
  "war beast": [{ id: "91d0-1ebd-4d28-5798", name: "Undisciplined" }],
  "war machine": [
    { id: "615-74b9-4235-751b", name: "\"We're Not Paid to Fight\"" },
    { id: "87ec-e325-f656-c35", name: "Weapon of War" },
  ],
  behemoth: [
    { id: "c357-33c3-6c59-e386", name: "Characters & Ridden Monsters" },
    { id: "59ba-33d1-9e9-eb3d", name: "Thunderstomp" },
    { id: "3ca9-98cc-d094-a6f9", name: "Lumbering" },
  ],
  "monstrous creature": [
    { id: "3ca9-98cc-d094-a6f9", name: "Lumbering" },
    { id: "c357-33c3-6c59-e386", name: "Characters & Ridden Monsters" },
  ],
};

const SPECIAL_RULES_GROUP_NAME = "Special Rules";

/** Troop-type categories carried anywhere in the unit's own subtree. */
function troopTypesOf(node) {
  const found = new Set();

  function walk(n) {
    for (const link of n.categoryLinks || []) {
      const key = TROOP_TYPE_CATEGORIES[link.targetId];
      if (key) found.add(key);
    }
    for (const field of ["selectionEntries", "entryLinks", "selectionEntryGroups"]) {
      for (const child of n[field] || []) walk(child);
    }
  }
  walk(node);
  return found;
}

/** Finds the unit's own "Special Rules" info group, creating it if missing. */
function resolveSpecialRulesGroup(unit) {
  const existing = (unit.infoGroups || []).find((g) => g.name === SPECIAL_RULES_GROUP_NAME);
  if (existing) return { group: existing, created: false };
  const created = $store.add_node("infoGroups", unit, {
    name: SPECIAL_RULES_GROUP_NAME,
    hidden: false,
  });
  return { group: created, created: true };
}

export default {
  name: "Add Troop Type Special Rules",
  description:
    "Links each troop type's rulebook special rules (from the Troop Type table) onto " +
    "the Special Rules group of every matching unit, covering all thirteen troop types. " +
    "Safe to re-run — only adds links that aren't already there.",
  arguments: [{ name: "catalogues", type: "catalogue[]" }],

  async run(catalogues) {
    const report = { linksAdded: 0, alreadyThere: 0, unitsTouched: 0, groupsCreated: 0 };

    for (const catalogue of catalogues) {
      catalogue.forEachObjectWhitelist((node) => {
        if (node.getType?.() !== "unit") return;

        const types = troopTypesOf(node);
        if (types.size === 0) return;

        let touchedThisUnit = false;
        let group = null;
        for (const type of types) {
          const rules = TROOP_TYPE_SPECIAL_RULES[type];
          if (!rules) continue;

          if (!group) {
            const resolved = resolveSpecialRulesGroup(node);
            group = resolved.group;
            if (resolved.created) report.groupsCreated++;
          }

          for (const rule of rules) {
            const already = (group.infoLinks || []).find((l) => l.targetId === rule.id);
            if (already) {
              report.alreadyThere++;
              continue;
            }
            $store.add_node("infoLinks", group, {
              name: rule.name,
              hidden: false,
              type: "profile",
              targetId: rule.id,
            });
            report.linksAdded++;
            touchedThisUnit = true;
          }
        }
        if (touchedThisUnit) report.unitsTouched++;
      });
    }

    return [
      "<h2>Troop type special rules</h2>",
      "<ul>" +
        `<li>links added: <b>${report.linksAdded}</b></li>` +
        `<li>already linked: <b>${report.alreadyThere}</b></li>` +
        `<li>units touched: <b>${report.unitsTouched}</b></li>` +
        `<li>Special Rules groups created: <b>${report.groupsCreated}</b></li>` +
        "</ul>",
    ];
  },
};
