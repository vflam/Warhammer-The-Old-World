/**
 * Links the hidden "Units" category onto every unit of every non-library catalogue.
 *
 * Units whose subtree carries War Machine, Swarms, War Beast or Characters are skipped —
 * that exclusion is exactly what the category's full name spells out.
 *
 * IDEMPOTENCE — this script used to create a duplicate category on every run. It looked
 * the category up by the exact name "Units", but the one it had created was later
 * renamed to "Units (not including units whose troop type is 'swarms', 'war beasts' or
 * 'war machines')". Not finding that name, it made a fresh "Units" each time. It now
 * resolves the category by ID, falls back to a name prefix, and only creates one as a
 * last resort — saying so loudly in the report when it does.
 *
 * Two other fixes came with it: root entries with no `categoryLinks` array at all (24 of
 * them) used to throw on `unit.categoryLinks.find(...)`, and the run reported nothing.
 *
 * Note on coverage: root entries are read from `selectionEntries || entryLinks`, so in
 * catalogues that expose `sharedSelectionEntries` the category lands on the root
 * entryLink rather than on the shared entry. That matches where the primary categories
 * were moved, so it is left as-is.
 */

const UNITS_CATEGORY_ID = "fec1-537a-bbeb-7926";
const UNITS_CATEGORY_NAME_PREFIX = "Units";
const EXCLUDED_CATEGORY_NAMES = ["War Machine", "Swarms", "War Beast", "Characters"];

/**
 * The Units category, resolved by id first so a rename cannot hide it.
 * `created` tells the report a new one had to be made, which should never happen.
 */
function resolveUnitsCategory(gst) {
  const entries = gst.categoryEntries || [];

  const byId = entries.find((elt) => elt.id === UNITS_CATEGORY_ID);
  if (byId) return { category: byId, created: false };

  const byName = entries.find((elt) => (elt.name || "").startsWith(UNITS_CATEGORY_NAME_PREFIX));
  if (byName) return { category: byName, created: false };

  const created = $store.add_node("categoryEntries", gst, {
    hidden: true,
    name: UNITS_CATEGORY_NAME_PREFIX,
  });
  return { category: created, created: true };
}

function iterateEntries(param) {
  const res = [];
  const node = param.target || param;

  res.push(param);

  if (node.selectionEntries) {
    for (let elt of node.selectionEntries) {
      res.push(...iterateEntries(elt));
    }
  }

  if (node.entryLinks) {
    for (let elt of node.entryLinks) {
      res.push(...iterateEntries(elt));
    }
  }

  if (node.selectionEntryGroups) {
    for (let elt of node.selectionEntryGroups) {
      res.push(...iterateEntries(elt));
    }
  }

  return res;
}

/** Does the unit's subtree carry one of the categories that disqualify it? */
function isExcluded(unit) {
  for (const entry of iterateEntries(unit)) {
    for (const link of entry.categoryLinks || []) {
      if (EXCLUDED_CATEGORY_NAMES.indexOf(link.name) !== -1) return true;
    }
  }
  return false;
}

export default {
  name: "Add Unit Category",
  description:
    "Links the hidden Units category onto every unit, skipping those whose subtree carries War " +
    "Machine, Swarms, War Beast or Characters. Safe to re-run.",
  arguments: [
    {
      name: "catalogues",
      type: "catalogue[]",
    },
  ],

  async run(catalogues) {
    const gst = catalogues[0];
    const { category, created } = resolveUnitsCategory(gst);

    const report = { added: 0, alreadyThere: 0, excluded: 0, skippedCatalogues: [] };

    for (const cat of catalogues) {
      if (cat.library !== false) continue;

      // Arcane Journals have no shared entries but link their parent book's.
      const entries = cat.selectionEntries || cat.entryLinks;
      if (!entries) {
        report.skippedCatalogues.push(cat.name + " (no root entries)");
        continue;
      }

      for (const unit of entries) {
        if (unit.type !== "unit" && unit.target?.type !== "unit") continue;

        // Guard: some root entries carry no categoryLinks array at all.
        if ((unit.categoryLinks || []).find((elt) => elt.targetId === category.id)) {
          report.alreadyThere++;
          continue;
        }

        if (isExcluded(unit)) {
          report.excluded++;
          continue;
        }

        $store.add_node("categoryLinks", unit, {
          name: category.name,
          primary: false,
          targetId: category.id,
        });
        report.added++;
      }
    }

    const out = [];
    out.push("<h2>Unit category</h2>");
    if (created) {
      out.push(
        '<p style="color: red"><b>A new "Units" category was created.</b> The expected one (<code>' +
          UNITS_CATEGORY_ID +
          "</code>) was not found — check the game system before saving.</p>"
      );
    }
    out.push(
      "<ul>" +
        "<li>category used: <b>" + category.name + "</b> <code>" + category.id + "</code></li>" +
        "<li>links added: <b>" + report.added + "</b></li>" +
        "<li>already linked: <b>" + report.alreadyThere + "</b></li>" +
        "<li>excluded by troop type: <b>" + report.excluded + "</b></li>" +
        "</ul>"
    );
    if (report.skippedCatalogues.length) {
      out.push("<h3>Catalogues with no root entries (" + report.skippedCatalogues.length + ")</h3>");
      out.push("<ul>" + report.skippedCatalogues.map((o) => "<li>" + o + "</li>").join("") + "</ul>");
    }
    return out;
  },
};
