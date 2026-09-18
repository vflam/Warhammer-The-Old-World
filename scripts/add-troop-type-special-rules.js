/**
 * Links each troop type's rulebook special rules onto every matching unit AND
 * mount — correctly handling mounted characters this time.
 *
 * A mounted character's rider model stays present in the roster even once a
 * mount is chosen (the mount is an additional selection, not a replacement),
 * so simply linking the rider's troop-type rules unconditionally leaves e.g.
 * Press of Battle sitting on a unit whose effective troop type is now Light
 * Cavalry.
 *
 *  - MOUNTS get their own troop type's rules linked conditionally to the
 *    matching mount selection.
 *  - MODELS get their rider rules linked onto the ancestor unit, with the
 *    rider's base troop-type rules hidden whenever any mount is selected.
 *
 * Covers all thirteen troop types from the rulebook's Troop Type table.
 * IDEMPOTENT — skips a rule already linked in a node's Special Rules group.
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

  "monstrous infantry": [
    { id: "27f5-cf1a-a64b-445c", name: "Clumsy" },
  ],

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

  "light cavalry": [
    { id: "9425-ffea-7a43-b80a", name: "Cavalry Support" },
  ],

  "heavy cavalry": [
    { id: "9425-ffea-7a43-b80a", name: "Cavalry Support" },
  ],

  "monstrous cavalry": [
    { id: "27f5-cf1a-a64b-445c", name: "Clumsy" },
  ],

  "war beast": [
    { id: "91d0-1ebd-4d28-5798", name: "Undisciplined" },
  ],

  "war machine": [
    { id: "615-74b9-4235-751b", name: "\"We're Not Paid to Fight\"" },
    { id: "87ec-e325-f656-c35", name: "Weapon of War" },
  ],

  behemoth: [
    { id: "59ba-33d1-9e9-eb3d", name: "Thunderstomp" },
    { id: "3ca9-98cc-d094-a6f9", name: "Lumbering" },
  ],

  "monstrous creature": [
    { id: "3ca9-98cc-d094-a6f9", name: "Lumbering" },
  ],
};

const SPECIAL_RULES_GROUP_NAME = "Special Rules";

const MOUNT_CATEGORY_ID = "c96a-608-5de4-b943";

const UNIT_PROFILE_TYPE_ID = "2878-9a1f-dd74-48e3";

function isRealEntry(node) {
  if (!node || typeof node.getType !== "function") return false;

  if (node.isLink && node.isLink()) return false;

  return true;
}

/**
 * Direct categoryLinks on this node's own definition.
 */
function ownTroopTypes(node) {
  const found = new Set();

  for (const link of node.categoryLinks || []) {
    const key = TROOP_TYPE_CATEGORIES[link.targetId];

    if (key) found.add(key);
  }

  return found;
}

/**
 * Troop type carried by the entry's own Unit profile.
 */
function troopTypeFromProfile(node) {
  const profiles = [...(node.profiles || [])];

  for (const link of node.infoLinks || []) {
    if (link.target) profiles.push(link.target);
  }

  const profile = profiles.find((entry) =>
    (entry.characteristics || []).some(
      (characteristic) => characteristic.name === "Troop Type"
    )
  );

  const characteristic =
    profile &&
    (profile.characteristics || []).find(
      (entry) => entry.name === "Troop Type"
    );

  const raw = characteristic && characteristic.$text;

  if (!raw) return null;

  let text = String(raw)
    .toLowerCase()
    .replace(/\s+/g, " ")
    .split(/[,/]/)[0]
    .replace(/\([^)]*\)/g, "")
    .trim();

  if (text === "war beasts") text = "war beast";

  return Object.prototype.hasOwnProperty.call(
    TROOP_TYPE_SPECIAL_RULES,
    text
  )
    ? text
    : null;
}

function isSpecialFeatureUnit(node) {
  const profiles = [...(node.profiles || [])];

  for (const link of node.infoLinks || []) {
    if (link.target) profiles.push(link.target);
  }

  const profile = profiles.find(
    (entry) =>
      entry.typeName === "Unit" || entry.typeId === UNIT_PROFILE_TYPE_ID
  );

  const characteristic =
    profile &&
    (profile.characteristics || []).find(
      (entry) => entry.name === "Troop Type"
    );

  const raw = characteristic && characteristic.$text;

  return !!raw && /special feature/i.test(String(raw));
}

