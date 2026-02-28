---
name: lit-review
description: Conducts a targeted literature search grounded in the current project context. Reads the proposal, CLAUDE.md, MEMORY.md, and any mechanism memo before searching. Writes a thematically organized synthesis to literature/lit-review-[date].md with a Most Relevant 10 shortlist and Gap Analysis.
disable-model-invocation: true
argument-hint: "[optional: specific topic or construct to focus on]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "WebSearch", "WebFetch"]
---

# Literature Review — Context-Grounded

Conduct a targeted, project-aware literature search and write a thematic synthesis.

**Input:** `$ARGUMENTS` — optional focus (e.g., "scarcity and identity", "affective forecasting"). If omitted, derive focus from project context.

---

## Phase 1: Ground in Project Context

**Read these files before searching anything.** The search must be informed by the project, not generic.

### 1a: Read proposal
Find and read the project proposal (PDF or Markdown at project root or `references/`). Extract:
- Research topic and domain
- Key constructs (IVs, DVs, proposed mediators/moderators)
- Theoretical framework named in the proposal
- Gaps the proposal claims to fill

### 1b: Read CLAUDE.md and MEMORY.md
Extract the current project state: study designs, key variables, target journals, findings so far.

### 1c: Check for mechanism memo
```
Glob("memos/mechanism-*.md")
```
If a mechanism memo exists, read the most recent one. Use the recommended mechanism as a primary search target. Note any flagged alternative mechanisms — search for those too.

### 1d: Read existing manuscripts and literature notes
```
Glob("manuscripts/**")
Glob("literature/**")
```
Extract all citations already referenced. These are the baseline — do not re-summarize papers the team clearly already knows. Instead, use them to identify adjacents: papers that cite the same works, papers in the same journals within 3 years.

### 1e: Synthesize search scope

Based on everything read, define:
- **Primary search terms** (2–4 key constructs or mechanism labels)
- **Secondary search terms** (moderators, populations, methods)
- **Domain anchors** (consumer psychology, behavioral economics, social cognition — whatever is most relevant)
- **Exclusion criteria** (e.g., clinical populations, non-behavioral outcomes)

State the search scope explicitly before beginning any web search.

---

## Phase 2: Search

### Priority journals — flag these prominently in the output

| Journal | Abbreviation |
|---------|-------------|
| Journal of Consumer Research | JCR |
| Journal of Marketing Research | JMR |
| Journal of Consumer Psychology | JCP |
| Journal of Marketing | JM |
| Psychological Science | PS |
| Journal of Personality and Social Psychology | JPSP |
| Organizational Behavior and Human Decision Processes | OBHDP |
| Journal of Experimental Psychology: General | JEP:G |
| Cognition | Cognition |

Papers from these outlets get a ★ in the synthesis.

### Search strategy

Run searches in this order, refining as you find relevant papers:

**Round 1 — Core constructs**
```
WebSearch: "[primary construct 1] consumer behavior"
WebSearch: "[primary construct 2] experiment psychology"
WebSearch: "[mechanism label] consumer psychology"
```

**Round 2 — Mechanism + moderators**
```
WebSearch: "[mechanism] [moderator] experiment"
WebSearch: "[mechanism] [outcome/DV] meta-analysis"
```

**Round 3 — Adjacent literatures**
```
WebSearch: "[mechanism] [adjacent field: social cognition / behavioral economics / marketing]"
```

**Round 4 — Gaps and tensions**
```
WebSearch: "[construct] null result OR replication OR boundary condition"
WebSearch: "[construct] review OR meta-analysis [current year - 5 to current year]"
```

For each search, fetch the top 3–5 results and extract: authors, year, journal, title, abstract key points.

### What to do with each paper found

For every paper that clears the relevance bar, record:

```
**[Author(s), Year]** — [Title]
- Journal: [name] [★ if priority journal]
- Constructs: [IV], [DV], [mediator/moderator if any]
- Method: [N, design — e.g., "3 lab experiments, N = ~150 each"]
- Key finding: [1-2 sentences, effect direction + size if reported]
- Relevance: [Why it matters for this project — specific connection]
- Gap it reveals: [What it does NOT answer that our project does]
```

