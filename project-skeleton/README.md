# [PROJECT NAME] — Consumer Psychology Experimental Research

**PI:** [YOUR NAME]
**Institution:** [YOUR INSTITUTION]
**Project started:** [YYYY-MM-DD]
**Status:** [Active / Data Collection / Writing / Under Review]

---

## Quick Start

1. Copy this folder to your project location
2. Add your proposal document (PDF or Markdown) to the root or `references/`
3. Run `/initialize-project` — it reads the proposal and scaffolds `Study 1/`, `Study 2/`, etc. with real names
4. Work within a single `Study N/` folder for all routine tasks

## Folder Map

```
[PROJECT]/
├── README.md
├── references.bib               ← shared bibliography (all studies)
├── literature/                  ← PDFs and reading notes (shared)
├── manuscripts/                 ← cross-study paper drafts (.Rmd / .docx)
├── slides/                      ← conference / lab talk presentations
├── quality_reports/             ← project-level plans, session logs, merge reports
│   ├── plans/
│   ├── session_logs/
│   └── merges/
├── explorations/                ← shared sandbox for cross-study pilot work
│
├── Study 1/                     ← self-contained study unit
│   ├── README.md                ← study name, hypotheses, status, N target
│   ├── preregistrations/        ← optional: OSF/AsPredicted docs
│   ├── experiments/
│   │   ├── stimuli/             ← images, vignettes, ads, products
│   │   ├── qualtrics/           ← .qsf survey exports
│   │   └── materials/           ← consent forms, debrief scripts
│   ├── data/
│   │   ├── raw/                 ← PROTECTED — Qualtrics exports, never modified
│   │   ├── processed/           ← cleaned analysis-ready data
│   │   └── codebook.md          ← variable dictionary
│   ├── scripts/
│   │   └── analysis.R           ← main analysis script
│   ├── output/
│   │   ├── figures/             ← publication-ready .pdf and .png
│   │   └── tables/              ← .html, .tex, .docx tables
│   └── quality_reports/         ← study-level review reports
│
├── Study 2/                     ← identical structure
└── Study 3/                     ← identical structure
```

## Scope Convention

Claude's **default scope is the study you're currently working on**.
- `/analyze-data`, `/write-section`, `/review-r` → operate inside `Study N/`
- `/initialize-project`, `/review-manuscript`, cross-study comparisons → project-wide

## Key Rules

- `Study N/data/raw/` is read-only — NEVER modify raw data
- All routine analysis files go inside `Study N/` — not at the project root
- Use `manuscripts/` for the combined paper draft that spans studies
- Run `/initialize-project` once to scaffold real study folders from your proposal
