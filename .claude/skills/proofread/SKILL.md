---
name: proofread
description: Run the proofreading protocol on manuscript files. Checks grammar, APA style, typos, argument flow, and consistency. Produces a report without editing files.
argument-hint: "[filename or 'all']"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task"]
---

# Proofread Manuscript Files

Run the mandatory proofreading protocol on academic manuscripts. Produces a report of all issues found WITHOUT editing any source files.

## Steps

1. **Identify files to review:**
   - If `$ARGUMENTS` is a specific filename: review that file only
   - If `$ARGUMENTS` is "all": review all files in `manuscripts/` and `supplements/`

2. **For each file, launch the writing-reviewer agent** that checks for:

   **GRAMMAR:** Subject-verb agreement, tense, article usage, dangling modifiers
   **TYPOS:** Misspellings, number formatting, duplicated words
   **APA STYLE:** Citation format, statistical reporting (t, p, d, CI), heading levels
   **STRUCTURE:** Hypothesis-test mapping, manipulation check position, exploratory labeling
   **CONSISTENCY:** Terminology, construct names, abbreviations, study labels
   **JCR STANDARDS:** Abstract length, no contractions, hedging language, contribution clarity

3. **Produce a detailed report** for each file listing every finding with:
   - Location (section name or line number)
   - Current text (what's wrong)
   - Proposed fix (what it should be)
   - Category and severity

4. **Save each report** to `quality_reports/`:
   - `quality_reports/[FILENAME_WITHOUT_EXT]_writing_review.md`

5. **IMPORTANT: Do NOT edit any source files.**
   Only produce the report. Fixes are applied separately after user review.

6. **Present summary** to the user:
   - Total issues found per file
   - Breakdown by category
   - Most critical issues highlighted
