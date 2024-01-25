/**
 * This file is a script to automatically fill the `sortIndex` field in selection entries so that they are correctly sorted in New Recruit.
 * USAGE:
 *   1. Open a catalogue of the system you want to use this script on in the NewRecruit Data Editor
 *   2. Open the Devtools and naviguate to the Console Tab
 *   3. Copy and Paste this script in the Console and press enter.
 **/

check = (cats) => {
  function sortByAscending(array, getKey) {
    return [...array].sort((a, b) =>
      (getKey(a) ?? "")
        .toString()
        .localeCompare((getKey(b) ?? "").toString(), undefined, {
          numeric: true,
        })
    );
  }
  function sortByAscendingInplace(array, getKey) {
    return array.sort((a, b) =>
      (getKey(a) ?? "")
        .toString()
        .localeCompare((getKey(b) ?? "").toString(), undefined, {
          numeric: true,
        })
    );
  }
  function getSortIndex(entry) {
    const type = entry.isGroup() ? "group" : entry.getType();
    const name = entry.getName().toLowerCase();
    switch (type) {
      case "model":
        return 10;
      case "mount":
        return 20;
      case "crew":
        return 30;
      case "upgrade":
        return 40;
      case "entry":
        return 45;
      case "group": {
        if (name === "detachment") return 46;
        if (name === "command") return 47;
        if (name === "mount") return 50;
        if (name === "vow") return 51;
        if (name === "virtues") return 52;
        if (name === "wizard level") return 53;
        if (name === "lore of magic") return 54;
        if (name === "lores of magic") return 54;
        if (name.includes("weapon")) return 60;
        if (name.includes("armour")) return 70;
        if (name.includes("equipment")) return 80;
        if (name.includes("item")) return 90;
        if (name.includes("options")) return 100;
        return 20000;
      }
      default:
        return undefined;
    }
  }
  function addEntry(entry, groups) {
    const index = getSortIndex(entry);
    if (!groups[index]) groups[index] = [];
    groups[index].push(entry);
    entry.sortIndex = index;
    $store.set_catalogue_changed(entry.catalogue);
  }
  function fixupIndexes(groups) {
    let count = 0;
    for (const [idx, entries] of sortByAscending(
      Object.entries(groups),
      (o) => o[0]
    )) {
      sortByAscendingInplace(
        entries,
        (entry) => entry.getCosts().find((o) => o.name === "pts")?.value
      );
      for (const entry of entries) {
        if (idx) {
          count += 1;
          entry.sortIndex = count;
        } else {
          delete entry.sortIndex;
        }
      }
    }
  }
  function sortChilds(cur) {
    const groups = {};
    for (const entry of cur.selectionsIterator()) {
      addEntry(entry, groups);
    }
    fixupIndexes(groups);
  }

  for (const cat of Array.isArray(cats) ? cats : [cats]) {
    for (const cur of cat.units) {
      cur.forEach((node) => {
        if ([...node.selectionsIterator()].length > 1) {
          sortChilds(node);
        }
      });
    }
  }
};

// ALL
$catalogue.manager.loadAll().then(() => {
  const cats = $catalogue.manager.getAllLoadedCatalogues();
  cats.forEach((o) => o.process());
  check(cats);
});

// CURRENT
// $catalogue.process()
// check($catalogue)
