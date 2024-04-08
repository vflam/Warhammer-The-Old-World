
function toWeaponProfile(weapon) {
  return {
    parentKey: "profiles",
    name: weapon.Name,
    typeId: "a378-c633-912d-11ce",
    typeName: "Weapon",
    characteristics: [
      { name: "R", typeId: "2360-c777-5e07-ed58", $text: weapon.Stats.R },
      { name: "S", typeId: "ac19-f99c-72e9-a1a7", $text: weapon.Stats.S },
      { name: "AP", typeId: "9429-ffe7-2ce5-e9a5", $text: weapon.Stats.AP },
      { name: "Special Rules", typeId: "5f83-3633-336b-93b4", $text: weapon.Stats["Special Rules"] },
      { name: "Notes", typeId: "772a-a7ff-f6b3-df71", $text: weapon.Stats.Notes }
    ]
  }
}
function lastItem(array) {
  return array[array.length - 1];
}

export default {
  name: "[TOW 2] Paste Weapon",
  hooks: {
    paste(e, payload) {
      if (typeof payload !== "string") return
      if (!["M", "WS", "BS", "S", "T", "W", "I", "A", "Ld"].find(o => !payload.includes(o))) return;
      if (["R", "S", "AP", "Special Rules"].find(o => !payload.includes(o))) return;
      const lines = payload.replace(/\r\n/g, "\n").split('\n').filter(o => o);
      let current = "weaponsTable";
      const weapons = []

      for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        if (line.includes("R") && line.includes("S") && line.includes("AP") && line.includes('Special Rules')) {
          current = "weaponsTable";
          continue;
        }
        else if (line.startsWith("Notes:")) {
          current = "notes";
        }
        if (current === "weaponsTable") {
          if (line) {
            const [name, R, S, AP, specialRules] = line.replace(/\t|\s{2,}/g, "  ").split("  ");
            weapons.push({ Name: name, Stats: { R, S, AP, "Special Rules": specialRules, Notes: "" } });
          }
        }
        if (current === "notes") {
          const last = lastItem(weapons);
          if (last?.Stats.Notes) {
            last.Stats.Notes += line;
          }
        }
      }
      return weapons.map(o => toWeaponProfile(o));
    }
  }
}