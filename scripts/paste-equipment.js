function hashFnv32a(str, seed = 198209835) {
    /*jshint bitwise:false */
    let i, l, hval = seed === undefined ? 0x811c9dc5 : seed;
    for (i = 0, l = str.length; i < l; i++) {
        hval ^= str.charCodeAt(i);
        hval += (hval << 1) + (hval << 4) + (hval << 7) + (hval << 8) + (hval << 24);
    }
    return (hval >>> 0).toString(16);
}
function id(str) {
    return `${hashFnv32a(str)}-${hashFnv32a(str + "------")}`;
}
function removeTextInParentheses(str) {
    return str.replace(/\([^()]*\)/g, '');
}
function extractTextAndDetails(str) {
    const result = [];
    let inDetails = false;
    let current = { text: "", details: "" };
    for (let i = 0; i < str.length; i++) {
        const char = str[i];
        if (char === "(") {
            inDetails = true;
            continue;
        }
        else if (char === ")") {
            inDetails = false;
            result.push({ ...current });
            current.text = "";
            current.details = "";
            continue;
        }
        if (inDetails) {
            current.details += char;
        }
        else {
            current.text += char;
        }
    }
    if (current.text.trim()) {
        result.push(current);
    }
    for (const found of result) {
        found.text = removePrefix$2(found.text.trim(), ", ");
        if (!found.details.trim()) {
            found.details = null;
        }
    }
    return result;
}
function sortByAscending(array, getKey) { return [...array].sort((a, b) => (getKey(a) ?? "").toString().localeCompare((getKey(b) ?? "").toString(), undefined, { numeric: true })); }
function isSameCharacteristics(a, b) {
    const hashA = sortByAscending(a, (o) => o.name).map(o => o.$text).join('::');
    const hashB = sortByAscending(b, (o) => o.name).map(o => o.$text).join('::');
    return hashA === hashB;
}
function splitByCenterDot(str) {
    // Check if the string contains any center dots
    if (!str.includes('•')) {
        return { "all": str };
    }
    // Split by center dot and initialize the result object
    const items = str.split('•').filter(Boolean); // Filter out any empty strings
    const result = { "all": "" };
    // Iterate over each item, split by the first colon, and populate the result object
    items.forEach(item => {
        const [key, ...valueParts] = item.split(':');
        const value = valueParts.join(':').trim(); // Re-join in case there are multiple colons
        const fixedKey = replaceSuffix(removeSuffix(key.trim(), "s"), "ve", "f");
        for (const modelKey of fixedKey.split('/').map(o => o.trim())) {
            result[modelKey] = value;
        }
    });
    return result;
}
function removeSuffix(from, suffix) {
    if (from.endsWith(suffix)) {
        return from.substring(0, from.length - suffix.length);
    }
    return from;
}
function removePrefix$2(from, prefix) {
    if (from.startsWith(prefix)) {
        return from.substring(prefix.length);
    }
    return from;
}
function replaceSuffix(str, suffix, replace) {
    // Check if the string ends with the specified suffix
    if (str.endsWith(suffix)) {
        // Remove the suffix from the end of the string and append the replacement
        return str.slice(0, -suffix.length) + replace;
    }
    else {
        // If the string does not end with the specified suffix, return it unchanged
        return str;
    }
}
function splitAnd(str) {
    // Split the string by ", " and " and "
    const parts = str.split(/, | and /);
    return parts.map(o => removePrefix$2(removePrefix$2(o.trim(), "a "), "and "));
}
function parseSpecialRule(rule) {
    const pattern = /^([^(]+?)([*]*)(?:\s*[(]([^)]+)[)])?([*]*)$/;
    const match = rule.trim().match(pattern);
    if (!match) {
        console.warn("Couldn't parse rule " + rule);
        return {};
    }
    let ruleName = match[1].trim();
    let param = null;
    let specification = null;
    let asterisks = match[2].length + match[4].length;
    if (match[3]) {
        const pieces = match[3].split(", ");
        param = pieces[0];
        if (pieces.length === 1) {
            specification = pieces[1];
        }
        if (pieces.length > 2) {
            console.log(`${rule} has more text within parentheses that is not handled.`);
        }
    }
    ruleName = ruleName.replace("\u0007 ", "");
    ruleName = ruleName.replace("\u0007", "");
    if (ruleName.startsWith('Poisoned Attacks') && ruleName.includes('*Note')) {
        ruleName = "Poisoned Attacks";
    }
    return { ruleName, param, specification, asterisks };
}
function toTitleCase(text) {
    return text.split(' ').map(word => {
        return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
    }).join(' ');
}

function toModelProfile(data, parentName) {
    const { ruleName, param } = parseSpecialRule(data.Name); // Same format as a special rule   
    const stats = data.Stats;
    const result = {
        "characteristics": [
            { name: "M", typeId: "cd3b-a5a4-e185-5a9d", $text: stats.M ?? "-" },
            { name: "WS", typeId: "b007-7d58-4f14-1e01", $text: stats.WS ?? "-" },
            { name: "BS", typeId: "59f9-ccf5-1155-fb05", $text: stats.BS ?? "-" },
            { name: "S", typeId: "5b6b-1427-2a45-dd0c", $text: stats.S ?? "-" },
            { name: "T", typeId: "ab43-8b61-83e7-d090", $text: stats.T ?? "-" },
            { name: "W", typeId: "83ed-7b82-bf1f-e558", $text: stats.W ?? "-" },
            { name: "I", typeId: "73b1-abe5-72f8-41e2", $text: stats.I ?? "-" },
            { name: "A", typeId: "dddc-9fbd-b0fd-a480", $text: stats.A ?? "-" },
            { name: "Ld", typeId: "c435-6b14-f77e-3c72", $text: stats.Ld ?? "-" }
        ],
        name: ruleName,
        hidden: false,
        typeId: "b070-143a-73f-2772",
        typeName: "Model"
    };
    if (parentName) {
        result.comment = `${parentName}/${ruleName}`;
    }
    return result;
}
function toSpecialRule(name, desc) {
    const result = {
        name: name,
        hidden: false,
        typeId: "c1ac-c1c8-f9d5-9673",
        typeName: "Special Rule",
        characteristics: [
            { name: "Description", typeId: "9f84-4221-785a-db50", $text: desc }
        ]
    };
    return result;
}
function toUnitProfile(unitName, unit) {
    if (!unit["Subheadings"]["Troop Type:"] || !unit["Subheadings"]['Unit Size:']) {
        console.log(`Couldn't make Unit profile for ${unitName} (missing data) in `, unit);
        return;
    }
    const result = {
        characteristics: [
            {
                name: "Troop Type",
                typeId: "5d94-6b94-bd89-1944",
                $text: unit["Subheadings"]["Troop Type:"]
            },
            {
                name: "Unit Size",
                typeId: "80a1-bb6f-66e4-4a5b",
                $text: unit["Subheadings"]['Unit Size:']
            }
        ],
        name: unitName,
        typeId: "2878-9a1f-dd74-48e3",
        typeName: "Unit",
        hidden: false,
        id: id(`${unitName}/unit/profile`)
    };
    return result;
}
function toEquipment(itemName, hash, targetId) {
    return {
        name: itemName,
        id: id(`${hash}/equipment/${itemName}`),
        hidden: false,
        type: "selectionEntry",
        targetId: targetId ?? itemName,
        modifiers: [],
        constraints: [
            {
                type: "min", value: 1, scope: "parent", shared: false, field: "selections",
                id: id(`${hash}/equipment/${itemName}/min`)
            },
            {
                type: "max", value: 1, scope: "parent", shared: false, field: "selections",
                id: id(`${hash}/equipment/${itemName}/max`)
            },
        ],
    };
}
function toGroup(name, hash) {
    return {
        name: name,
        hidden: false,
        id: id(`${hash}/${name}`),
        selectionEntries: [],
        entryLinks: [],
        constraints: [],
        modifiers: [],
    };
}
function getGroup(entry, name, hash) {
    if (!entry.selectionEntryGroups)
        entry.selectionEntryGroups = [];
    const found = entry.selectionEntryGroups.find(o => o.name === name);
    if (found) {
        return found;
    }
    const created = toGroup(name, hash);
    entry.selectionEntryGroups.push(created);
    return created;
}
function parseDetails(details) {
    const parsed = parseInt(details);
    return isNaN(parsed) ? 0 : parsed;
}
function toCost(pts) {
    if (!pts)
        pts = 0;
    const parsed = typeof pts === "string" ? parseInt(pts) : pts;
    return {
        name: "pts",
        typeId: "points",
        value: isNaN(parsed) ? 0 : parsed
    };
}
function toEntry(name, hash, cost) {
    if (!name)
        throw new Error("Cannot create entry with no name.");
    const result = {
        name: name,
        id: id(`${hash}/${name}`),
        costs: [],
        infoLinks: [],
        profiles: [],
        modifiers: [],
        entryLinks: [],
        type: "upgrade",
        import: true,
        hidden: false,
    };
    if (cost) {
        result.costs.push(toCost(cost));
    }
    return result;
}
function toProfileLink(name, hash, targetId) {
    if (!name)
        throw new Error("Cannot create profile link with no name.");
    return {
        name: name,
        hidden: false,
        type: "profile",
        id: id(`${hash}/${name}`),
        targetId: targetId
    };
}
function toEntryLink(name, hash, targetId) {
    if (!name)
        throw new Error("Cannot create profile link with no name.");
    const link = {
        import: true,
        name: name,
        hidden: false,
        id: id(`${hash}/${name}`),
        type: "selectionEntry",
        targetId: targetId ?? name,
        costs: [],
        modifiers: [],
        constraints: []
    };
    return link;
}
function toGroupLink(name, hash, targetId) {
    if (!name)
        throw new Error("Cannot create profile link with no name.");
    const link = {
        import: true,
        name: name,
        hidden: false,
        id: id(`${hash}/${name}`),
        type: "selectionEntryGroup",
        targetId: targetId ?? name,
        costs: [],
        modifiers: [],
        constraints: [],
    };
    return link;
}
function toMinConstraint(min, hash) {
    return {
        type: "min",
        value: min,
        field: "selections",
        scope: "parent",
        shared: false,
        id: id(`${hash}/min`)
    };
}
function toMaxConstraint(max, hash, scope = "parent") {
    return {
        type: "max",
        value: max,
        field: "selections",
        scope: scope,
        shared: false,
        id: id(`${hash}/max`),
        includeChildSelections: scope === "parent" ? false : true
    };
}
function toSpecialRuleLink(ruleName, hash, targetId, param) {
    const specialRuleLink = {
        name: removeTextInParentheses(ruleName),
        hidden: false,
        id: id(`${hash}/rule/${ruleName}`),
        type: "profile",
        targetId: targetId ?? ruleName,
        modifiers: []
    };
    if (param) {
        specialRuleLink.modifiers.push({ type: "append", value: `(${param})`, field: "name" });
    }
    return specialRuleLink;
}
function getPerModelCostModifier(details, hash) {
    const perModelCostModifier = {
        comment: "per model",
        type: "increment", value: parseDetails(details), field: "points",
        repeats: [
            {
                value: 1,
                repeats: 1,
                field: "selections",
                scope: "parent",
                childId: "model",
                shared: true,
                roundUp: false,
            }
        ]
    };
    return perModelCostModifier;
}
function toCategoryLink(category, hash) {
    return {
        name: category.name,
        hidden: false,
        id: id(`${hash}/${category.name}`),
        targetId: category.id,
        primary: false
    };
}

