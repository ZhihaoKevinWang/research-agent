# CLAUDE.MD -- Consumer Psychology Experimental Research with Claude Code

<!-- HOW TO USE: Replace [BRACKETED PLACEHOLDERS] with your project info.
     Customize analysis conventions and manuscript sections for your project.
     Keep this file under ~150 lines — Claude loads it every session.
     See the guide at docs/workflow-guide.html for full documentation. -->

**Project:** [YOUR PROJECT NAME]
**Institution:** [YOUR INSTITUTION]
**PI / Lead Researcher:** [YOUR NAME]
**Branch:** main

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- run analyses and confirm outputs at the end of every task
- **Preregistration optional** -- pilots and exploratory studies need no prereg; use when ready to confirm
- **Quality gates** -- nothing ships below 80/100
- **[LEARN] tags** -- when corrected, save `[LEARN:category] wrong → right` to MEMORY.md

---

## Folder Structure

```
[YOUR-PROJECT]/
├── CLAUDE.md                    # This file
├── .claude/                     # Rules, skills, agents, hooks
├── references.bib               # Shared bibliography (all studies)
├── literature/                  # PDFs and reading notes (shared)
├── manuscripts/                 # Combined paper drafts spanning studies
├── slides/                      # Conference / lab talk presentations
├── quality_reports/             # Project-level plans, session logs
├── explorations/                # Cross-study sandbox
│
├── Study 1/                     # Researcher's study folder (READ-ONLY for Claude)
│   ├── README.md                # Study name, hypotheses, status, N  [read only]
│   ├── data/                    # Raw & processed data               [read only]
│   ├── preregistrations/        # OSF/AsPredicted docs               [read only]
│   ├── experiments/             # Stimuli, surveys, materials         [read only]
│   └── RAgent works/            # Claude's workspace — all writes go here
│       ├── scripts/             # Analysis scripts (analysis.R, etc.)
│       ├── output/
│       │   ├── figures/         # Publication-ready .pdf and .png
│       │   └── tables/          # .html, .tex, .docx tables
│       └── slides/              # Presentation files
│
├── Study 2/                     # Same pattern
└── Study 3/                     # Same pattern (add as needed)
```

## Scope Convention

**Default scope is the study being worked on.** Claude **reads** anywhere within `Study N/` but **writes only inside `Study N/RAgent works/`**. Existing files outside `RAgent works/` are never modified or deleted. Cross-study access is granted only for `/initialize-project`, `/review-manuscript`, and explicitly cross-study requests.

---

## Commands

```bash
# Run analysis script
Rscript scripts/[script_name].R

# Render manuscript (R Markdown)
Rscript -e "rmarkdown::render('manuscripts/[file].Rmd')"

# Run all analyses in order
Rscript scripts/run_all.R

# Quality score
python scripts/quality_score.py manuscripts/[file].Rmd
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR / Submit | Ready for co-author review |
| 95 | Excellence | Journal-ready |

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/analyze-data [dataset]` | End-to-end R analysis with review |
| `/write-section [section]` | Draft manuscript section from results |
| `/make-slides [study]` | Generate presentation slides from study |
| `/review-manuscript [file]` | Multi-agent manuscript review |
| `/revision-plan [reviews]` | Plan response to reviewer comments |
| `/identify-mechanism` | Synthesize all study results → recommend focal mechanism |
| `/lit-review [topic]` | Context-grounded literature search + thematic synthesis |
| `/proofread [file]` | Grammar/typo/style review |
| `/review-r [file]` | R code quality review |
| `/commit [msg]` | Stage, commit, PR, merge |
| `/research-ideation [topic]` | Research questions + experiment designs |
| `/interview-me [topic]` | Interactive research development session |
| `/initialize-project` | Auto-generate project CLAUDE.md + MEMORY.md |

---

## Preregistration Status

<!-- Track which studies are preregistered and where -->

| Study | Preregistration | Status | Link |
|-------|----------------|--------|------|
| Study 1: [Name] | OSF / AsPredicted | [Draft / Locked / Collected] | [URL] |
| Study 2: [Name] | -- | [Planned] | -- |

---

## Manuscript Status

| File | Journal Target | Status | Key Variables |
|------|---------------|--------|--------------|
| `manuscripts/[paper].Rmd` | [Journal] | [Draft / Submitted / R&R] | [Brief note] |

---

## Project-Specific Analysis Conventions

<!-- Customize for your research -->

| Convention | Value | Rationale |
|-----------|-------|-----------|
| Alpha threshold | 0.05 (two-tailed) | [PLACEHOLDER] |
| Power target | 0.80 | [PLACEHOLDER] |
| Effect size reference | d = [PLACEHOLDER] | Pilot / prior work |
| Exclusion criteria | [PLACEHOLDER] | [Brief rationale] |
| Primary DV | [PLACEHOLDER] | [Scale / measure] |
