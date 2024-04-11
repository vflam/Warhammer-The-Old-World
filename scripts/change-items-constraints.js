function findCatagory(gst, catName) {
  return gst.categoryEntries.find((elt) => elt.name === catName);
}

function iterateEntries(node) {
  const res = [];

  if (node.selectionEntries) {
    for (let elt of node.selectionEntries) {
      res.push(elt);
    }
  }

  if (node.sharedSelectionEntryGroups) {
    for (let elt of node.sharedSelectionEntryGroups) {
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

function iterateConditions(node) {
  const res = [];

  if (node.conditions) {
    for (let elt of node.conditions) {
      res.push(elt);
    }
  }

  if (node.conditionGroups) {
    for (let elt of node.conditionGroups) {
      const sub = iterateConditions(elt);
      console.log(sub);
      res.push(...sub);
    }
  }

  return res;
}

export default {
  name: "Update Magic Item Constraints",
  arguments: [
    {
      type: "catalogue[]",
    },
  ],

  async run(catalogues) {
    const gst = catalogues[0];
    const items = catalogues.find((elt) => elt.name === "Magic Items");
    const entries = iterateEntries(items);

    for (let item of entries) {
      if (item.hidden && item.modifiers && item.modifiers.length) {
        for (let mod of item.modifiers) {
          if (
            mod.field === "hidden" &&
            mod.type == "set" &&
            mod.value == false
          ) {
            const conditions = iterateConditions(mod);

            for (let cond of conditions) {
              if (
                cond.type == "instanceOf" &&
                cond.scope == "primary-catalogue"
              ) {
                const catalogueId = cond.childId;
                const catalogue = catalogues.find(
                  (elt) => elt.id === catalogueId
                );
                if (catalogue) {
                  const factionCategory = findCatagory(
                    gst,
                    `Faction: ${catalogue.name}`
                  );
                  if (factionCategory) {
                    const newNode = {
                      type: "instanceOf",
                      value: 1,
                      field: "selections",
                      scope: "ancestor",
                      shared: true,
                      childId: factionCategory.id,
                    };

                    $store.edit_node(cond, newNode);
                  }
                }
              }
            }
          }
        }
      }
    }
    console.log("done");
  },
};