function removePrefix$1(from, prefix) {
    if (from.startsWith(prefix)) {
        return from.substring(prefix.length);
    }
    return from;
}
function removeUndefineds(object) {
    for (const key in object) {
        if ((object)[key] === undefined)
            delete object[key];
    }
    return object;
}
class Parser {
    source;
    text;
    parsed = [];
    constructor(text) {
        this.text = text;
        this.source = text;
    }
    text_upto_token(tokens) {
        if (!this.text)
            return null;
        const regex = new RegExp(tokens.join("|"), "i");
        const result = regex.exec(this.text);
        if (!result)
            return null;
        const idx = result.index;
        const found = this.text.substring(0, idx).trim();
        const token = result[0];
        this.text = this.text.substring(idx + token.length).trim();
        const cleanedText = this.clean_text(found);
        if (cleanedText) {
            this.parsed.push({ text: cleanedText, type: "text" });
        }
        this.parsed.push({ text: token, type: "token" });
        return token;
    }
    next_token(tokens, space = false) {
        if (!this.text)
            return null;
        for (const token of tokens) {
            if (this.text.toLowerCase().startsWith(space ? token + " " : token)) {
                this.parsed.push({ text: token, type: "token" });
                this.text = this.text.substring(token.length).trim();
                return token;
            }
        }
        return null;
    }
    clean_text(text) {
        text = removePrefix$1(text, "a ");
        text = removePrefix$1(text, "an ");
        text = removePrefix$1(text, "the ");
        text = removePrefix$1(text, "its ");
        // text = removeSuffix(text, ":")
        text = text.replace(/ \(see .*\)/, "");
        return text;
    }
    remainder() {
        if (!this.text)
            return null;
        const text = this.clean_text(this.text);
        if (!text)
            return null;
        this.parsed.push({ text, type: "text" });
        this.text = "";
        return text;
    }
}
function parseOptionsLine(line) {
    if (line.includes("unless")) {
        throw "cant parse 'unless' options";
    }
    line = line.replace("may have may have", "may have");
    const [_, text, details] = line.trim().match(/([^.]*)(?:[.]{2,})?([^.]*)?/);
    if (!text.startsWith('•') && !text.startsWith('-')) {
        console.warn('invalid input', text);
        return { tokens: [], source: text, details: details };
    }
    const actionTokens = ["may be mounted on a:", "may be mounted on", "may take:", "may take", "must take", "must be mounted on", "may have", "must have", "may be upgraded to", "may replace", "may purchase", "may be:", "may be", "may upgrade", "may:"];
    const amountTokens = ["one of the following:", "0-2 of the following", "one of the following", "any of the following:", "up to a total of", "up to", "for every two", "for every three", "worth up to", "a single"];
    const whatTokens = ["any unit of", "any unit", "any model in the unit", "the entire unit", "one model", "0-1 unit", "on a", "its", "an", "a:", "a", "the", "any"];
    const dashTokens = ["be a", "purchase", "be mounted on a", "upgrade one model to", "have", "a", "include one", "upgrade one", "may purchase", "replace", "be", "add", "magic items", "take"];
    const begin = ["•", "-"];
    const parser = new Parser(text);
    switch (parser.next_token(begin)) {
        case "•":
            {
                const what = parser.next_token(whatTokens, true);
                if (what) {
                    switch (what) {
                        case "a":
                        case "an":
                        case "0-1 unit":
                        case "any unit of":
                        case "the":
                        case "any":
                            switch (parser.text_upto_token(actionTokens)) {
                                case "may be upgraded to":
                                case "may be":
                                case "may take":
                                    parser.remainder();
                                    break;
                                case "may replace":
                                    parser.text_upto_token(["with:", "with"]);
                                    parser.remainder();
                                    break;
                                default:
                                    parser.text_upto_token(amountTokens);
                                    parser.remainder();
                                    break;
                            }
                            break;
                    }
                }
                const action = parser.next_token(actionTokens);
                if (action) {
                    switch (action) {
                        case "may replace":
                            parser.text_upto_token(["with:", "with"]);
                            parser.remainder();
                            break;
                        case "may have":
                        case "may take":
                        case "may be":
                        case "must take":
                            parser.next_token(amountTokens);
                            parser.text_upto_token(amountTokens);
                            parser.remainder();
                            break;
                        case "may be":
                            parser.next_token(actionTokens);
                            parser.remainder();
                            break;
                        case "may be mounted on":
                        case "may be mounted on a:":
                        case "may be upgraded to":
                        case "must be mounted on":
                            parser.remainder();
                            break;
                        case "may purchase":
                            parser.text_upto_token(amountTokens);
                            break;
                        case "may upgrade":
                            parser.text_upto_token(["to an", "to a"]);
                            parser.remainder();
                            break;
                    }
                }
                else {
                    parser.remainder();
                }
            }
            break;
        case "-":
            switch (parser.next_token(dashTokens, true)) {
                case "be a":
                case "be mounted on a":
                case "upgrade one model to":
                case "have":
                case "be":
                case "add":
                    parser.remainder();
                    break;
                default:
                    parser.text_upto_token(amountTokens);
                    parser.remainder();
                    break;
                case "take":
                case "purchase":
                case "may purchase":
                case "magic items":
                    parser.text_upto_token(amountTokens);
                    parser.remainder();
                    break;
                case "a":
                    parser.text_upto_token(actionTokens);
                    parser.text_upto_token(amountTokens);
                    parser.remainder();
                    break;
                case "include one":
                    parser.text_upto_token(["for every three", "for every two"]);
                    parser.remainder();
                    break;
                case "upgrade one":
                    parser.text_upto_token(["to"]);
                    parser.remainder();
                    break;
                case "replace":
                    parser.text_upto_token(["with"]);
                    parser.remainder();
                    break;
            }
            break;
    }
    // console.log(parser.parsed)
    return { tokens: parser.parsed, details: details?.trim(), source: parser.source };
}
function processLines(text) {
    // Split the text into lines
    const lines = text.split('\n').map(o => o.trim());
    let result = [];
    let previousLine = "";
    lines.forEach(line => {
        // Check if the line starts with " - " or " • "
        if (line.startsWith("-") || line.startsWith("•")) {
            // If there's a previous line, add it to the result
            if (previousLine.trim()) {
                result.push(previousLine);
            }
            previousLine = line;
        }
        else {
            // Append the current line to the previous line
            previousLine += " " + line;
        }
    });
    // Add the last line if it's not empty
    if (previousLine !== "") {
        result.push(previousLine);
    }
    return result;
}
function parseOptions(options) {
    const lines = processLines(options).map(o => o.replace(" // ", "....")).filter(o => o && !o.includes('Unless'));
    const parsedLines = lines.map(o => parseOptionsLine(o));
    let lastBullet = null;
    const bullets = [];
    for (const line of parsedLines) {
        if (line.tokens[0].text === "•") {
            line.childs = [];
            lastBullet = line;
            bullets.push(line);
        }
        else {
            lastBullet.childs.push(line);
        }
        line.tokens.shift();
    }
    return bullets;
}
function toToken(parsedToken) {
    return parsedToken.type === "text" ? parsedToken.type : parsedToken.text;
}
class TokenIterator {
    tokens;
    index = 0;
    last = [];
    constructor(tokens) {
        this.tokens = tokens;
    }
    hasTokens(tokens) {
        tokens = Array.isArray(tokens) ? tokens : [tokens];
        for (let i = 0; i < tokens.length; i++) {
            const token = tokens[i];
            const parsed = this.tokens[i + this.index];
            if (typeof token === "string") {
                if (toToken(parsed) !== token)
                    return false;
            }
            else {
                if (!token.includes(toToken(parsed)))
                    return false;
            }
        }
        this.last = this.tokens.slice(this.index, this.index + tokens.length);
        this.index += tokens.length;
        return true;
    }
    next() {
        if (this.index >= this.tokens.length)
            return null;
        const result = this.tokens[this.index];
        this.last = [result];
        this.index += 1;
        return result;
    }
    nextAlways() {
        if (this.index >= this.tokens.length)
            throw Error("nextAlways failed");
        return this.next();
    }
    maybeNextText() {
        while (this.index < this.tokens.length) {
            const found = this.tokens[this.index];
            this.index += 1;
            if (found.type === "text") {
                this.last = [found];
                return found;
            }
        }
        return null;
    }
    nextText() {
        while (this.index < this.tokens.length) {
            const found = this.tokens[this.index];
            this.index += 1;
            if (found.type === "text") {
                this.last = [found];
                return found;
            }
        }
        throw Error("nextText failed");
    }
    lastText() {
        for (let i = this.last.length - 1; i >= 0; i--) {
            if (this.last[i].type === "text") {
                return this.last[i].text;
            }
        }
        return null;
    }
    remaining() {
        return (this.tokens.length - this.index);
    }
}
function getScope(it) {
    if (it.hasTokens(["any model in the unit"]))
        return { scope: "model", amount: "*" };
    if (it.hasTokens(["the entire unit"]))
        return { scope: "unit", amount: "*" };
    if (it.hasTokens(["0-1 unit", "in your army"]))
        return { scope: "unit", amount: "1" };
    if (it.hasTokens(["0-1 unit", "text"])) {
        const amount = it.lastText();
        return { scope: "unit", amount };
    }
    if (it.hasTokens([["any unit of"], "text"]))
        return { scope: it.lastText(), amount: "*" };
    if (it.hasTokens(["any unit"]))
        return { scope: "unit", amount: "*" };
    if (it.hasTokens([["any"], "text"]))
        return { scope: it.lastText(), amount: "*" };
    if (it.hasTokens([["a", "an", "the"], "text"]))
        return { scope: it.lastText(), amount: "1" };
    return { scope: "self", amount: "*" };
}
function getGroupAmount(it) {
    const text = it.nextAlways().text;
    switch (text) {
        case "may:":
        case "may take:":
        case "may be":
        case "may be:":
            return "*";
        case "must take":
            const mustTakeWhat = it.nextAlways().text;
            if (mustTakeWhat === "one of the following:")
                return "1";
            if (mustTakeWhat === "one of the following")
                return "1";
            console.warn(`unparsed group (${text}) amount`, mustTakeWhat);
            return null;
        case "may take":
        case "may have": {
            const mayTakeWhat = it.nextAlways().text;
            if (mayTakeWhat === "one of the following:")
                return "0-1";
            if (mayTakeWhat === "one of the following")
                return "0-1";
            if (mayTakeWhat === "any of the following:")
                return "*";
            if (mayTakeWhat === "0-2 of the following")
                return "0-2";
            console.warn(`unparsed group (${text}) amount`, mayTakeWhat);
            return "*";
        }
        case "may replace":
            return "1";
        case "must be mounted on":
            it.nextAlways();
            return "1";
        case "may be mounted on a:":
        case "may be mounted on":
            return "0-1";
        default:
            console.warn("unparsed group amount", text, it);
            return null;
    }
}
function optionsToGroups(options) {
    const groups = [];
    const entries = [];
    for (const bulletLine of parseOptions(options)) {
        const it = new TokenIterator(bulletLine.tokens);
        if (!bulletLine.childs.length && (!bulletLine.source.endsWith(":"))) {
            const { scope, amount } = getScope(it);
            const firstToken = toToken(it.nextAlways());
            const obj = { scope, amount, details: bulletLine.details, source: bulletLine.source };
            switch (firstToken) {
                case "text":
                    entries.push({ ...obj, what: it.lastText(), token: firstToken });
                    break;
                case "may be":
                    entries.push({ ...obj, what: it.maybeNextText()?.text, token: firstToken });
                    break;
                case "may have":
                case "may take":
                case "may be upgraded to":
                case "may be mounted on":
                    entries.push({ ...obj, what: it.nextText().text, token: firstToken });
                    it.next();
                    break;
                case "may purchase":
                    entries.push({ ...obj, what: it.nextText().text, token: firstToken });
                    it.nextAlways();
                    break;
                case "may upgrade":
                    entries.push({ ...obj, what: it.nextText().text, to: it.nextText()?.text, type: "upgrade" });
                    break;
                case "may replace":
                    entries.push({ ...obj, what: it.nextText().text, with: it.nextText().text, type: "replace" });
                    break;
                default:
                    console.warn("unhandled token", firstToken);
            }
            if (it.remaining()) {
                console.error(`didnt finish parsing (remaining ${it.remaining()} tokens)`, bulletLine.source);
            }
            continue;
        }
        const { scope, amount } = getScope(it);
        const groupAmount = getGroupAmount(it) || bulletLine.details;
        const groupReplace = it.last[0].text === "may replace";
        let groupReplaceWhat;
        if (groupReplace) {
            groupReplaceWhat = it.nextText();
            it.nextAlways();
        }
        const groupSpecification = it.next()?.text;
        const group = {
            scope, amount, groupAmount,
            replace: groupReplaceWhat,
            details: bulletLine.details,
            specification: groupSpecification,
            entries: [],
            source: bulletLine.source,
        };
        // if groupAmount is a * (meaning any), its entries can be taken out of the group.
        for (const dashLine of bulletLine.childs) {
            const dashIt = new TokenIterator(dashLine.tokens);
            const firstToken = toToken(dashIt.nextAlways());
            const obj = { scope, amount, details: dashLine.details, source: dashLine.source, parentSource: bulletLine.source };
            switch (firstToken) {
                case "text":
                    group.entries.push({
                        ...obj,
                        what: dashIt.lastText(),
                        details: dashLine.details,
                        token: firstToken
                    });
                    break;
                case "a":
                case "an":
                    const what = dashIt.nextAlways().text;
                    if (groupReplaceWhat) {
                        group.entries.push({
                            ...obj,
                            what: groupReplaceWhat.text,
                            with: what,
                            type: "replace",
                        });
                        break;
                    }
                    group.entries.push({
                        ...obj,
                        what,
                        details: dashLine.details
                    });
                    break;
                case "be a":
                case "be":
                case "add":
                case "be mounted on a":
                case "have":
                case "take":
                    group.entries.push({
                        ...obj,
                        what: dashIt.nextText().text,
                        token: firstToken
                    });
                    break;
                case "may purchase":
                case "purchase":
                    group.entries.push({
                        ...obj,
                        what: dashIt.nextText().text
                    });
                    dashIt.nextAlways();
                    break;
                case "upgrade one":
                    group.entries.push({
                        ...obj,
                        what: dashIt.nextText().text,
                        to: dashIt.nextText().text,
                        type: "upgrade"
                    });
                    break;
                case "upgrade one model to":
                    group.entries.push({
                        ...obj,
                        what: "model",
                        to: dashIt.nextText().text,
                        type: "upgrade"
                    });
                    break;
                case "include one":
                    group.entries.push({
                        ...obj,
                        what: dashIt.nextText().text,
                        for: dashIt.nextText().text,
                        type: "include",
                    });
                    break;
                case "replace":
                    group.entries.push({
                        ...obj,
                        what: dashIt.nextText().text,
                        with: dashIt.nextText().text,
                        type: "replace",
                    });
                    break;
                case "magic items":
                    dashIt.nextAlways();
                    group.entries.push({
                        ...obj,
                        what: "magic items"
                    });
                    break;
                default:
                    console.warn("unhandled token", firstToken);
                    if (dashIt.remaining()) {
                        console.error(`didnt finish parsing (remaining ${dashIt.remaining()} tokens)`, dashLine.source);
                    }
            }
            if (it.remaining()) {
                console.error(`didnt finish parsing (remaining ${it.remaining()} tokens)`, bulletLine.source);
            }
        }
        // if (group.source === "• May be mounted on a:") debugger;
        group.entries = group.entries.map(o => removeUndefineds(o));
        if (group.groupAmount === "*") {
            entries.push(...group.entries);
        }
        else {
            groups.push(removeUndefineds(group));
        }
    }
    entries.forEach(o => removeUndefineds(o));
    const result = {
        groups: groups,
        entries: entries,
    };
    return result;
}

