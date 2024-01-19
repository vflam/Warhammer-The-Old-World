
check = (cats) => {
    function sortByAscending(array, getKey) {
      return [...array].sort((a,b) => (getKey(a) ?? "").toString().localeCompare((getKey(b) ?? "").toString(), undefined, { numeric: true }))
    }
    function sortByAscendingInplace(array, getKey) {
      return array.sort((a,b) => (getKey(a) ?? "").toString().localeCompare((getKey(b) ?? "").toString(), undefined, { numeric: true }))
    }
    function getSortIndex(entry){
      const type = entry.isGroup() ? "group" : entry.getType();
      const name = entry.getName().toLowerCase()
      switch(type) {
        case "model": return 1
        case "mount": return 2
        case "crew": return 3
        case "upgrade": return 4
        case "group": {
          if (name === "mount") return 5;
          if (name.includes('weapons')) return 6;
          if (name.includes('armour')) return 7;
          if (name.includes('equipment')) return 8;
          if (name.includes('items')) return 9;
          if (name.includes('options')) return 10;
          return 11;
        }
        default: return undefined
      }
    }
    function addEntry(entry, groups){
      const index = getSortIndex(entry) 
      if (!groups[index]) groups[index] = []
      groups[index].push(entry)
      entry.sortIndex = index;
      $store.set_catalogue_changed(entry.catalogue)
    }
    function fixupIndexes(groups) {
      let count = 0
      for (const [idx, entries] of sortByAscending(Object.entries(groups), o => o[0])) {
        sortByAscendingInplace(entries, entry => entry.getCosts().find(o => o.name === "pts")?.value);
        for (const entry of entries){
          if (idx){
            count += 1;
            entry.sortIndex = count;
          } else {
            delete entry.sortIndex
          }
        }
      }
    }
    function sortChilds(cur) {
      const groups = {}
      for (const entry of cur.selectionsIterator()) {
        addEntry(entry, groups)
      }
      fixupIndexes(groups)
    }

    for (const cat of Array.isArray(cats) ? cats : [cats]) {
      for (const cur of cat.units) {
        cur.forEach(node => {
          if ([...node.selectionsIterator()].length > 1){
            sortChilds(node)
          }
        })
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
  
