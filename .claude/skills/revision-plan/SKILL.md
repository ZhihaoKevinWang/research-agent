---
name: revision-plan
description: Create a structured response plan for manuscript reviewer comments. Maps each reviewer concern to a specific action, prioritizes changes, and drafts the response letter outline. Use when you receive an R&R decision.
argument-hint: "[reviewer comments file or paste]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Task"]
---

# Revision Plan from Reviewer Comments

Create a structured, prioritized plan for responding to peer reviewer comments and revising the manuscript.

**Input:** `$ARGUMENTS` — path to a file containing reviewer comments, or paste directly.

---

## Steps

### Step 1: Parse Reviewer Comments

1. Read the decision letter and each reviewer's comments
2. Categorize every distinct concern:
   - **Reviewer number** (R1, R2, AE)
   - **Type:** Theoretical / Empirical (requires new data) / Statistical / Writing / Clarification
   - **Urgency:** Critical (likely rejection without addressing) / High / Medium / Low

### Step 2: Assess Feasibility

For each concern, determine:
- **Can address with existing data?** → Revision task
- **Requires new data collection?** → New study task
- **Is a misunderstanding?** → Response-letter clarification task
- **Is the reviewer wrong?** → Polite pushback task

### Step 3: Generate Revision Plan

```markdown
# Revision Plan: [Manuscript Title]
**Decision:** [Major Revision / Minor Revision / R&R]
**Target journal:** [Journal]
**Revision deadline:** [YYYY-MM-DD if known]
**Date:** [YYYY-MM-DD]

## Summary
- Total distinct concerns: N
- Requires new data: N concerns
- Addressable with existing data: N concerns
- Response-letter clarifications only: N concerns
- Pushback warranted: N concerns

## Priority Action List

### CRITICAL — Address before all else
| # | Reviewer | Concern | Action | Feasibility |
|---|----------|---------|--------|-------------|
| 1 | R1 | [concern] | [action] | [existing data / new study / clarification] |

### HIGH — Will likely determine accept/reject
[Same table]

### MEDIUM — Strengthens revision
[Same table]

### LOW — Polish
[Same table]

## Response Letter Outline

### Response to Associate Editor
[Paragraph acknowledging key themes]

### Response to Reviewer 1

**Comment 1.1:** [Reviewer's exact words or paraphrase]
**Our response:** [Draft response text]
**Changes made:** [What was changed in the manuscript]

[Repeat for each comment]

### Response to Reviewer 2
[Same structure]

## New Studies Required
[If any new data collection is needed:]
| Study | Purpose | Design | N | Timeline |
|-------|---------|--------|---|----------|

## Manuscript Revision Checklist
- [ ] All Critical concerns addressed
- [ ] All High concerns addressed or explicitly responded to
- [ ] Response letter drafted
- [ ] Changes marked in manuscript (track changes or highlight)
- [ ] Preregistration updated if new studies added
- [ ] New studies preregistered before data collection
```

### Step 4: Save Plan

Save to `quality_reports/revisions/[manuscript]_revision_plan_YYYY-MM-DD.md`

---

## Important

- **Never make changes that compromise pre-registered confirmatory analyses** — new analyses in response to reviewers are exploratory by definition
- **Be honest in the response letter** — don't claim you made a change if you didn't
- **Pushback is legitimate** — politely but clearly disagree with reviewers when warranted with evidence
- **Preregister new studies** — any new data collection in response to reviewers must be preregistered
