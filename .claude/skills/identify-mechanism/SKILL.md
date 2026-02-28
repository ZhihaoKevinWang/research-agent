---
name: identify-mechanism
description: Synthesizes all completed study results across the project to identify the most theoretically promising psychological mechanism. Project-wide access. Writes a structured memo to memos/mechanism-[date].md.
argument-hint: "[optional: focus area or constraint, e.g. 'focus on affective mechanisms']"
allowed-tools: ["Read", "Grep", "Glob", "Write", "WebSearch", "WebFetch"]
---

# Identify Mechanism

Synthesize all available project results to identify the single most theoretically promising psychological mechanism, and specify what a follow-up study would need to show.

**This skill has project-wide read access.** It deliberately crosses study boundaries — that is the point.

---

## Phase 1: Gather All Evidence

### 1a: Read the proposal

Find and read the project proposal (PDF or Markdown in the project root or `references/`). Extract:
- Original theoretical framing and proposed mechanism
- Key constructs (IVs, DVs, mediators, moderators)
- Any mechanism hypotheses stated in the proposal

### 1b: Read CLAUDE.md and MEMORY.md

Extract the current project state: study names, status, key variables, theoretical framework.

### 1c: Read all completed study results

```
Glob("Study */output/*.rds")       → load and summarize key result objects
Glob("Study */quality_reports/*")  → any review reports or stats summaries
Glob("Study */README.md")          → study purpose and hypotheses
Glob("manuscripts/**")             → any drafted sections with reported results
Glob("memos/**")                   → any prior mechanism memos
```

For each completed study, extract and record:

| Study | H tested | Direction | Effect size | p | Significant? | Unexpected pattern |
|-------|----------|-----------|-------------|---|--------------|-------------------|
| Study 1 | H1: ... | [higher/lower] | d = X | .XXX | Yes/No | [note] |

Also record:
- **Null results** — what did NOT work and under what conditions
- **Moderation patterns** — what strengthened or weakened the effect
- **Unexpected findings** — anything that surprised, including exploratory results
- **Inconsistencies** — places where Study 1 and Study 2 diverge

---

## Phase 2: Map Findings onto Candidate Mechanisms

Consider mechanisms at four levels. For each level, generate 1–3 candidate mechanisms that could plausibly explain the pattern of results — including the nulls and moderations.

### Cognitive mechanisms
*How does the effect work through what people think, infer, or remember?*
- Attention allocation (salience, fluency)
- Inference and construal (what meaning people assign to the stimulus)
- Memory retrieval (what prior knowledge is activated)
- Mental simulation (imagining outcomes)

### Affective mechanisms
*How does the effect work through feelings?*
- Discrete emotions (fear, pride, disgust, awe — specify which)
- Mood and valence (positive vs. negative affect)
- Emotion regulation strategies (suppression, reappraisal)
- Anticipated emotion (how people expect to feel)

### Motivational mechanisms
*How does the effect work through goals, drives, or self-concept?*
- Goal pursuit (which goal is activated/salient)
- Identity and self-concept (threat, affirmation, expression)
- Approach vs. avoidance orientation
- Regulatory focus (promotion vs. prevention)

### Social mechanisms
*How does the effect work through social context?*
- Norm inference (what others do or expect)
- Signaling (managing impressions)
- Social comparison (upward vs. downward)
- Conformity and social proof

For each candidate mechanism, write a 2–3 sentence account: "If [mechanism] is driving the effect, then we would expect to see [pattern]. This is consistent with [findings from studies] and would explain [null/moderation] because [reason]."

---

## Phase 3: Evaluate Candidate Mechanisms

Score each candidate mechanism on three criteria. Be explicit — cite specific findings as evidence.

### Criterion 1: Consistency
*Does this mechanism explain ALL key findings — including nulls and moderations?*
- Full consistency (explains everything): **3 points**
- Partial consistency (explains most, struggles with 1–2 findings): **2 points**
- Inconsistent (cannot explain a key null or moderation): **1 point**

### Criterion 2: Parsimony
*Is this the simplest account, or does it require auxiliary assumptions?*
- Parsimonious (mechanism alone predicts the full pattern): **3 points**
- Moderate (needs 1 auxiliary assumption to work): **2 points**
- Complex (requires multiple assumptions or is post-hoc): **1 point**