function shouldSkipUnresolved(node, typeSet) {
  if (typeSet.size > 0) return false;

  if (
    node &&
    typeof node.getType === "function" &&
    node.getType() === "unit" &&
    isSpecialFeatureUnit(node)
  ) {
    return true;
  }

  const kind =
    node && typeof node.getType === "function" ? node.getType() : null;

  if (kind === "mount") return true;

  if (node && (node.subType === "mount" || node.name === "Mount")) return true;

  return false;
}

function troopTypesAtNode(node) {
  const fromProfile = troopTypeFromProfile(node);

  const found = new Set();

  if (fromProfile) found.add(fromProfile);

  for (const type of ownTroopTypes(node)) {
    found.add(type);
  }

  return found;
}

function isMountNode(node) {
  return (
    node &&
    typeof node.getType === "function" &&
    node.getType() === "mount"
  );
}

/**
 * Returns true when `nested` (an entryLink or similar wrapper) represents a
 * selectable mount option — either because its resolved target is a mount
 * subtype, OR because the link itself carries the MOUNT category (used for
 * chariot mounts that are plain model entries, not subType:"mount").
 */
function isMountLink(nested) {
  const candidate = nested.target || nested;
  if (isMountNode(candidate)) return true;
  if (nested !== candidate) {
    for (const cl of nested.categoryLinks || []) {
      if (cl.targetId === MOUNT_CATEGORY_ID) return true;
    }
  }
  return false;
}

/**
 * Collect troop types for a mount link, checking both the shared entry and
 * the entryLink's own categoryLinks (which carry the type when categories
 * live on the link rather than the shared entry).
 */
function troopTypesAtMountLink(nested) {
  const candidate = nested.target || nested;
  const found = new Set();
  for (const type of troopTypesAtNode(candidate)) found.add(type);
  if (nested !== candidate) {
    for (const type of ownTroopTypes(nested)) found.add(type);
  }
  return found;
}

function resolveTroopTypes(node) {
  /**
   * For models that have selectable mounts, use the mount troop types
   * instead of the model/unit's infantry troop type.
   */
  if (node.getType && node.getType() === "model" && hasSelectableMount(node)) {
    const mountTypes = new Set();

    node.forEachObjectWhitelist((nested) => {
      if (nested === node) return;

      if (!isMountLink(nested)) return;

      for (const type of troopTypesAtMountLink(nested)) {
        mountTypes.add(type);
      }
    });

    if (mountTypes.size > 0) return mountTypes;
  }

  let current = node;

  while (current) {
    const found = troopTypesAtNode(current);

    if (found.size > 0) return found;

    current = current.parent;
  }

  let descendantTypes = new Set();

  node.forEachObjectWhitelist((nested) => {
    if (descendantTypes.size > 0 || nested === node) return;

    const candidate = nested.target || nested;

    if (isMountNode(candidate)) return;

    descendantTypes = troopTypesAtNode(candidate);
  });

  if (descendantTypes.size > 0) return descendantTypes;

  return new Set();
}

/**
 * Returns true only when the node has a selectable "Mount" group — i.e. a
 * child selection-entry-group named "Mount" that is not itself a mount node.
 * Character models have this; chariot models with beast crew do not.
 */
function hasSelectableMount(node) {
  let found = false;

  node.forEachObjectWhitelist((nested) => {
    if (found || nested === node) return;

    const candidate = nested.target || nested;

    if (
      candidate &&
      (candidate.name || "").toLowerCase() === "mount" &&
      candidate.getType?.() !== "mount"
    ) {
      found = true;
    }
  });

  return found;
}

/**
 * Same "can this be mounted" check as tow-unit-strength.js's hasMount().
 */
function hasMount(node) {
  let found = false;

  node.forEachObjectWhitelist((nested) => {
    if (nested === node || found) return;

    const target = nested.target || nested;

    if (
      typeof target.getType === "function" &&
      target.getType() === "mount"
    ) {
      found = true;
    } else if ((nested.name || "").toLowerCase() === "mount") {
      found = true;
    }
  });

  return found;
}