Aim for 15–30 papers total across all search rounds. Filter ruthlessly — only include papers with a clear relevance statement.

---

## Phase 3: Organize Thematically

Do NOT organize chronologically. Group papers by the conceptual theme they address. Typical themes for consumer psychology:

- Theoretical foundations of [core mechanism]
- Evidence in consumer contexts
- Boundary conditions and moderators
- Process evidence (mediators, manipulation studies)
- Competing or alternative mechanisms
- Methodological benchmarks (how is [construct] typically measured/manipulated)

The themes should emerge from the papers found, not be imposed in advance. Name them based on what you actually found.

---

## Phase 4: Write the Synthesis

Write to `literature/lit-review-YYYY-MM-DD.md` (use today's date).

```markdown
# Literature Review: [Topic]
**Date:** YYYY-MM-DD
**Project context:** [one sentence — project title and focal question]
**Search terms used:** [list]
**Mechanism focus:** [from mechanism memo, or "not yet specified"]
**Papers reviewed:** N total; N from priority journals (★)

---

## Most Relevant 10 ★

The ten papers most directly relevant to this project, each with a one-sentence summary.

1. **[Author, Year]** — [Journal ★?]: [One sentence: what it shows and why it matters here]
2. ...

---

## Thematic Synthesis

### Theme 1: [Theme Name]

[2–4 paragraph synthesis — NOT a list of paper summaries. Integrate findings across papers into a coherent argument. Cite papers inline as (Author, Year).]

### Theme 2: [Theme Name]

[...]

### Theme 3: [Theme Name — e.g., Boundary Conditions]

[...]

### Theme 4: [Theme Name — e.g., Process Evidence]

[...]

---

## Tensions and Unresolved Debates

[Paragraph on where the literature contradicts itself — conflicting findings, failed replications, contested mechanisms. Be specific: cite both sides.]

---

## Gap Analysis

Connect the literature directly to this project:

### Gap 1: [Name of gap]
**What the literature establishes:** [...]
**What remains unanswered:** [...]
**How this project addresses it:** [...]

### Gap 2: [Name of gap]
[...]

### Gap 3: [Name of gap]
[...]

---

## New Flags for the User

[If any of the following emerged from the search, flag prominently:]

- [ ] **New mechanism candidate found:** [Name] — not in original proposal; [brief description and key paper]
- [ ] **Replication failure:** [finding from proposal/mechanism memo] has not replicated in [context]; see [paper]
- [ ] **Strong alternative explanation found:** [paper] proposes [mechanism X] for a closely related effect — this is a threat to our contribution
- [ ] **Better operationalization found:** [paper] uses [measure/manipulation] that may be superior to ours
- [ ] **Missed citation:** [paper] is highly cited in this area and should be in our manuscript

(Delete rows that do not apply.)

---

## Full Reference List

[All papers reviewed, alphabetically by first author, in APA format]

## BibTeX Entries

```bibtex
@article{...}
```
```

---

## Phase 5: Present to User

Before writing the file, give the user a brief verbal summary:
- What the search scope was and how many papers were reviewed
- The 3–4 most important papers (the ones they absolutely need to read)
- The single most important gap the literature reveals
- Any new flags (new mechanisms, replication failures, competitive threats)

Then write the file.

---

## Rules

1. **Context before search.** Never begin searching without first reading the proposal, CLAUDE.md, and the mechanism memo if it exists.
2. **Thematic, not chronological.** The synthesis should read like a literature review section of a paper, not an annotated bibliography.
3. **Cite specifically.** Every claim in the synthesis must be linked to a specific paper.
4. **Do not fabricate citations.** If you are uncertain about a paper's details, flag it for user verification rather than inventing details.
5. **Prioritize relevance over recency.** A 2005 paper that is central to the mechanism is more valuable than a 2024 paper that is tangential.
6. **Flag, do not decide.** If new constructs or mechanisms emerge that change the theoretical framing, flag them clearly — do not silently revise the project direction.
