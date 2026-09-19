/**
 * Finds magic items (and any other upgrade entries) whose rules text carries
 * a "Models whose troop type is 'X'[, 'Y'][ or 'Z'] only." eligibility clause
 * and adds a structural hide-modifier enforcing it — the same pattern already
 * used by hand for Wild Rider Kindred / Scale Of False Promise.
 *
 * Scope, deliberately narrow:
 *   - Only the TROOP TYPE portion of the clause is enforced. A restriction
 *     like "Beastman Chieftains and Beastman Shamans whose troop type is
 *     'infantry' only" still has its troop-type half enforced, but the
 *     "must be a Beastman Chieftain/Shaman" half is NOT — that's reported
 *     separately as partial coverage so it can be checked by hand.
 *   - Only matches a clause ending in "...only." (an eligibility
 *     restriction). Clauses describing an effect on OTHER models (e.g.
 *     "Enemy models whose troop type is 'monster' suffer...", "a friendly
 *     unit whose troop type is 'infantry' or 'cavalry', that unit
 *     recovers...") don't end in "only" right after the troop-type list and
 *     are skipped. As a second guard, a match is also skipped if "enemy" or
 *     "friendly" appears in the 40 characters before it.
 *
 * IDEMPOTENT — tags each added modifier with a comment marker and skips
 * entries that already carry one.
 */

const MARKER = "auto: troop-type restriction";

// NOTE: War Machine / Behemoth / Monstrous Creature ids below match
// add-troop-type-special-rules.js, which disagrees with DATA_MODEL.md.
// Verify before relying on this — see chat writeup.
const TROOP_TYPE_ALIASES = {
  "infantry": [
    "f3f7-ca43-674e-115f", // Regular Infantry
    "ca7e-d004-ccde-caf3", // Heavy Infantry
    "5c55-f9d6-b181-92f8", // Monstrous Infantry
  ],
  "regular infantry": ["f3f7-ca43-674e-115f"],
  "heavy infantry": ["ca7e-d004-ccde-caf3"],
  "monstrous infantry": ["5c55-f9d6-b181-92f8"],

  "cavalry": [
    "600c-7d08-5be1-fe0c", // Light Cavalry
    "5165-d052-cfc2-5887", // Heavy Cavalry
    "2c85-5f2b-9288-1257", // Monstrous Cavalry
  ],
  "light cavalry": ["600c-7d08-5be1-fe0c"],
  "heavy cavalry": ["5165-d052-cfc2-5887"],
  "monstrous cavalry": ["2c85-5f2b-9288-1257"],

  "chariot": [
    "7dce-b0f0-2217-2820", // Light Chariot
    "d768-7cf0-de0a-c249", // Heavy Chariot
  ],
  "light chariot": ["7dce-b0f0-2217-2820"],
  "heavy chariot": ["d768-7cf0-de0a-c249"],

  "monstrous creature": ["fb36-5275-617-c895"],
  "behemoth": ["3755-6732-99b2-c713"],

  "war beast": ["19f9-8dd8-bba4-625b"],
  "swarm": ["db92-54fd-e023-d69f"],
  "swarms": ["db92-54fd-e023-d69f"],
  "war machine": ["9fcf-19ad-fe84-9c61"],
};

// "monster" alone (not "monstrous creature") covers both Monstrous
// Creature and Behemoth per the rulebook's Monster troop type.
TROOP_TYPE_ALIASES["monster"] = [
  ...TROOP_TYPE_ALIASES["monstrous creature"],
  ...TROOP_TYPE_ALIASES["behemoth"],
];

const RESTRICTION_RE =
  /whose troop type is\s+((?:[‘'][^’']+[’'](?:\s*,\s*)?)+(?:\s*or\s+[‘'][^’']+[’'])?)\s+only\b/gi;

