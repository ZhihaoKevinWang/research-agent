---
name: review-manuscript
description: Multi-agent manuscript review simulating journal review. Runs writing-reviewer, theory-reviewer, stats-reviewer, and preregistration-auditor in sequence. Produces a unified report with prioritized recommendations. Use before submission.
argument-hint: "[manuscript file path]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task"]
---

# Multi-Agent Manuscript Review

Run a comprehensive pre-submission review of a consumer psychology manuscript using multiple specialized agents.

**Input:** `$ARGUMENTS` — path to manuscript file (e.g., `manuscripts/paper1.Rmd`)

---

## Review Pipeline

### Step 1: Identify Files

Find all related files:
- Manuscript: `$ARGUMENTS`
- Analysis scripts: `scripts/*.R` related to this manuscript
- Preregistration: `preregistrations/*_LOCKED.md` for each study
- Outputs: `output/` figures and tables referenced in manuscript

### Step 2: Launch Review Agents (in parallel)

Delegate to four agents simultaneously:

```
1. writing-reviewer: "Review [manuscript file] for grammar, APA style, JCR standards"
2. theory-reviewer: "Review [manuscript file] for theoretical contribution and hypothesis derivation"
3. stats-reviewer: "Review [analysis script] and Results section of [manuscript file]"
4. preregistration-auditor (only if preregistrations/ folder contains a relevant file): "Audit alignment between [prereg files] and [analysis scripts] and [manuscript]"
```

If no preregistration exists, skip step 4.

### Step 3: Synthesize Reports

Read all four reports from `quality_reports/` and produce a unified priority list:

```markdown
# Unified Manuscript Review: [Filename]
**Date:** [YYYY-MM-DD]

## Overall Assessment
[1-paragraph summary of the manuscript's strengths and weaknesses]

## Critical Issues (Must fix before submission)
1. [Issue from any agent] — [Source agent]
2. ...

## High Priority (Reviewer will likely raise)
1. ...

## Medium Priority (Strengthen the paper)
1. ...

## Low Priority (Polish)
1. ...

## Estimated Quality Score: [X/100]
- Writing quality: X/100
- Theoretical rigor: X/100
- Statistical rigor: X/100
- Preregistration alignment: X/100

## Recommended next step: [REVISE / SUBMIT / COLLECT MORE DATA]
```

### Step 4: Save Unified Report

Save to `quality_reports/[FILENAME_WITHOUT_EXT]_full_review.md`

---

## Important

- Do NOT edit the manuscript during review
- All four agent reports must be completed before synthesis
- If preregistration auditor finds Critical issues, flag them first regardless of other scores
- Quality score < 80: block submission recommendation
- Quality score 80–89: submit with caution, address high-priority issues first
- Quality score ≥ 90: ready for submission
