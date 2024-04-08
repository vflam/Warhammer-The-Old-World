export default {
  name: "[TOW 1] Paste Special Rule",
  hooks: {
    paste(e, payload) {
      if (typeof payload !== "string") return
      if (!["M", "WS", "BS", "S", "T", "W", "I", "A", "Ld"].find(o => !payload.includes(o))) return;
      if (!["R", "S", "AP", "Special Rules"].find(o => !payload.includes(o))) return;

      const rules = payload.replace(/\r\n/g, "\n").split('\n')
      const name = rules.shift()
      const desc = rules.join('\n')
      return {
        parentKey: "profiles",
        characteristics: [
          {
            $text: desc,
            name: "Description",
            typeId: "9f84-4221-785a-db50"
          }
        ],
        name: name,
        typeId: "c1ac-c1c8-f9d5-9673",
        typeName: "Special Rule",
      }
    }
  },
}