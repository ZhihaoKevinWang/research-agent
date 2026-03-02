---
name: review-paper
description: Critical evaluation of an external paper from the consumer psychology literature. Assesses theoretical contribution, experimental design, and relevance to your research. Use when reading papers for a literature review or to evaluate a competitor's findings.
disable-model-invocation: true
argument-hint: "[path to .pdf or paper title in literature/]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task"]
---

# External Paper Evaluation

Produce a critical, structured evaluation of an external paper — the kind of notes a careful reader would write before citing, extending, or contrasting this work.

**Input:** `$ARGUMENTS` — path to a PDF, or a filename in `literature/`.

**Distinct from `/review-manuscript`**, which reviews YOUR OWN manuscript before submission. This skill evaluates OTHERS' papers to inform your own research.

---

## Steps

1. **Locate and read the paper.** Check:
   - Direct path from `$ARGUMENTS`
   - `literature/$ARGUMENTS`
   - Glob for partial matches

2. **Read end-to-end.** For long PDFs, read in chunks (5 pages at a time).

3. **Evaluate across 6 dimensions** (see below).

4. **Generate 3-5 "replication / extension threats"** — the key questions raised by this paper for your own research.

5. **Produce the evaluation report.**

6. **Save to** `literature/notes_[sanitized_name].md`

---

## Evaluation Dimensions

### 1. Theoretical Contribution
- What psychological mechanism is proposed?
- Is the theory novel, incremental, or a replication?
- Are the constructs clearly defined and well-grounded?
- Is the contribution clearly differentiated from prior work?
- Would a JCR/JMR referee find this theoretically interesting?

### 2. Experimental Design
- Is the manipulation valid? Are there demand effects or confounds?
- Is the sample appropriate (MTurk, student, representative)?
- Are the measures reliable (α reported)? Any ceiling/floor effects?
- Is statistical power adequate (N per cell, effect size)?
- Are manipulation checks reported and interpreted correctly?

### 3. Statistical Rigor
- Correct tests for the design (ANOVA, regression, PROCESS)?
- Effect sizes and confidence intervals reported?
- Multiple testing concerns (exploratory vs. confirmatory labeled)?
- Are mediators tested properly (bootstrapped indirect effects)?
- Any p-hacking red flags (just-significant p-values, selective reporting)?

### 4. Literature Positioning
- Which prior papers does this extend or challenge?
- Are the key citations in this space present?
- Does it misrepresent any prior work?
- What gap does it claim to fill — is that gap real?

### 5. Writing and Clarity
- Is the research question stated early and clearly?
- Does the theory section lead logically to testable hypotheses?
- Are the results reported completely (all conditions, DVs)?
- Are limitations acknowledged honestly?

### 6. Relevance to Your Research
- Does this paper support, challenge, or complicate your hypotheses?
- Are there constructs or manipulations you could adapt?
- Does it suggest a gap you could fill?
- Should this be cited prominently, briefly, or not at all?

---

## Output Format

```markdown
# Paper Evaluation: [Title]

**Authors:** [Author list]
**Journal / Year:** [Outlet, Year]
**Date reviewed:** [YYYY-MM-DD]
**File:** [path]

## One-Line Summary

[The main finding in plain language, 1 sentence]

## Overall Assessment

**Quality:** [High / Medium / Low]
**Relevance to your project:** [High / Medium / Low]
**Cite as:** [Core citation / Supporting citation / Contrast / Skip]

[2-3 paragraph summary: contribution, key findings, and how it relates to your work]

## Strengths

1. [Strength 1]
2. [Strength 2]

## Concerns

### C1: [Title]
- **Dimension:** [Theory / Design / Stats / Literature / Clarity / Relevance]
- **Issue:** [Specific description]
- **Implication for your research:** [How this affects whether/how you cite it]

[Repeat]

## Extension / Replication Threats

Questions this paper raises for YOUR research:

### T1: [Question]
**Why it matters:** [Potential challenge to your argument or design]
**How to address it:** [Preempt in theory, add a study, cite and acknowledge]

[Repeat for 3-5 threats]

## Key Quotes to Save

- [Quote or paraphrase worth citing directly]
- [Operationalization worth adapting]

## Summary Ratings

| Dimension | Rating (1–5) |
|-----------|-------------|
| Theoretical Contribution | [N] |
| Experimental Design | [N] |
| Statistical Rigor | [N] |
| Literature Positioning | [N] |
| Writing and Clarity | [N] |
| Relevance to Your Research | [N] |
| **Overall** | **[N]** |
```

---

## Principles

- **Be constructive but honest.** A mediocre paper still has usable pieces.
- **Focus on relevance.** The ultimate question is: how does this change YOUR research?
- **Be specific.** Reference exact studies, effect sizes, scale items.
- **Do NOT fabricate details.** If you can't read a section clearly, say so.