### Criterion 3: Theoretical Grounding
*Is this mechanism well-supported in consumer psychology and adjacent literatures?*
- Strong (multiple published papers directly support this mechanism in similar contexts): **3 points**
- Moderate (some support; mechanism is plausible but not well-tested in this domain): **2 points**
- Weak (speculative; little published support): **1 point**

Produce a ranked table:

| Mechanism | Level | Consistency | Parsimony | Grounding | Total | Notes |
|-----------|-------|-------------|-----------|-----------|-------|-------|
| [Mechanism A] | Cognitive | 3 | 2 | 3 | 8 | Explains null in Study 2 via... |
| [Mechanism B] | Affective | 2 | 3 | 2 | 7 | Struggles to explain moderation... |

---

## Phase 4: Recommendation

### Primary recommendation

State clearly:

> **Recommended mechanism:** [Name]
> **Why:** [2-3 sentences — what pattern of evidence points here, why alternatives fall short]
> **Confidence:** [High / Moderate / Low] — and why

### Unique predictions

Identify 2–3 things the recommended mechanism predicts that the top alternative does NOT:

| Prediction | Recommended mechanism predicts | Alternative predicts | How to test |
|-----------|-------------------------------|---------------------|-------------|
| [Moderator X] | strengthens the effect | no effect | 2-condition design with X high vs. low |
| [Mediator Y] | mediates the effect | does not mediate | measure Y; bootstrap indirect effect |

These unique predictions are the natural design for the next study. State this explicitly.

### Flags for the user

If any of these apply, flag them prominently before writing the memo:
- The evidence is too mixed to make a confident recommendation (Confidence: Low) — suggest what data is missing
- The recommended mechanism was NOT in the original proposal — this is a meaningful update to the theoretical framing
- The null results are not explained by any candidate — they may indicate a boundary condition that should be theorized

---

## Phase 5: Write the Memo

Write to `memos/mechanism-YYYY-MM-DD.md` (use today's date):

```markdown
# Mechanism Identification Memo
**Date:** YYYY-MM-DD
**Studies synthesized:** Study 1 [status], Study 2 [status], ...
**Focus constraint:** [from $ARGUMENTS, or "none"]

---

## 1. Findings Summary

### Effect pattern across studies
[Table from Phase 1]

### Key nulls and moderations
[Bulleted list]

### Unexpected patterns
[Bulleted list]

---

## 2. Candidate Mechanisms Considered

### [Mechanism A] (Cognitive)
[2–3 sentence account with citations to findings]

### [Mechanism B] (Affective)
[...]

[Continue for all candidates]

---

## 3. Evaluation

[Scoring table from Phase 3]

---

## 4. Recommendation

**Recommended mechanism:** [Name]

[Reasoning paragraph]

### Unique predictions vs. top alternative

[Table from Phase 4]

### Confidence: [High / Moderate / Low]
[Justification]

---

## 5. Suggested Next Steps

### If confidence is High:
- Conduct a process study to directly measure [mediator]
- Design: [brief description of the follow-up study]

### If confidence is Moderate or Low:
- [What additional evidence is needed before committing to this mechanism]

### Flags
[Any issues from Phase 4 flags]

---

## 6. Mechanisms NOT Recommended (and why)

[Brief paragraph on why each rejected mechanism was ruled out — useful for the manuscript's alternative-explanation section]
```

---

## Phase 6: Present to User

Before writing the file, give the user a brief verbal summary (5–8 sentences):
- What the evidence pattern looks like
- What mechanism you're recommending and why
- What the top alternative was and why it falls short
- What a follow-up study would need to show
- Your confidence level

Only then write the memo file.

---

## Rules

1. **Project-wide access is intentional.** Read across all Study N/ folders — that is the whole point of this skill.
2. **Nulls are evidence too.** A mechanism that cannot explain a null result should be penalized in the consistency score.
3. **Do not recommend what the proposal assumed.** If the data points elsewhere, say so clearly. The researcher needs to know.
4. **Never fabricate results.** Only cite findings from files you actually read. If an RDS file could not be loaded, note that.
5. **Confidence must be calibrated.** Low confidence is an honest and useful output — do not inflate confidence to give a cleaner recommendation.