function parseUnitText(text) {
    function lastItem(array) {
        return array[array.length - 1];
    }
    function replaceNewlineWithSpace(text) {
        // Replace `\n` preceded by `,` with just a space.
        return text.replace(/,\s*\n\s*/g, ', ');
    }
    const fixed = replaceNewlineWithSpace(text.replaceAll("\r", "\n")).split("\n").filter(o => o).join('\n');
    function findTextAroundTroopType(input) {
        // Define the regex pattern
        const pattern = /(.*?)(Troop Type:.*)$/s;
        // Attempt to match the pattern against the input
        const match = input.match(pattern);
        // Check if a match was found
        if (match) {
            return [match[1], match[2]];
        }
        else {
            // If no match was found, return null or an appropriate value
            if (input.includes('Points') && input.includes('WS')) {
                return [input, ""];
            }
            else {
                return ["", input];
            }
        }
    }
    const [profiles, content] = findTextAroundTroopType(fixed);
    const result = { Subheadings: {}, Name: "", Profiles: [], Points: null, ProfilesText: profiles };
    const models = profiles.split('\n').filter(o => !o.includes('Points') && !o.includes('WS'));
    for (const model of models) {
        const splitted = model.replace(/\s+/g, " ").trim().split(' ');
        if (splitted.length < 10) {
            continue;
        }
        result.Profiles.push({
            Stats: {
                Points: splitted.pop(),
                Ld: splitted.pop(),
                A: splitted.pop(),
                I: splitted.pop(),
                W: splitted.pop(),
                T: splitted.pop(),
                S: splitted.pop(),
                BS: splitted.pop(),
                WS: splitted.pop(),
                M: splitted.pop(),
            },
            Name: splitted.join(' ')
        });
    }
    // State machine
    const lines = content.split('\n').filter(o => o);
    let current = "preSpecialRules";
    let startSection = content;
    const weaponTables = [];
    const specialRuleDefinitions = [];
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        if (line.startsWith("Special Rules:")) {
            current = "specialRules";
            continue;
        }
        else if (current === "specialRules") {
            if (line.startsWith('•'))
                continue;
            startSection = lines.slice(0, i).join("\n");
            current = "afterSpecialRules";
        }
        if (current === "preSpecialRules")
            continue;
        if (line.includes(" R ") && line.includes(" S ") && line.includes(" AP ")) {
            current = "weaponsTable";
            weaponTables.push({ rows: [] });
            continue;
        }
        else if (line.startsWith("Notes:")) {
            current = "notes";
        }
        else if (current === "afterSpecialRules") {
            current = "specialRuleDefinitions";
        }
        if (current === "weaponsTable") {
            if (line) {
                const last = lastItem(weaponTables);
                const [name, R, S, AP, specialRules] = line.replace(/\s{2,}/g, "  ").split("  ");
                last.rows.push({ Name: name, Stats: { R, S, AP, "Special Rules": specialRules, Notes: "" } });
            }
        }
        if (current === "notes") {
            const last = lastItem(weaponTables);
            const lastRow = lastItem(last.rows);
            if (lastRow.Stats.Notes) {
                lastRow.Stats.Notes += line;
            }
        }
        if (current === "specialRuleDefinitions") {
            if (line.match(/^[A-Z][a-z]*(?:\s[A-Z][a-z]*)*$/)) {
                specialRuleDefinitions.push({ name: line, description: "" });
            }
            else {
                const lastRule = lastItem(specialRuleDefinitions);
                lastRule.description = `${lastRule.description} ${line}`.trim();
            }
        }
    }
    const pattern = /(?:^|\n)([A-Za-z\s]+):\s*(.*?)(?=\n[A-Za-z\s]+:|$)/gs;
    const matches = [...startSection.matchAll(pattern)];
    matches.forEach(match => {
        const key = match[1].trim() + ":";
        const value = match[2].trim();
        result.Subheadings[key] = value;
    });
    // if (weaponTables.length) result.weaponTables = weaponTables
    if (specialRuleDefinitions.length)
        result["Special Rules"] = specialRuleDefinitions;
    return result;
}