const QUOTED_RE = /[‘']([^’']+)[’']/g;

function extractRestrictions(text) {
  const results = [];
  let match;

  RESTRICTION_RE.lastIndex = 0;
  while ((match = RESTRICTION_RE.exec(text))) {
    const start = Math.max(0, match.index - 40);
    const context = text.slice(start, match.index);

    if (/\b(enemy|friendly)\b/i.test(context)) continue;

    const phrases = [];
    let qm;
    QUOTED_RE.lastIndex = 0;
    while ((qm = QUOTED_RE.exec(match[1]))) {
      phrases.push(qm[1].trim().toLowerCase());
    }

    // Subject is whatever precedes the clause within its own sentence,
    // not the start of the whole description — most items open with
    // flavor text before the eligibility clause ever appears.
    const sentenceStart =
      Math.max(
        text.lastIndexOf(".", match.index),
        text.lastIndexOf("\n", match.index)
      ) + 1;
    const subject = text.slice(sentenceStart, match.index).trim();

    results.push({ raw: match[0], phrases, subject });
  }

  return results;
}

function resolveCategoryIds(phrases, unresolved) {
  const ids = new Set();

  for (const phrase of phrases) {
    const mapped = TROOP_TYPE_ALIASES[phrase];

    if (!mapped) {
      unresolved.push(phrase);
      continue;
    }

    for (const id of mapped) ids.add(id);
  }

  return [...ids];
}

function alreadyMarked(node) {
  return (node.modifiers || []).some((m) => m.comment === MARKER);
}

function resolveProfileText(link) {
  const profile = link.target;
  if (!profile) return null;

  const characteristic = (profile.characteristics || []).find(
    (c) => c.name === "Description"
  );

  return characteristic ? characteristic.$text || null : null;
}

export default {
  name: "Enforce Magic Item Troop Type Restrictions",

  description:
    "Scans upgrade entries' rules text for a \"Models whose troop type is " +
    "'X' only\" eligibility clause and adds a hide-modifier enforcing it. " +
    "Only the troop-type portion is enforced; named-hero/faction " +
    "qualifiers in the same sentence are reported but not checked. " +
    "Safe to re-run — skips entries already marked.",

  arguments: [
    {
      name: "catalogues",
      type: "catalogue[]",
    },
  ],

  async run(catalogues) {
    const report = {
      modifiersAdded: 0,
      alreadyMarked: 0,
      partialCoverage: [],
      unresolvedPhrases: [],
    };

    for (const catalogue of catalogues) {
      const pending = [];

      catalogue.forEachObjectWhitelist((node) => {
        if (typeof node.getType !== "function") return;
        if (node.getType() !== "upgrade") return;
        if (!node.infoLinks || node.infoLinks.length === 0) return;

        for (const link of node.infoLinks) {
          if (link.type !== "profile") continue;

          const text = resolveProfileText(link);
          if (!text) continue;

          const restrictions = extractRestrictions(text);
          if (restrictions.length === 0) continue;

          if (alreadyMarked(node)) {
            report.alreadyMarked++;
            continue;
          }

          const unresolvedHere = [];
          const allPhrases = restrictions.flatMap((r) => r.phrases);
          const ids = resolveCategoryIds(allPhrases, unresolvedHere);

          if (unresolvedHere.length) {
            report.unresolvedPhrases.push(
              `${node.name}: ${unresolvedHere.join(", ")}`
            );
          }

          if (ids.length === 0) continue;

          // Flag named-hero/faction qualifiers riding along in the same
          // clause — these aren't enforced by this script. A bare "Models"
          // subject (whatever precedes the clause in its own sentence)
          // means the restriction is troop-type-only; anything else
          // (a hero name, "Models with the Grail Vow", etc.) is partial.
          const hasQualifiedSubject = restrictions.some(
            (r) => !/^models$/i.test(r.subject)
          );

          if (hasQualifiedSubject) {
            report.partialCoverage.push(node.name);
          }

          pending.push(() => {
            $store.add_node("modifiers", node, {
              comment: MARKER,
              field: "hidden",
              type: "set",
              value: true,
              conditions: ids.map((id) => ({
                type: "atMost",
                value: 0,
                field: "selections",
                scope: "ancestor",
                shared: true,
                childId: id,
              })),
            });

            report.modifiersAdded++;
          });

          // One restriction clause per item is the norm; stop after the
          // first infoLink that yields one.
          break;
        }
      });

      for (const apply of pending) apply();
    }

    return [
      "<h2>Troop type restrictions enforced</h2>",
      "<ul>" +
        `<li>modifiers added: <b>${report.modifiersAdded}</b></li>` +
        `<li>already marked: <b>${report.alreadyMarked}</b></li>` +
        `<li>partial coverage (troop type only, name/faction not checked): <b>${report.partialCoverage.length}</b></li>` +
        `<li>unresolved troop-type phrases: <b>${report.unresolvedPhrases.length}</b></li>` +
        "</ul>",
      report.partialCoverage.length
        ? "<h3>Partial coverage — verify name/faction restriction separately</h3><ul>" +
          report.partialCoverage.map((n) => `<li>${n}</li>`).join("") +
          "</ul>"
        : "",
      report.unresolvedPhrases.length
        ? "<h3>Unresolved troop-type phrases</h3><ul>" +
          report.unresolvedPhrases.map((n) => `<li>${n}</li>`).join("") +
          "</ul>"
        : "",
    ];
  },
};
