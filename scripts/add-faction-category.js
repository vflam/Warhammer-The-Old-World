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

export default {
  name: "Add Faction Categories",
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
        const category = addCategoryIfNotExists(gst, `Faction: ${cat.name}`);

        if (!category) {
          console.log(cat.name + " has undefined category");
          continue;
        }
        // Arcane Journals dont have shared entries but are allowed magic items from their parent book
        const entries = cat.sharedSelectionEntries || cat.entryLinks;
        if (entries) {
          for (let unit of entries) {
            if (unit.type === "unit" || unit.target?.type === "unit") {
              // Already has category, skip
              if (
                unit.categoryLinks.find((elt) => elt.targetId === category.id)
              ) {
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