function cmpItems(a, b) {
    return a.toLowerCase().replace(/s/g, "") === b.toLowerCase().replace(/s/g, "");
}
function findProfile(cat, profile) {
    if (profile.comment) {
        return cat.sharedProfiles?.find(o => o.comment === profile.comment && o.typeName === profile.typeName);
    }
    return cat.sharedProfiles?.find(o => o.name === profile.name && o.typeName === profile.typeName);
}
function findImportedProfile(cat, profileName, typeName) {
    if (!profileName)
        return;
    const lower = profileName.trim().toLowerCase();
    for (const imported of [cat, ...cat.imports]) {
        for (const profile of imported.sharedProfiles || []) {
            if (!profile.getName())
                continue;
            const found = removeSuffix(profile.getName().trim().toLowerCase(), " (x)");
            if (lower === found && profile.typeName === typeName) {
                return profile;
            }
        }
        // for (const profile of imported.sharedProfiles || []) {
        //     const found = profileName.trim().toLowerCase()
        //     if (found.includes(lower) && profile.typeName === typeName) {
        //         return profile
        //     }
        // }
    }
}
function findImportedCategory(cat, categoryName) {
    if (!categoryName)
        return;
    const lower = categoryName.trim().toLowerCase();
    for (const imported of [cat, ...cat.imports]) {
        for (const category of imported.categoryEntries || []) {
            if (lower === category.name.toLowerCase()) {
                return category;
            }
        }
    }
}
function findImportedEntry(cat, entryName, type) {
    const lower = removeSuffix(entryName.trim().toLowerCase(), "s");
    if (!lower)
        return;
    for (const imported of [cat, ...cat.imports]) {
        for (const entry of imported.sharedSelectionEntries || []) {
            if (entry.getType() !== type)
                continue;
            if (entry.name.trim().toLowerCase() === lower) {
                return entry;
            }
        }
        for (const entry of imported.sharedSelectionEntries || []) {
            if (entry.getType() !== type)
                continue;
            if (entry.name.trim().toLowerCase().includes(lower)) {
                return entry;
            }
        }
    }
}
function findUnitProfile(cat, unitName, profileName, typeName) {
    const fullComment = `${unitName}/${profileName}`;
    return cat.sharedProfiles?.find(o => o.comment === fullComment && o.typeName === typeName) ?? cat.sharedProfiles?.find(o => o.name === profileName && o.typeName === typeName);
}
function findRootUnit(cat, name) {
    return cat.entryLinks?.find(o => o.name === name);
}
function splitSpecialRules(str) {
    let result = [];
    let start = 0;
    let level = 0; // To keep track of parentheses depth
    for (let i = 0; i < str.length; i++) {
        // Increase level when an opening parenthesis is found
        if (str[i] === '(') {
            level++;
        }
        // Decrease level when a closing parenthesis is found
        else if (str[i] === ')') {
            level--;
        }
        // Check for ", " outside of parentheses
        else if (str.substring(i, i + 2) === ", " && level === 0) {
            // Add the substring to the result array
            result.push(str.substring(start, i));
            // Move the start to after the ", "
            start = i + 2;
            // Skip the next character as we already know it's a space
            i++;
        }
    }
    // Add the last part of the string
    result.push(str.substring(start));
    return result;
}
function getSpecialRules(cat, name, unit, model) {
    const hash = model ? `${name}/${model}` : name;
    const group = {
        infoLinks: [],
        name: "Special Rules",
        hidden: false,
        id: id(`${hash}/specialRules`),
    };
    if (unit["Subheadings"]['Special Rules:']) {
        const found = parseUnitField(unit["Subheadings"]['Special Rules:']);
        const selected = model ? getSpecific(found, model) : found.all;
        if (selected) {
            for (const rule of splitSpecialRules(selected)) {
                const { ruleName, param } = parseSpecialRule(rule);
                const profile = findImportedProfile(cat, ruleName, "Special Rule");
                if (!profile) {
                    group.infoLinks.push(toSpecialRuleLink(rule, hash, ruleName || "undefined rulename", param));
                    console.log(`[SPECIAL RULES] Couldn't find Special Rule from ${hash}: ${ruleName}`);
                    continue;
                }
                group.infoLinks.push(toSpecialRuleLink(rule, hash, profile.id, param));
            }
        }
    }
    if (!model && unit["Subheadings"]['Armour Value:']) {
        group.infoLinks.push(getArmourValueProfile(cat, name, unit["Subheadings"]['Armour Value:']));
    }
    return group;
}
function getArmourValueProfile(cat, name, armourValue) {
    const armourProfile = findImportedProfile(cat, "Armour Value", "Armour");
    const result = {
        name: "Armour Value",
        hidden: false,
        id: id(`${name}/armourValue`),
        type: "profile",
        targetId: armourProfile?.id ?? `Armour Value ${armourValue}`,
        modifiers: [{ type: "append", value: `: ${armourValue}`, field: "name" }]
    };
    return result;
}
function cmpModel(a, b) {
    a = a.toLowerCase();
    a = a.replace(/ie$/, "y");
    a = a.replace(/men$/, "man");
    a = a.replace(/s/, "");
    b = b.toLowerCase();
    b = b.replace(/ie$/, "y");
    b = b.replace(/men$/, "man");
    b = b.replace(/s/, "");
    return a === b;
}
function cmpModel2(a, b) {
    a = a.toLowerCase();
    a = a.replace(/ie$/, "y");
    a = a.replace(/men$/, "man");
    a = a.replace(/s/, "");
    b = b.toLowerCase();
    b = b.replace(/ie$/, "y");
    b = b.replace(/men$/, "man");
    b = b.replace(/s/, "");
    return a.includes(b) || b.includes(a);
}
function getSpecific(parsedField, model) {
    const initialModel = model;
    if (parsedField[model]) {
        if (parsedField[model]) {
            return parsedField[model];
        }
        model = model.replace(/ie$/, "y");
        model = model.replace(/men$/, "man");
        if (parsedField[model]) {
            return parsedField[model];
        }
    }
    else {
        const noS = initialModel.replace(/s/g, "");
        for (const key in parsedField) {
            const keyNoS = key.replace(/s/g, "");
            if (key !== "all" && (keyNoS.includes(noS) || noS.includes(keyNoS))) {
                return parsedField[key];
            }
        }
    }
}
function getEquipment(cat, name, profileName, unit) {
    const result = [];
    const equipmentText = unit.Subheadings["Equipment:"];
    if (equipmentText) {
        const rawEquipment = parseUnitField(equipmentText);
        const foundEquipment = [];
        if (rawEquipment.all) {
            foundEquipment.push(...parseEquipment(rawEquipment.all));
        }
        const specific = getSpecific(rawEquipment, profileName);
        if (specific) {
            foundEquipment.push(...parseEquipment(specific));
        }
        for (const equipment of foundEquipment) {
            for (const item of splitAnd(equipment.text)) {
                let target = findImportedEntry(cat, item, "upgrade");
                if (!target) {
                    if (!equipment.details) {
                        console.log(`[EQUIPMENT] Couldn't find Entry ${item}`);
                    }
                    else
                        continue;
                }
                result.push(toEquipment(item, `${name}/${profileName}`, target?.id ?? item));
            }
            if (!equipment.details)
                continue;
            for (const item of splitAnd(equipment.details)) {
                let target = findImportedEntry(cat, item, "upgrade");
                if (!target) {
                    console.log(`[EQUIPMENT] Couldn't find Entry(${item}) From: ${equipment.text}/${equipment.details} ${item}`);
                }
                result.push(toEquipment(target?.name ?? item, `${name}/${profileName}`, target?.id ?? item));
            }
        }
    }
    return result;
}
function getModelEntry(cat, name, profile, unit) {
    const { ruleName, param } = parseSpecialRule(profile.Name); // Same format as a speciel rule
    const profileName = ruleName;
    const sharedProfile = findUnitProfile(cat, name, profileName, "Model");
    if (!sharedProfile) {
        console.error(`Couldn't find shared profile for ${name}/${profileName}`);
        return;
    }
    const cost = profile.Stats.Points === "-" ? 0 : Number(profile.Stats.Points);
    if (isNaN(cost)) {
        console.log(`[MODEL] got a NaN cost in ${name}/${profileName}`);
    }
    const hash = `${name}/model/${profileName}`;
    const model = {
        type: "model",
        subType: profileName.includes('Crew') ? "crew" : undefined,
        name: profileName,
        id: id(hash),
        hidden: false,
        infoLinks: [
            {
                name: profileName,
                hidden: false,
                type: "profile",
                id: id(`${hash}/profile`),
                targetId: sharedProfile.id
            },
        ],
        costs: [{ name: "pts", typeId: "points", value: cost }],
        entryLinks: [],
        infoGroups: [],
        profiles: [],
        selectionEntries: [],
        selectionEntryGroups: [],
        constraints: [],
        categoryLinks: [],
    };
    if (param) {
        const value = parseInt(param.replace(/x/, ""));
        model.constraints.push(toMinConstraint(value, hash), toMaxConstraint(value, hash));
    }
    const baseSizes = unit["Subheadings"]["Base Size:"]?.split(', ') || [];
    const base = getBase(cat, baseSizes, profile);
    if (base) {
        model.infoLinks.push({
            name: "Base",
            hidden: false,
            type: "profile",
            id: id(`${name}/${profileName}/base`),
            targetId: base.id,
            // modifiers: [{ type: "set", value: "Base", field: "name" }]
        });
    }
    else {
        const error = `[BASE] ${baseSizes}`;
        model.entryLinks.push(toEntryLink(error, `${model.name}/bug/base`, error));
    }
    const equipment = getEquipment(cat, name, profileName, unit);
    if (equipment.length) {
        model.entryLinks.push(...equipment);
    }
    const specialRules = getSpecialRules(cat, name, unit, profileName);
    if (specialRules.infoLinks.length) {
        model.infoGroups.push(specialRules);
    }
    if (unit.Subheadings["Troop Type:"]) {
        const category = unit.Subheadings["Troop Type:"].replace('(champion)', "").replace("(character)", "").trim();
        const importedCategory = findImportedCategory(cat, category);
        if (importedCategory) {
            model.categoryLinks.push(toCategoryLink(importedCategory, `${name}/${model.name}`));
        }
        else {
            console.error(`Couldn't find imported category ${category}`);
        }
    }
    return model;
}
function getConstraints(cat, parentName, unitSize) {
    function getMin(min) {
        return {
            type: "min",
            value: min,
            field: "selections",
            scope: "parent",
            shared: true,
            id: id(`${parentName}/min`)
        };
    }
    function getMax(max) {
        return {
            type: "max",
            value: max,
            field: "selections",
            scope: "parent",
            shared: true,
            id: id(`${parentName}/max`)
        };
    }
    const result = [
        getMin(parseInt(unitSize))
    ];
    const minMax = unitSize.match(/([0-9]+)[-]([0-9]+)/);
    if (minMax) {
        result.push(getMax(minMax[2]));
    }
    else if (!unitSize.endsWith("+")) {
        result.push(getMax(parseInt(unitSize)));
    }
    return result;
}
function getBase(cat, baseSizes, profile) {
    function extractSize(text) {
        const pattern = /(\d+)\s*x\s*(\d+)/i;
        const match = text.match(pattern);
        if (match) {
            return `${match[1]}x${match[2]}`;
        }
        return null;
    }
    if (baseSizes.length) {
        let baseSizeString = baseSizes[0];
        if (profile.Name.toLowerCase().includes('Crew')) {
            baseSizeString = baseSizes.find(o => o.includes('crew')) ?? baseSizes[0];
        }
        if (baseSizeString === "N/A")
            return null;
        const found = findImportedProfile(cat, `Base (${extractSize(baseSizeString)})`, "Base");
        return found;
    }
}
function updateProfile(cat, profile) {
    const existing = findProfile(cat, profile);
    if (existing) {
        if (!isSameCharacteristics(existing.characteristics, profile.characteristics)) {
            existing.characteristics = profile.characteristics;
        }
        return existing;
    }
    else {
        return $store.add_node("sharedProfiles", cat, profile);
    }
}
function parseUnitField(field) {
    const clean = field.replace(/([\n]|\s)+/g, " ");
    return splitByCenterDot(clean);
}
function removePrefix(from, prefix) {
    if (from.startsWith(prefix)) {
        return from.substring(prefix.length);
    }
    return from;
}
function parseEquipment(field) {
    const parsed = extractTextAndDetails(field);
    for (const found of parsed) {
        if (found.details === null) {
            continue;
        }
        if (found.details.includes("see below")) {
            found.details = null;
            continue;
        }
        if (found.details.includes("see page")) {
            found.details = null;
            continue;
        }
        if (found.details.startsWith('counts as ')) {
            found.details = removePrefix(found.details, 'counts as ');
        }
    }
    return parsed;
}
function commonGroups(what, token) {
    what = what.toLowerCase();
    switch (what) {
        case "magic items":
            return "Magic Items";
        case "magic standard":
            return "Magic Standard";
        case "daemonic icon":
            return "Daemonic Icons";
        case "daemonic gifts":
            return "Daemonic Gifts";
        case "vampiric powers":
            return "Vampiric Powers";
        case "big name":
            return "Big Name";
        default:
            if (what.includes("special rule") || token?.includes("special rule")) {
                return "Special Rules";
            }
            if (what.includes("level")) {
                return "Wizard Level";
            }
            if (what.includes("mount") || token?.includes("mount")) {
                return "Mount";
            }
            if (what.includes("daemon") && what.includes("of")) {
                return "Special Rules";
            }
            return "Equipment";
    }
}
function findModel(models, model) {
    const foundModel = models.find(o => cmpModel(o.name, model)) ?? models.find(o => cmpModel2(o.name, model));
    return foundModel;
}
function findModels(models, model) {
    const foundModel = models.filter(o => cmpModel(o.name, model)) ?? models.filter(o => cmpModel2(o.name, model));
    return foundModel;
}
async function modifyUnit(cat, unit, source) {
    const unitName = unit.Name;
    const entry = {
        type: "unit",
        import: true,
        name: unitName,
        hidden: false,
        profiles: [],
        selectionEntries: [],
        selectionEntryGroups: [],
        infoGroups: [],
        entryLinks: [],
        costs: [],
        constraints: [],
        categoryLinks: [],
        id: id(`${unitName}/unit`),
        collective: false,
    };
    if (unit['Points']) {
        const unitCost = parseInt(unit['Points']);
        if (isNaN(unitCost)) {
            console.log(`[UNIT] got a NaN cost in Unit ${unitName}`);
        }
        entry.costs.push({ name: "pts", typeId: "points", value: unitCost });
    }
    const group = getSpecialRules(cat, unitName, unit);
    if (group.infoLinks.length) {
        entry.infoGroups.push(group);
    }
    const unitProfile = toUnitProfile(unitName, unit);
    if (unitProfile) {
        entry.profiles.push(unitProfile);
    }
    if (!unit.Profiles.length) {
        console.log(`[UNIT] ${unitName} has no profiles`);
    }
    const modelEntries = [];
    for (const child of source.localSelectionsIterator()) {
        if (child.type === "model") {
            const modelEntry = {
                costs: [],
                entryLinks: [],
                infoGroups: [],
                profiles: [],
                selectionEntries: [],
                selectionEntryGroups: [],
                constraints: [],
                categoryLinks: [],
                infoLinks: [],
                ...(JSON.parse(child.toJson()))
            };
            entry.selectionEntries.push(modelEntry);
            modelEntries.push(modelEntry);
        }
    }
    for (const profile of unit.Profiles || []) {
        const modelEntry = getModelEntry(cat, unitName, profile, unit);
        if (modelEntry) {
            entry.selectionEntries.push(modelEntry);
            modelEntries.push(modelEntry);
        }
    }
    if (!modelEntries.length) {
        notify({ text: "Add models entries first", type: "error" });
        return;
    }
    if (unit.Subheadings["Unit Size:"]) {
        const firstEntry = entry.selectionEntries[0];
        const unitSize = unit.Subheadings["Unit Size:"].trim();
        if (!unitSize.match('^[0-9]+[+]?$') && !unitSize.match(/([0-9])+[-]([0-9])+/)) {
            // console.warn(`[UNIT SIZE] Unparsed value in ${unitName}:`, unitSize);
            const error = `[UNIT SIZE] Unparsed value: ${unitSize}`;
            entry.entryLinks.push(toEntryLink(error, `${unitName}/bug`, error));
        }
        const constraints = getConstraints(cat, `${unitName}/${firstEntry.name}`, unitSize);
        firstEntry.constraints = constraints;
    }
    else {
        console.log(`[UNIT] ${unitName} has no Unit Size`);
    }
    if (unit.Subheadings["Troop Type:"]) {
        if (unit.Subheadings["Troop Type:"].toLowerCase().includes('character')) {
            const model = modelEntries[0];
            const GENERAL_ID = "7d76-b1a1-1535-a04c";
            getGroup(model, "Command", unitName).entryLinks.push(toEntryLink("General", `${unitName}/${model.name}`, GENERAL_ID));
        }
        if (unit.Subheadings["Troop Type:"].toLowerCase().includes('chariot')) {
            for (const model of modelEntries.slice(1)) {
                const category = findImportedCategory(cat, "CHARIOT CREW");
                if (category) {
                    model.categoryLinks.push(toCategoryLink(category, `${unitName}/${model.name}`));
                }
                else {
                    console.error(`Couldn't find imported category ${category}`);
                }
            }
        }
    }
    const loresToAdd = [];
    if (unit.Subheadings["Magic:"]) {
        const magicText = unit.Subheadings["Magic:"];
        const knowsFrom = magicText.split('\n').map(o => o.trim()).filter(o => o.startsWith("•")).map(o => removePrefix(o, "• "));
        const otherText = magicText.split('\n').filter(o => !o.includes("•")).map(o => o.trim()).join(" ");
        for (const line of otherText.split('.').map(o => o.trim())) {
            if (line.includes("knows")) {
                const match = line.match(/^(?:A|Every) (.*?) (?:that is a Wizard knows spells|knows spells|knows a spell) from(?: the)? (.*)? Lores? of Magic:?$/i);
                if (match) {
                    loresToAdd.push({
                        wizardModel: match[1],
                        knowsFrom: knowsFrom.length ? knowsFrom : [match[2]],
                        requiresWizard: line.includes('that is a Wizard'),
                        isWizard: line.includes("Every")
                    });
                }
                continue;
            }
            const matchWizard = line.match(/^AN? (.*) is a (.*)$/i);
            if (matchWizard) {
                const [_, wizardName, wizardLevelText] = matchWizard;
                const level = wizardLevelText.match(/\d+/)[0];
                const model = findModel(modelEntries, wizardName);
                if (model) {
                    const wizardText = `Wizard Level ${level}`;
                    const wizardEntry = findImportedEntry(cat, wizardText, "upgrade");
                    const wizardGroup = getGroup(model, "Wizard Level", `${unitName}/${model.name}`);
                    wizardGroup.constraints = [toMinConstraint(1, `${unitName}/${model.name}/wizardlevel`), toMaxConstraint(1, `${unitName}/${model.name}/wizardlevel`)];
                    const link = toEntryLink(wizardText, `${unitName}/${model.name}`, wizardEntry?.id);
                    wizardGroup.entryLinks.push(link);
                    wizardGroup.defaultSelectionEntryId = link.id;
                }
                else {
                    console.log([matchWizard[1], matchWizard[2]], "no model");
                }
            }
        }
    }
    if (unit.Subheadings["Options:"]) {
        const parsedOptions = optionsToGroups(unit.Subheadings["Options:"]);
        function getScope(scope, type) {
            if (type === "replace")
                return modelEntries;
            if (scope === "self") {
                return [modelEntries[0]];
            }
            if (scope === "unit") {
                return [entry];
            }
            const foundModel = findModel(modelEntries, scope);
            return foundModel ? [foundModel] : modelEntries;
        }
        console.log('Parsed options', parsedOptions);
        for (const parsedGroup of parsedOptions.groups) {
            for (const model of getScope(parsedGroup.scope, parsedGroup.amount)) {
                const groupHash = `${unitName}/${model.name}/${parsedGroup.entries.map(o => o.what).join(',')}`;
                const group = toGroup("Options", groupHash);
                const types = new Set();
                for (const parsedEntry of parsedGroup.entries) {
                    const perModelCost = parsedEntry.scope === "unit" && parsedEntry.details?.includes('per model');
                    const baseCost = parsedEntry.details ? (perModelCost ? "0" : parseDetails(parsedEntry.details)) : 0;
                    const text = parsedEntry.what;
                    let ruleText = parsedEntry.what.replace(/special rule(s)?/, "").replace(/^The /, "");
                    const { ruleName, param } = parseSpecialRule(ruleText);
                    const ruleEntry = toEntry(ruleText, `${groupHash}/${text}`, baseCost);
                    if (perModelCost) {
                        ruleEntry.modifiers.push(getPerModelCostModifier(parsedEntry.details));
                    }
                    ruleEntry.constraints = [toMaxConstraint(1, `${groupHash}/${text}`)];
                    const profile = findImportedProfile(cat, ruleName, "Special Rule");
                    if (profile) {
                        types.add("Special Rule");
                        ruleEntry.infoLinks.push(toSpecialRuleLink(ruleName, `${groupHash}/${text}/link`, profile?.id, param));
                        group.selectionEntries.push(ruleEntry);
                        continue;
                    }
                    const profile2 = findImportedEntry(cat, text, "upgrade");
                    if (!profile2) {
                        console.log("Couldn't import profile", unitName, "/", text);
                    }
                    else {
                        for (const p of profile2?.profiles || []) {
                            if (p.typeName)
                                types.add(p.typeName);
                        }
                        for (const l of profile2?.infoLinks || []) {
                            if (l.target?.typeName)
                                types.add(l.target.typeName);
                        }
                    }
                    const equipmentLink = toEquipment(text, `${groupHash}/${text}`, profile2?.id);
                    group.entryLinks?.push(equipmentLink);
                    equipmentLink.costs = [toCost(baseCost)];
                    equipmentLink.constraints = [];
                    if (perModelCost) {
                        equipmentLink.modifiers.push(getPerModelCostModifier(parsedEntry.details));
                    }
                }
                const [min, max] = parsedGroup.groupAmount.split('-');
                group.constraints = [toMinConstraint(min, `${groupHash}`), toMaxConstraint(max, `${groupHash}`)];
                model.selectionEntryGroups.push(group);
                if (parsedGroup.specification) {
                    group.name = toTitleCase(parsedGroup.specification).replace(":", "");
                }
                else {
                    console.error(unitName, types);
                    if (types.size === 1 && types.has("Weapon"))
                        group.name = "Weapons";
                    if (types.size === 1 && types.has("Armour"))
                        group.name = "Armour";
                    if (types.size === 2 && types.has("Weapon") && types.has("Armour"))
                        group.name = "Equipment";
                    if (types.size === 1 && types.has("Special Rule"))
                        group.name = "Special Rules";
                }
            }
            // console.error(parsedEntry)
            // console.warn(parsedEntry.groupAmount)
        }
        const magicStandard = [];
        for (const parsedEntry of parsedOptions.entries) {
            const perModelCost = parsedEntry.scope === "unit" && parsedEntry.details?.includes('per model');
            const baseCost = parsedEntry.details ? (perModelCost ? "0" : parseDetails(parsedEntry.details)) : 0;
            if (parsedEntry.type === "upgrade") {
                // Find and remove the model
                const modelName = parsedEntry.to.replace(" (champion)", "");
                const model = findModel(modelEntries, modelName);
                if (model) {
                    entry.selectionEntries = entry.selectionEntries.filter(o => o !== model);
                }
                else {
                    if (modelName.includes("musician")) {
                        const MUSICIAN_ID = "40f2-dd77-f0ca-3663";
                        const group = getGroup(entry, "Command", unitName);
                        const musician = toEntry("Musician", `${unitName}/command`, parsedEntry.details);
                        musician.comment = `upgrades: ${modelEntries[0].id}`;
                        musician.infoLinks.push(toProfileLink("Musician", `${unitName}/command/profile`, MUSICIAN_ID));
                        musician.constraints = [toMaxConstraint(1, `${unitName}/command/musician`)];
                        musician.subType = "crew";
                        musician.type = "model";
                        group.selectionEntries.push(musician);
                    }
                    else if (modelName.includes('standard bearer')) {
                        const STANDARD_BEARER_ID = "bcf8-d942-102e-b155";
                        const group = getGroup(entry, "Command", unitName);
                        const bearer = toEntry("Standard Bearer", `${unitName}/command`, parsedEntry.details);
                        bearer.infoLinks.push(toProfileLink("Standard Bearer", `${unitName}/command/profile`, STANDARD_BEARER_ID));
                        bearer.comment = `upgrades: ${modelEntries[0].id}`;
                        bearer.constraints = [toMaxConstraint(1, `${unitName}/command/standard bearer`)];
                        bearer.type = "model";
                        bearer.subType = "crew";
                        group.selectionEntries.push(bearer);
                    }
                    else {
                        console.log(`Couldn't find model to upgrade ${unitName}/${modelName}`);
                    }
                    continue;
                }
                // Make the model a champion
                model.entryLinks = model.entryLinks.filter(o => o.type !== "selectionEntry");
                model.selectionEntryGroups = [];
                model.subType = "crew";
                model.infoLinks.push(toProfileLink("Champion", `${unitName}/command`, "5f1c-fd04-b0d5-d5e"));
                model.constraints.push(toMaxConstraint(1, `${unitName}/${model.name}/champion`));
                model.comment = `upgrades: ${modelEntries[0].id}`;
                // Add the model to command
                getGroup(entry, "Command", unitName).selectionEntries.push(model);
            }
            else if (parsedEntry.type === "replace") {
                for (const model of getScope(parsedEntry.scope, parsedEntry.type)) {
                    // Find the weapon to replace and remove it
                    const weaponName = parsedEntry.what;
                    const toReplace = model.entryLinks.find(o => cmpItems(o.name, weaponName));
                    if (toReplace) {
                        model.entryLinks = model.entryLinks.filter(o => o !== toReplace);
                    }
                    else {
                        console.warn("Couldn't find weapon to replace", unitName, model.name, weaponName, "with", parsedEntry.with);
                        continue;
                    }
                    // Create a Equipment group and its entries
                    const newGroup = getGroup(model, "Equipment", `${unitName}/${model.name}`);
                    const replaceWith = parsedEntry.with;
                    const replaceWithEntry = findImportedEntry(cat, replaceWith, "upgrade");
                    const replaceWithLink = toEquipment(replaceWithEntry?.name ?? replaceWith, `${unitName}/${model.name}`, replaceWithEntry?.id);
                    // Remove constraints as we rely on the group
                    toReplace.constraints = [];
                    if (parsedEntry.scope === "unit") {
                        toReplace.collective = true;
                        replaceWithLink.collective = true;
                        newGroup.collective = true;
                        model.collective = true;
                    }
                    replaceWithLink.constraints = [];
                    replaceWithLink.costs = [toCost(parsedEntry.details)];
                    if (perModelCost) {
                        replaceWithLink.modifiers?.push(getPerModelCostModifier(parsedEntry.details, `${unitName}/${model.name}/${replaceWith}`));
                    }
                    if (parsedEntry.amount !== "*") {
                        replaceWithLink.constraints.push(toMaxConstraint(parsedEntry.amount, `${unitName}/${model.name}/equipment/${parsedEntry.scope}`, "roster"));
                    }
                    newGroup.defaultSelectionEntryId = toReplace.id;
                    newGroup.entryLinks.push(toReplace);
                    newGroup.entryLinks.push(replaceWithLink);
                    newGroup.constraints = [toMinConstraint(1, `${unitName}/${model.name}/equipment`), toMaxConstraint(1, `${unitName}/${model.name}/equipment`)];
                }
            }
            else {
                const upgradeName = parsedEntry.what;
                if (!upgradeName) {
                    console.error(unitName, parsedEntry, "no name");
                    continue;
                }
                const commonGroup = commonGroups(upgradeName, parsedEntry.token);
                for (const model of getScope(parsedEntry.scope, parsedEntry.amount)) {
                    switch (commonGroup) {
                        case "Equipment":
                            const group = getGroup(model, commonGroup, `${unitName}/${model.name}`);
                            const equipmentEntry = findImportedEntry(cat, upgradeName, "upgrade");
                            if (!equipmentEntry) {
                                console.log("Couldn't import profile", unitName, "/", upgradeName, parsedEntry.token, parsedEntry);
                            }
                            const equipment = toEquipment(equipmentEntry?.name ?? upgradeName, `${unitName}/${model.name}`, equipmentEntry?.id);
                            equipment.costs = [toCost(baseCost)];
                            equipment.constraints = [toMaxConstraint(1, `${unitName}/${model.name}/${upgradeName}`)];
                            if (perModelCost) {
                                equipment.modifiers?.push(getPerModelCostModifier(parsedEntry.details, `${unitName}/${model.name}/${upgradeName}`));
                            }
                            if (parsedEntry.amount !== "*") {
                                equipment.constraints.push(toMaxConstraint(1, `${unitName}/${model.name}/${upgradeName}/roster`, "roster"));
                            }
                            group.entryLinks?.push(equipment);
                            break;
                        case "Magic Items":
                        case "Vampiric Powers":
                        case "Daemonic Icons":
                        case "Big Name":
                        case "Daemonic Gifts":
                            const Ids = {
                                "Magic Items": "1539-fd78-88f-badd",
                                "Daemonic Icons": "e5a3-889f-31ed-d42f",
                                "Daemonic Gifts": "ce0c-2efd-59ad-f802",
                                "Big Name": "b8ce-a2e-453d-d59e",
                                "Vampiric Powers": "a88c-1e61-583f-2bab",
                            };
                            const link = toGroupLink(commonGroup, `${unitName}/${model.name}`, Ids[commonGroup]);
                            if (parseDetails(parsedEntry.details)) {
                                link.constraints.push({
                                    type: "max",
                                    value: parseDetails(parsedEntry.details),
                                    field: "points",
                                    scope: "parent",
                                    shared: false,
                                    id: id(`${unitName}/${model.name}/${commonGroup}/max`)
                                });
                            }
                            model.entryLinks.push(link);
                            break;
                        case "Wizard Level":
                            const wizardLevel = getGroup(model, commonGroup, `${unitName}/${model.name}`);
                            const match = parsedEntry.what.match(/\d+/);
                            const wizardLevelName = `Wizard Level ${match[0]}`;
                            const wizardEntry = findImportedEntry(cat, wizardLevelName, "upgrade");
                            const wizardLink = toEntryLink(wizardLevelName, `${unitName}/${model.name}`, wizardEntry?.id);
                            wizardLink.costs = [toCost(parsedEntry.details)];
                            if (!wizardLevel.constraints) {
                                wizardLevel.constraints = [toMaxConstraint(1, `${unitName}/${model.name}/wizardlevel`)];
                            }
                            wizardLevel.entryLinks.push(wizardLink);
                            break;
                        case "Magic Standard":
                            magicStandard.push(parsedEntry);
                            break;
                        case "Mount":
                            model.entryLinks?.push(toEntryLink(`${parsedEntry.token} ${parsedEntry.what}`, `${unitName}/${model.name}`, `${parsedEntry.token} ${parsedEntry.what}`));
                            break;
                        case "Special Rules":
                            const rules = getGroup(model, commonGroup, `${unitName}/${model.name}`);
                            let ruleText = parsedEntry.what.replace(/special rule(s)?/, "");
                            ruleText = ruleText.replace("\u0007 ", "");
                            ruleText = ruleText.replace("\u0007", "");
                            const { ruleName, param } = parseSpecialRule(ruleText);
                            const ruleEntry = toEntry(ruleText, `${unitName}/${model.name}`, baseCost);
                            ruleEntry.constraints = [toMaxConstraint(1, `${unitName}/${model.name}/${ruleName}`)];
                            if (perModelCost) {
                                ruleEntry.modifiers?.push(getPerModelCostModifier(parsedEntry.details, `${unitName}/${model.name}/${ruleName}`));
                            }
                            if (parsedEntry.amount !== "*") {
                                if (parsedEntry.amount === "per 1,000 points") {
                                    const rosterMax = toMaxConstraint(0, `${unitName}/${model.name}/${ruleName}/roster`, "roster");
                                    ruleEntry.constraints.push(rosterMax);
                                    const modifier = {
                                        type: "increment",
                                        value: 1,
                                        field: rosterMax.id,
                                        repeats: [
                                            {
                                                value: 1000,
                                                repeats: 1,
                                                field: "limit::points",
                                                scope: "roster",
                                                childId: "any",
                                                shared: true,
                                                roundUp: false,
                                            }
                                        ]
                                    };
                                    ruleEntry.modifiers.push(modifier);
                                }
                                else {
                                    const rosterMax = toMaxConstraint(parsedEntry.amount, `${unitName}/${model.name}/${ruleName}/roster`, "roster");
                                    ruleEntry.constraints.push(rosterMax);
                                }
                            }
                            const profile = findImportedProfile(cat, ruleName, "Special Rule");
                            if (!profile) {
                                console.log(`[SPECIAL RULES] Couldn't find Special Rule: ${ruleName}`);
                                continue;
                            }
                            ruleEntry.infoLinks.push(toSpecialRuleLink(ruleName, `${unitName}/${model.name}`, profile.id, param));
                            rules.selectionEntries.push(ruleEntry);
                            break;
                    }
                }
            }
        }
        if (magicStandard.length) {
            const MAGIC_STANDARD_ID = "6bbe-8054-19b7-e5d6";
            const parsedEntry = magicStandard[0];
            const command = getGroup(entry, "Command", `${unitName}/command`);
            const bearer = command.selectionEntries?.find(o => o.name === "Standard Bearer");
            const magicLink = toGroupLink("Magic Standard", `${unitName}/command`, MAGIC_STANDARD_ID);
            magicLink.constraints = [{
                type: "max",
                value: parseDetails(parsedEntry.details),
                field: "points",
                scope: "parent",
                shared: false,
                id: id(`${unitName}/command/magic standard/max`)
            }];
            if (parsedEntry.amount === "per 1,000 points") {
                bearer.entryLinks.push(toEntryLink("Magic Standard per 1,000 points", `${unitName}/command/standard/bug`));
            }
            bearer.entryLinks.push(magicLink);
        }
        if (loresToAdd.length) {
            for (const { wizardModel, knowsFrom, requiresWizard } of loresToAdd) {
                const foundModel = findModels(modelEntries, wizardModel);
                const models = foundModel.length ? foundModel : modelEntries;
                for (const wantsLore of models) {
                    const group = getGroup(wantsLore, "Lores of Magic", `${unitName}/${wantsLore?.name}`);
                    group.constraints = [toMinConstraint(1, `${unitName}/${wantsLore.name}/lores of magic`), toMaxConstraint(1, `${unitName}/${wantsLore.name}/lores of magic`)];
                    for (const magicBranch of knowsFrom) {
                        const found = findImportedEntry(cat, magicBranch, "upgrade");
                        const link = toEntryLink(magicBranch, `${unitName}/${wantsLore?.name}`, found?.id ?? magicBranch);
                        group.entryLinks.push(link);
                    }
                    if (requiresWizard || true) {
                        group.modifiers.push({
                            comment: "Hide if not a wizard",
                            type: "set",
                            value: true,
                            field: "hidden",
                            "conditions": [
                                { type: "equalTo", value: 0, field: "selections", scope: "parent", childId: "7d84-39e9-a5f-947e", shared: true },
                                { type: "equalTo", value: 0, field: "selections", scope: "parent", childId: "8e47-73e8-f7f9-808", shared: true },
                                { type: "equalTo", value: 0, field: "selections", scope: "parent", childId: "59f1-ac46-8123-3f8d", shared: true },
                                { type: "equalTo", value: 0, field: "selections", scope: "parent", childId: "50bd-b918-574a-60c3", shared: true }
                            ],
                        });
                    }
                }
            }
        }
    }
    const entriesToAdd = [];
    if (unit.Subheadings["Troop Type:"]?.includes("character")) {
        for (const model of modelEntries) {
            const newEntry = {
                ...entry,
                name: model.name,
                id: id(`character/${model.name}`),
                profiles: [],
                selectionEntries: [],
                infoGroups: []
            };
            const modelChild = entry.selectionEntries.find(o => o.name === model.name);
            newEntry.selectionEntries.push(modelChild);
            if (entry.selectionEntries.length > modelEntries.length) {
                console.error("CHARACTER BUG", unitName);
            }
            for (const infoGroup of entry.infoGroups) {
                const copy = JSON.parse(JSON.stringify(infoGroup));
                copy.id += `/${model.name}`;
                for (const infoLink of copy.infoLinks) {
                    infoLink.id += `/${model.name}`;
                }
                newEntry.infoGroups.push(copy);
            }
            const modelUnitProfile = toUnitProfile(model.name, unit);
            if (modelUnitProfile) {
                newEntry.profiles.push(modelUnitProfile);
            }
            entriesToAdd.push(newEntry);
        }
    }
    else {
        entriesToAdd.push(entry);
    }
    console.log("Adding", entriesToAdd);
    await $store.remove();
    for (const entry of entriesToAdd) {
        const existingLink = findRootUnit(cat, entry.name);
        if (existingLink) {
            $store.del_node(existingLink);
        }
        const addedUnit = await $store.create_child("sharedSelectionEntries", cat, entry);
        const link = {
            import: true,
            name: entry.name,
            hidden: false,
            id: id(`${entry.name}/root`),
            type: "selectionEntry",
            targetId: addedUnit?.id,
            categoryLinks: [],
        };
        $store.add_node("entryLinks", cat, link);
    }
}

