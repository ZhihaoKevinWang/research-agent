---
name: write-section
description: Draft a manuscript section (Introduction, Theory, Methods, Results, Discussion) from analysis outputs, preregistration, and literature notes. Produces APA-formatted text following JCR standards.
argument-hint: "[section name] [study or paper identifier]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Task"]
---

# Write Manuscript Section

Draft a specified section of an academic manuscript in consumer psychology, following APA 7th edition and JCR standards.

**Input:** `$ARGUMENTS` — section to write and context (e.g., "Introduction for Study 1" or "Results section for study2_analysis.R").

---

## Preparation Steps

1. **Read CLAUDE.md** — get project context, study names, DV/IV labels
2. **Read `.claude/rules/jcr-writing-standards.md`** — get formatting and style rules
3. **Read relevant preregistration** (`preregistrations/*_LOCKED.md`) for hypothesis text
4. **Read analysis outputs** from `output/` and `quality_reports/` as needed
5. **Read existing manuscript** sections for consistency in terminology and style

---

## Section-Specific Instructions

### Introduction
- Hook → gap → contribution → roadmap
- ≤ 2 pages (flag if going longer)
- Each paragraph should advance the argument
- End with explicit contribution statement: "This research contributes to X by Y"
- Preview studies in final paragraph

### Theoretical Background / Literature Review
- Organize by construct, not by paper
- Each section ends with a formal hypothesis:
  ```
  H1: [Participants in Condition A] will [show higher/lower DV] than [Condition B].
  ```
- Hypotheses must be derivable from the preceding theory, not just intuitively stated

### Method
Follow APA structure:
- **Participants:** N, recruitment source, M_age (SD), % female, compensation
- **Design:** "[N]-condition between-subjects / [N]×[M] mixed factorial design"
- **Procedure:** numbered steps of study flow
- **Measures:** each construct with item example, scale (1–7), and reliability (α = .XX)
- Power analysis: "We targeted N = X based on a power analysis (1-β = .80, α = .05, d = X)"

### Results
Structure:
1. Manipulation check (before DVs)
2. Confirmatory tests (numbered H1, H2, ...)
3. Exploratory analyses (labeled "exploratory")

For each test include: F(df₁, df₂) = X.XX, p = .XXX, d/η²/ω² = X.XX, 95% CI [X.XX, X.XX]

### Discussion (Study-level)
1–2 paragraphs:
- Restate key finding
- Link back to hypothesis and theory
- Bridge to next study (if applicable)

### General Discussion
Structure:
1. Summary of findings (1 paragraph)
2. Theoretical contributions (1–2 paragraphs)
3. Managerial implications (1 paragraph)
4. Limitations and future directions (1 paragraph)

---

## Output

1. Write the section draft to `manuscripts/[paper]_[section]_draft.md` or directly into the manuscript file if it exists
2. Note any assumptions made (e.g., assumed effect direction, filled in placeholder N)
3. Flag any places where actual data or citations are needed (mark with `[TODO: ...]`)
4. Run writing-reviewer on the draft:
   ```
   Delegate to writing-reviewer agent: "Review the draft at manuscripts/..."
   ```