/**
 * Same dual mount-indicator check as dismountModifier() elsewhere in this repo.
 */
function mountedConditionGroup() {
  return {
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
  };
}

function mountedConditionGroupForMount(mount) {
  if (!mount || !mount.id) {
    return mountedConditionGroup();
  }

  return {
    type: "or",

    conditions: [
      {
        type: "atLeast",
        value: 1,
        field: "selections",
        scope: "self",
        childId: mount.id,
        includeChildSelections: true,
        shared: true,
      },
    ],
  };
}

/**
 * Determine whether a unit is a character without relying on the global
 * "Characters" category being present on the runtime unit itself.
 *
 * Character units have a model descendant carrying a catalogue category
 * other than the troop-type categories. This accommodates faction-specific
 * character categories such as:
 *
 *   BEAST LORD OR WARGOR
 *   BEASTMAN CHIEFTAIN OR BEASTMAN SHAMAN
 *
 * rather than hard-coding those names.
 */
function isCharacterUnit(node) {
  if (!node || node.getType?.() !== "unit") return false;

  let hasMountSelection = false;

  node.forEachObjectWhitelist((nested) => {
    if (hasMountSelection || nested === node) return;

    const candidate = nested.target || nested;

    if (!candidate) return;
    if (candidate.name === "Mount" && candidate.getType?.() !== "mount") {
      hasMountSelection = true;
    }
  });
  return hasMountSelection;
}

function resolveSpecialRulesGroup(node) {
  const existing = (node.infoGroups || []).find(
    (g) => g.name === SPECIAL_RULES_GROUP_NAME
  );

  if (existing) {
    return {
      group: existing,
      created: false,
    };
  }

  const created = $store.add_node("infoGroups", node, {
    name: SPECIAL_RULES_GROUP_NAME,
    hidden: false,
  });

  return {
    group: created,
    created: true,
  };
}

/**
 * Links rules onto node's Special Rules group.
 *
 * If conditional:
 *
 *   hideWhenMounted === true
 *     The rule starts visible and becomes hidden when any mount is selected.
 *
 *   hideWhenMounted === false
 *     The rule starts hidden and becomes visible when one of the supplied
 *     matching mounts is selected.
 */
function linkRules(
  node,
  rules,
  conditional,
  report,
  mounts = [],
  hideWhenMounted = false
) {
  if (!rules || rules.length === 0) return;

  if (!Array.isArray(mounts)) {
    mounts = mounts ? [mounts] : [];
  }

  const { group, created } = resolveSpecialRulesGroup(node);

  if (created) {
    report.groupsCreated++;
  }

  let touched = false;

  for (const rule of rules) {
    const existing = (group.infoLinks || []).find(
      (l) => l.targetId === rule.id
    );

    if (existing) {
      report.alreadyThere++;
      continue;
    }

    const link = $store.add_node("infoLinks", group, {
      name: rule.name,
      hidden: conditional && !hideWhenMounted,
      type: "profile",
      targetId: rule.id,
    });

    if (conditional) {
      if (hideWhenMounted) {
        $store.add_node("modifiers", link, {
          type: "set",
          value: true,
          field: "hidden",
          conditions: [],
          conditionGroups: [mountedConditionGroup()],
        });
      } else {
        const conditions = mounts
          .filter((m) => m && (m.id || m.linkId))
          .map((m) => {
            const useLink = m.linkId != null;
            return {
              type: "atLeast",
              value: 1,
              field: "selections",
              scope: "self",
              childId: useLink ? m.linkId : m.id,
              includeChildSelections: true,
              shared: !useLink,
            };
          });

        $store.add_node("modifiers", link, {
          type: "set",
          value: false,
          field: "hidden",
          conditions: [],
          conditionGroups: [
            {
              type: "or",
              conditions,
            },
          ],
        });
      }
    }

    report.linksAdded++;
    touched = true;
  }

  if (touched) {
    report.entriesTouched++;
  }
}

function findAncestorUnit(node) {
  let cur = node.parent;

  while (
    cur &&
    (typeof cur.getType !== "function" || cur.getType() !== "unit")
  ) {
    cur = cur.parent;
  }

  return cur;
}