export default {
    name: "[TOW 3] Paste Unit Profiles & Equipment & Options",
    hooks: {
        async paste(e, text) {
            await $catalogue.manager.loadAll()
            $catalogue.manager.getAllLoadedCatalogues().map(o => o.processForEditor())
            const selected = $store.get_selected();
            if ((text.includes("Options:") || text.includes('Equipment:') || (text.includes('WS') && text.includes('Points'))) && selected) {
                if (selected.parentKey !== "sharedSelectionEntries") {
                    notify({ text: "Select a (top-level) sharedSelectionEntry", type: "error" });
                    return;
                }
                const unit = parseUnitText(text);
                unit.Name = selected.getName();
                console.log(unit);
                for (const rawRule of unit["Special Rules"] || []) {
                    const rule = toSpecialRule(removeSuffix(rawRule.name, " (X)"), rawRule.description);
                    updateProfile(selected.catalogue, rule);
                }
                for (const rawProfile of unit["Profiles"] || []) {
                    parseSpecialRule(rawProfile.Name); // Same format as a special rule  
                    const parsed = toModelProfile(rawProfile, unit.Name);
                    updateProfile(selected.catalogue, parsed);
                }
                await modifyUnit(selected.catalogue, unit, selected);
            }
            return null
        }
    }
};