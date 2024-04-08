const __filename = import.meta.url.replace(/^file:\/\/\//, "").replace(/\?[a-zA-Z0-9=]*$/, "")
const __dirname = __filename.split('/').slice(0, -1).join('/')
async function importRules() {
    const rulesPath = `${__dirname}/fetch-old-world-rules/rules/`
    const files = await $node.getFolderFiles(rulesPath)
    const rules = files.map(o => JSON.parse(o.data))
    return rules;
}
function groupBy(items, callbackfn) {
    const result = {};
    for (let i = 0; i < items.length; i++) {
        const current = items[i];
        const key = callbackfn(current);
        const arr = result[key];
        if (!arr) {
            result[key] = [current];
        } //
        else {
            arr.push(current);
        }
    }
    return result;
}
function getDescription(rule) {
    const result = [rule.description]
    if (rule.related?.length && rule.description) {
        rule.related = rule.related.filter(o => !rule.description.toLowerCase().includes(o.name.toLowerCase()))
    }
    if (rule.childs?.length && rule.description) {
        rule.childs = rule.childs.filter(o => !rule.description.toLowerCase().includes(o.name.toLowerCase()))
    }
    const multiLine = (rule.related?.length && rule.childs?.length) || rule.related?.length > 3 || rule.childs?.length > 3
    if (multiLine) {
        result.push("\nRelated:")
    }
    if (rule.related?.length) {
        if (multiLine) {
            result.push(`${rule.related.map(o => o.name).join('\n')}`)
        } else {
            result.push(`\nRelated: ${rule.related.map(o => o.name).join(', ')}`)
        }
    }
    if (rule.childs?.length) {
        if (multiLine) {
            result.push(`${rule.childs.map(o => o.name).join('\n')}`)
        } else {
            result.push(`\nRelated: ${rule.childs.map(o => o.name).join(', ')}`)
        }
    }
    return result.join('\n');
}
export function sortByDescendingInplace(array, getKey) {
    return array.sort((a, b) => (getKey(b) ?? "").toString().localeCompare((getKey(a) ?? "").toString(), undefined, { numeric: true }))
}
export default {
    name: "Import Rules",
    arguments: [{
        type: 'catalogue[]'
    }],
    async run(catalogues) {
        const rules = await importRules()
        const existingSet = new Set();
        const texts = []
        for (const catalogue of catalogues) {
            catalogue.forEachObjectWhitelist(node => {
                if (node.isLink()) return;
                if (node.comment?.includes("imported")) return;
                if (node.isRule()) {
                    existingSet.add(node.getName().toLowerCase())
                    texts.push([node, node.description])
                } else if (node.isProfile()) {
                    existingSet.add(node.getName().toLowerCase())
                    for (const c of node.characteristics || []) {
                        texts.push([c, c.$text]);
                    }
                }

            })
        }
        const existing = []
        const missing = []
        for (const rule of rules) {
            if (existingSet.has(rule.name.toLowerCase())) {
                existing.push(rule)
            } else {
                missing.push({ ...rule, refs: 0 })
            }
        }

        const missing_grouped = Object.entries(groupBy(missing, o => o.slug.split('/')[0])).map(([k, v]) => ([k, v.length]))
        sortByDescendingInplace(missing_grouped, o => o[1])
        const existing_grouped = Object.entries(groupBy(existing, o => o.slug.split('/')[0])).map(([k, v]) => ([k, v.length]))
        sortByDescendingInplace(existing_grouped, o => o[1])

        const system = catalogues[0].getSystem()
        const index = new (system.infoIndex.constructor)()
        console.log(index)
        for (const rule of missing) {
            index.add(rule.name, rule)
        }
        for (const [node, text] of texts) {
            for (const piece of index.match(text)) {
                piece.match?.forEach(o => { o.refs = (o.refs ?? 0) + 1 })
            }
        }
        for (const rule of missing) {
            for (const piece of index.match(getDescription(rule))) {
                piece.match?.forEach(o => { o.refs = (o.refs ?? 0) + 1 })
            }
        }
        const refs = [...missing]
        sortByDescendingInplace(refs, o => o.refs)
        const refs_grouped = refs.map(o => ([o.name, o.refs]));

        for (const rule of missing) {
            const existing = system.sharedProfiles.find(o => (o.name === rule.name && o.comment === "imported"))
            const node = {
                comment: "imported",
                characteristics: [
                    {
                        $text: getDescription(rule),
                        name: "Description",
                        typeId: "9f84-4221-785a-db50"
                    }
                ],
                name: rule.name,
                typeId: "c1ac-c1c8-f9d5-9673",
                typeName: "Special Rule"
            }
            if (existing) {
                $store.edit_node(existing, node)
            }
            else {
                $store.add_node('sharedProfiles', system, node)
            }
        }
        return [
            `<h1 style="color: red">Existing ${existing.length}:</h1>`,
            `<pre>${existing_grouped.map(([k, v]) => `<b>${k}</b>: ${v}`).join('\n')}</pre>`,
            `<h1 style="color: red">Missing ${missing.length}:</h1>`,
            `<pre>${missing_grouped.map(([k, v]) => `<b>${k}</b>: ${v}`).join('\n')}</pre>`,
            `<h1 style="color: red">Refs ${refs_grouped.length}:</h1>`,
            `<pre>${refs_grouped.map(([k, v]) => `<b>${k}</b>: ${v}`).join('\n')}</pre>`
        ]

    }
}