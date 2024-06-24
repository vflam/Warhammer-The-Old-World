function addCategoryIfNotExists(gst, catName) {
  const existing = gst.categoryEntries.find((elt) => elt.name === catName);
  if (existing) {
    return existing;
  }
  const newNode = {
    hidden: true,
    name: catName,
  };

  return $store.add_node("categoryEntries", gst, newNode);
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

export default {
  name: "Add Unit Category",
  arguments: [
    {
      type: "catalogue[]",
    },
  ],

  async run(catalogues) {
    const gst = catalogues[0];
    console.log(catalogues);

    for (let cat of catalogues) {
      if (cat.library == false) {
        const category = addCategoryIfNotExists(gst, `Units`);

        if (!category) {
          console.log(cat.name + " has undefined category");
          continue;
        }
        // Arcane Journals dont have shared entries but are allowed magic items from their parent book
        const entries = cat.selectionEntries || cat.entryLinks;
        if (entries) {
          for (let unit of entries) {
            if (unit.type === "unit" || unit.target?.type === "unit") {
              // Already has category, skip
              if (
                unit.categoryLinks.find((elt) => elt.targetId === category.id)
              ) {
                continue;
              }
              const nocats = [
                "War Machine",
                "Swarms",
                "War Beast",
                "Characters",
              ];

              let found = false;
              for (let noc of nocats) {
                const entries = iterateEntries(unit);

                for (let entry of entries) {
                  if (
                    entry.categoryLinks &&
                    entry.categoryLinks.find((elt) => elt.name === noc)
                  ) {
                    found = true;
                    break;
                  }
                }
                if (found) {
                  break;
                }
              }

              if (found) {
                continue;
              }

              $store.add_node("categoryLinks", unit, {
                name: category.name,
                primary: false,
                targetId: category.id,
              });
            }
          }
        } else {
          console.log(`${cat.name} does not have entries`);
        }
      }
    }
  },
};
