---
name: analyze-data
description: End-to-end experimental data analysis for consumer psychology. Loads data, applies exclusions, runs manipulation checks, tests hypotheses, computes effect sizes, and produces publication-ready output. Operates within a single Study N/ folder.
disable-model-invocation: true
argument-hint: "[Study N] [dataset file or analysis description]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Bash", "Task"]
---

# Experimental Data Analysis Workflow

Run a complete analysis of experimental data within a single study folder.

**Input:** `$ARGUMENTS` — study identifier and context, e.g. "Study 1" or "Study 2 — analyze purchase intentions data".

---

## Scope

**This skill operates entirely within `Study N/`.** All paths below are relative to that folder.
Read `Study N/README.md` first to understand the study design, hypotheses, and variables.

---

## Constraints

- **Default working directory:** `Study N/` (confirm with user if not specified)
- **Follow R code conventions** in `.claude/rules/r-code-conventions.md`
- **Save scripts** to `Study N/scripts/` (e.g., `analysis.R`)
- **Save all outputs** to `Study N/output/figures/`, `Study N/output/tables/`, `Study N/output/*.rds`
- **Run scripts from the study directory:** `cd "Study N" && Rscript scripts/analysis.R`
- **Run stats-reviewer** on results before presenting

---

## Workflow Phases

### Phase 0: Orient to the Study

1. **Check for existing scripts first:**
   ```
   Glob("Study N/scripts/**/*.R")
   ```
   If any `.R` files exist, read them all before doing anything else. Build on what's there — extend, fix, or add sections rather than rewriting. Preserve the user's variable names, structure, and style.

2. Read `Study N/README.md` — hypotheses, design, key variables
3. Check `Study N/preregistrations/` — if a prereg exists, read it; otherwise proceed freely
4. Confirm data file location: `Study N/data/processed/[file].csv`

### Phase 1: Setup & Data Loading

1. Read `.claude/rules/r-code-conventions.md`
2. Create/update `Study N/scripts/analysis.R` with proper header
3. Load packages at top via `library()`
4. Set seed: `set.seed(YYYYMMDD)` — use data-collection date if known
5. Load data: `read_csv("data/processed/[file].csv")` (path relative to study root)
6. Inspect: `dim()`, `summary()`, `colnames()`, missingness rates

### Phase 2: Exclusions

Apply criteria documented in `Study N/data/codebook.md` or the preregistration:
- Failed attention checks
- Failed comprehension checks
- Incomplete surveys
- Any pre-defined outlier rule

Document N excluded per criterion. Save counts to `output/exclusions.rds`.

### Phase 3: Manipulation Checks

Run before ANY DV analysis:
- Test IV condition on manipulation check items
- Report F/t, df, p, effect size (d or η²), 95% CI

### Phase 4: Hypothesis Tests

```r
# ============================================================
# CONFIRMATORY — H1: [hypothesis text from README]
# ============================================================
```

Report for each test: test statistic, df, exact p, effect size, 95% CI, N per cell.

```r
# ============================================================
# EXPLORATORY — not pre-registered
# ============================================================
```

### Phase 5: Publication-Ready Output

**Figures:** ggplot2 with `theme_project()`, bar plots with 95% CI error bars.
```r
ggsave("output/figures/fig1_means.pdf", width = 6.5, height = 4, dpi = 300)
```

**Tables:** `modelsummary` or `gt`; export `.html` + `.docx`.

### Phase 6: Save & Review

1. `saveRDS()` for all key objects into `output/`
2. Run stats-reviewer:
   ```
   Delegate to stats-reviewer: "Review Study N/scripts/analysis.R"
   ```
3. Address Critical and High issues before presenting results

---

## Script Header Template

```r
# ============================================================
# Study N: [Study Name]
# Author: [from CLAUDE.md]
# Purpose: [Brief description]
# Preregistration: preregistrations/[file].md (if any)
# Inputs:  data/processed/[study]_clean.csv
# Outputs: output/figures/*, output/tables/*, output/*.rds
# ============================================================
# Run from: Study N/ directory
# ============================================================
```

## Section Structure

```r
# 0. Setup ----
# 1. Load Data ----
# 2. Exclusions ----
# 3. Scale Construction ----
# 4. Manipulation Check ----
# === CONFIRMATORY ANALYSES ===
# 5. H1: [text] ----
# === EXPLORATORY ANALYSES ===
# 6. [Description] ----
# 7. Figures & Tables ----
# 8. Export ----
```
