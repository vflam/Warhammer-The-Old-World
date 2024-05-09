const __filename = import.meta.url.replace(/^file:\/\/\//, "").replace(/\?[a-zA-Z0-9=]*$/, "")
const __dirname = __filename.split('/').slice(0, -1).join('/')




export default {
    name: "Fix Newlines",
    arguments: [{
        type: 'catalogue[]'
    }],

    async run(catalogues) {
        const nodes = []
        for (const catalogue of catalogues) {
            catalogue.forEachObjectWhitelist((node) => {
                if (node.comment === "imported") return
                nodes.push(node)
            })
        }
        const modified = []
        let count = 0;
        for (const node of nodes) {
            if (node.editorTypeName === 'profile') {
                for (const c of node.characteristics || []) {
                    const current = c.$text
                    const next = fixText(current)
                    if (current !== next) {
                        count++;
                        await $store.edit_node(c, { $text: next })
                        if (count < 10) {
                            console.log(current)
                            console.log(next)
                            modified.push([node], `<pre style="background-color: #FF000020"><code>${current}</code></pre>`, `<pre style="background-color: #00FF0020"><code>${next}</code></pre>`)
                        }
                    }
                }
            } else if (node.editorTypeName === 'rule') {
                const current = node.description
                const next = fixText(current)
                if (current !== next) {
                    await $store.edit_node(node, { description: next })
                    count++;
                    if (count < 10) {
                        modified.push([node], current, next)
                    }
                }
            }
        }
        modified.unshift(`<h2>Total: ${count}</h2>`)
        return modified
    }
}


function fixText(text) {
    if (!text || typeof text !== 'string') return text
    text = text.replace(/\r\n/g, '\n');
    text = text.split('\n').map(o => o.trim()).join('\n')
    text = text.replace(/(\n{2,})/g, '<doublenewline>');
    text = text.replace(/ {1,}/g, ' ');
    const result = []
    const startChars = ["#", "*", "~", "|", "-", "•"]
    const endChars = [":", ".", "!", "?"]
    let previous = "<start>"
    for (const line of text.split('\n')) {
        const trimmedPrevious = previous
        const trimmedCurrent = line
        previous = line

        const startPrevious = trimmedPrevious[0]
        const endPrevious = trimmedPrevious[trimmedPrevious.length - 1]
        const startCurrent = trimmedCurrent[0]
        const endCurrent = trimmedCurrent[trimmedCurrent.length - 1]

        if (trimmedPrevious === "<start>") {
            result.push(trimmedCurrent)
        } else if (startChars.includes(startCurrent) || endChars.includes(endPrevious)) {
            result.push("\n", trimmedCurrent)
        } else if (trimmedPrevious === trimmedPrevious.toUpperCase() || trimmedCurrent === trimmedCurrent.toUpperCase()) {
            result.push("\n", trimmedCurrent)
        } else {
            result.push(" ", trimmedCurrent)
        }
    }
    return result.join('').replace(/<doublenewline>/g, "\n\n")
}