export default {
  name: "Add Troop Type Special Rules",

  description:
    "Links each troop type's rulebook special rules onto every matching unit and " +
    "mount, hiding a rider's base rules once a mount is selected. Covers all " +
    "thirteen troop types. Safe to re-run — only adds links that aren't already there.",

  arguments: [
    {
      name: "catalogues",
      type: "catalogue[]",
    },
  ],

  async run(catalogues) {
    const report = {
      linksAdded: 0,
      alreadyThere: 0,
      entriesTouched: 0,
      groupsCreated: 0,
      mountsProcessed: 0,
      unitsProcessed: 0,
      unresolved: [],
    };

    for (const catalogue of catalogues) {
      const pending = [];

      catalogue.forEachObjectWhitelist((node) => {
        const ancestors = [];

        if (!isRealEntry(node)) return;

        const kind = node.getType();

        if (kind !== "unit" && kind !== "model" && kind !== "mount") {
          return;
        }

        const types = resolveTroopTypes(node);

        if (types.size === 0) {
          if (shouldSkipUnresolved(node, types)) return;

          report.unresolved.push(
            `${kind}: ${node.name || "(unnamed)"}`
          );

          return;
        }

        const unit =
          kind === "unit" ? node : findAncestorUnit(node);

        if (!unit) return;

        const guarded = hasMount(node);

        pending.push(() => {
          /**
           * Mount nodes.
           *
           * The mount itself is only present in a built roster once selected,
           * so its own troop-type rules can be linked directly.
           */
          if (kind === "mount") {
            /**
             * Mounts inside non-character units (cavalry horses, chariot crew)
             * are handled by the unit branch. Skipping here prevents mount
             * troop-type rules from bleeding into chariot units after shared
             * mount models received their own troop-type category links.
             *
             * For character units the model branch already adds conditional
             * rules (fires earlier in DFS order), so the unconditional add
             * below becomes a no-op via the idempotency check in linkRules.
             */
            if (!isCharacterUnit(unit)) return;

            let any = false;

            for (const type of types) {
              const rules = TROOP_TYPE_SPECIAL_RULES[type];

              if (!rules) continue;

              if (guarded) {
                node.forEachObjectWhitelist((nested) => {
                  if (nested === node) return;

                  const mount = nested.target || nested;

                  if (!isMountNode(mount)) return;

                  const mountTypes = troopTypesAtNode(mount);

                  if (!mountTypes.has(type)) return;

                  linkRules(
                    unit,
                    rules,
                    true,
                    report,
                    mount
                  );

                  any = true;
                });
              } else {
                linkRules(
                  unit,
                  rules,
                  false,
                  report
                );

                any = true;
              }
            }

            if (any) {
              report.mountsProcessed++;
            }

            return;
          }

          /**
           * Unit nodes.
           *
           * Mounted character units are deliberately skipped here.
           * Their rules are attached by the model branch below, because
           * the rider remains in the roster after a mount is selected.
           */
          if (kind === "unit") {
            if (hasMount(node) && isCharacterUnit(node, report)) {
              return;
            }

            let any = false;

            for (const type of types) {
              const rules = TROOP_TYPE_SPECIAL_RULES[type];

              if (!rules) continue;

              linkRules(
                node,
                rules,
                false,
                report
              );

              any = true;
            }

            if (any) {
              report.unitsProcessed++;
            }

            return;
          }

          /**
           * Model nodes.
           *
           * Rules are attached to the ancestor unit.
           *
           * For a mountable character:
           *
           *   - rider's own troop-type rules are visible on foot and hidden
           *     once any mount is selected.
           *
           *   - mount-derived rules remain hidden until their matching mount
           *     is selected.
           */
          let any = false;

          if (guarded) {
            const baseTypes = troopTypesAtNode(node);
            const allMounts = [];
            const mountTypeMap = new Map(); // mount.id → Set of troop types

            // Collect only the top-level mount options from the Mount selection
            // group. Deep traversal (forEachObjectWhitelist) would also visit
            // sub-entries of chariot models (e.g. the War Boar inside an Orc
            // Boar Chariot), which share the same shared-entry id as the
            // directly-selectable War Boar, causing CS to fire incorrectly when
            // the chariot is picked.
            let mountGroupNode = null;
            node.forEachObjectWhitelist((nested) => {
              if (mountGroupNode || nested === node) return;
              const candidate = nested.target || nested;
              if (
                (candidate?.name || "").toLowerCase() === "mount" &&
                candidate.getType?.() !== "mount"
              ) {
                mountGroupNode = candidate;
              }
            });

            if (mountGroupNode) {
              const directLinks = [
                ...(mountGroupNode.entryLinks || []),
                ...(mountGroupNode.selectionEntries || []),
              ];
              for (const el of directLinks) {
                if (!isMountLink(el)) continue;
                const target = el.target || el;
                if (!target?.id) continue;
                // Store the entryLink id alongside the shared entry so the
                // condition can target the specific mount option (shared:false)
                // rather than any selection that resolves to the same shared
                // entry id (shared:true).
                allMounts.push({ linkId: el.id, id: target.id, target });
                mountTypeMap.set(target.id, troopTypesAtMountLink(el));
              }
            }

            /**
             * Character's own Infantry rules:
             * visible on foot, hidden whenever any mount is selected.
             */
            for (const type of baseTypes) {
              const rules = TROOP_TYPE_SPECIAL_RULES[type];

              if (!rules) continue;

              linkRules(
                unit,
                rules,
                true,
                report,
                allMounts,
                true
              );

              any = true;
            }

            /**
             * Mount-derived rules:
             * hidden until the specific matching mount is selected.
             *
             * Aggregate mounts per rule ID across all types first — several
             * troop types share the same rule (e.g. "Cavalry Support" appears
             * for both light and heavy cavalry). Calling linkRules separately
             * for each type would cause the second call to be silently skipped
             * by the idempotency check, leaving the rule conditioned only on
             * the first type's mounts.
             */
            const ruleToMounts = new Map(); // rule.id → { rule, mounts: Set }

            for (const type of types) {
              const rules = TROOP_TYPE_SPECIAL_RULES[type];

              if (!rules) continue;

              const matchingMounts = allMounts.filter((m) =>
                (mountTypeMap.get(m.id) || troopTypesAtNode(m.target || m)).has(type)
              );

              if (matchingMounts.length === 0) continue;

              for (const rule of rules) {
                if (!ruleToMounts.has(rule.id)) {
                  ruleToMounts.set(rule.id, { rule, mounts: new Set() });
                }
                for (const mount of matchingMounts) {
                  ruleToMounts.get(rule.id).mounts.add(mount);
                }
              }
            }

            for (const { rule, mounts } of ruleToMounts.values()) {
              linkRules(unit, [rule], true, report, [...mounts]);
              any = true;
            }
          } else {
            for (const type of types) {
              const rules = TROOP_TYPE_SPECIAL_RULES[type];

              if (!rules) continue;

              linkRules(
                unit,
                rules,
                false,
                report
              );

              any = true;
            }
          }

          if (any) {
            report.unitsProcessed++;
          }
        });

      });

      /**
       * Mutations are deferred because add_node changes the arrays that
       * forEachObjectWhitelist is walking.
       */
      for (const apply of pending) {
        apply();
      }
    }

    return [
      "<h2>Troop type special rules</h2>",

      "<ul>" +

      `<li>links added: <b>${report.linksAdded}</b></li>` +

      `<li>already linked: <b>${report.alreadyThere}</b></li>` +

      `<li>models/units touched: <b>${report.entriesTouched}</b></li>` +

      `<li>mounts processed: <b>${report.mountsProcessed}</b></li>` +

      `<li>units processed: <b>${report.unitsProcessed}</b></li>` +

      `<li>unresolved entries: <b>${report.unresolved.length}</b></li>` +

      `<li>Special Rules groups created: <b>${report.groupsCreated}</b></li>` +

      "</ul>",

      report.unresolved.length
        ? "<h3>Unresolved entries</h3><ul>" +
        report.unresolved
          .map((entry) => `<li>${entry}</li>`)
          .join("") +
        "</ul>"
        : "",
    ];
  },
};