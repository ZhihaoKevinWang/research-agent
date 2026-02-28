---
paths:
  - "**/*.R"
  - "scripts/**/*.R"
  - "explorations/**/*.R"
---

# R Code Standards — Consumer Psychology Experimental Research

**Standard:** Senior Principal Data Engineer + experimental psychologist quality

---

## 0. Existing Code First (Always)

**Before writing any new R code, check whether relevant scripts already exist in the current study folder.**

```
Glob("Study N/scripts/**/*.R")
Glob("Study N/**/*.R")
```

If existing scripts are found:
- **Read them fully** before doing anything else
- **Extend or modify** the existing script rather than creating a new one
- **Preserve the user's structure, variable names, and coding style** — do not refactor unless explicitly asked
- Only create a new script if the task is genuinely distinct from anything in the existing files (e.g., a separate `slides_figures.R` when `analysis.R` already exists)

When modifying an existing script, note at the top of your response what you found and how you're building on it.

---

## 1. Reproducibility

- `set.seed()` called ONCE at top (YYYYMMDD format, matching data-collection date when relevant)
- All packages loaded at top via `library()` (not `require()`)
- All paths relative to repository root
- `dir.create(..., recursive = TRUE)` for output directories
- `renv::snapshot()` used for package-version locking before sharing

## 2. Function Design

- `snake_case` naming, verb-noun pattern (e.g., `compute_effect_size`, `run_manipulation_check`)
- Roxygen-style documentation
- Default parameters, no magic numbers
- Named return values (lists or tibbles)

## 3. Domain Correctness — Experimental Psychology

- **Exclusions:** Apply pre-registered exclusion criteria BEFORE any analysis; document N excluded and reasons
- **Manipulation checks:** Always run and report before the main DV analysis
- **Effect sizes:** Report Cohen's d (t-tests), η²/ω² (ANOVA), r (correlations) alongside p-values
- **Multiple comparisons:** Apply corrections (Bonferroni / FDR) when running multiple tests on same data
- **Planned vs. exploratory:** Clearly label analyses as CONFIRMATORY (pre-registered) or EXPLORATORY
- **Mediation / moderation:** Use `mediation` or `lavaan` for SEM; bootstrap CIs (n ≥ 5000) for indirect effects
- **Scale construction:** Report Cronbach's α; use `psych::alpha()` not base-R workarounds
- **Between vs. within:** Verify that the correct error term is used for F-tests in mixed designs

## 4. Visual Identity

```r
# --- Project palette (customize for your institution) ---
primary_color  <- "#[PLACEHOLDER]"
accent_color   <- "#[PLACEHOLDER]"
positive_green <- "#15803d"
negative_red   <- "#b91c1c"
neutral_gray   <- "#525252"
```

### Custom Theme
```r
theme_project <- function(base_size = 14) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title = element_text(face = "bold", color = primary_color),
      legend.position = "bottom",
      panel.grid.minor = element_blank()
    )
}
```

### Figure Dimensions
```r
# For manuscripts (APA style)
ggsave(filepath, width = 6.5, height = 4, dpi = 300)
# For presentations
ggsave(filepath, width = 10, height = 6, dpi = 150)
```

## 5. RDS Data Pattern

**Heavy computations saved as RDS; manuscript rendering loads pre-computed data.**

```r
saveRDS(result, file.path(out_dir, "descriptive_name.rds"))
```

## 6. Common Pitfalls

| Pitfall | Impact | Prevention |
|---------|--------|------------|
| Exclusions applied after peeking at DVs | Inflated effects | Apply exclusions blind, log in preregistration |
| `t.test()` with unequal variances default | Wrong SE | Always `var.equal = FALSE` unless theory says otherwise |
| `lm()` for binary DV | Wrong SEs | Use `glm(..., family = binomial)` |
| Pairwise tests without correction | Type I error inflation | Use `p.adjust()` |
| Forgetting to center predictors in interactions | Uninterpretable main effects | Center continuous moderators |
| `alpha()` without reverse-scoring | Artificially low α | Check item keying before scale construction |
| Hardcoded paths | Breaks on other machines | Use relative paths |

## 7. Line Length & Mathematical Exceptions

**Standard:** Keep lines <= 100 characters.

**Exception:** Lines implementing formula from paper may exceed 100 chars **if and only if:**
1. Breaking the line would harm readability of the formula
2. An inline comment links to the paper/equation number

## 8. Code Quality Checklist

```
[ ] Packages at top via library()
[ ] set.seed() once at top (YYYYMMDD)
[ ] All paths relative
[ ] Functions documented (Roxygen)
[ ] Exclusions applied pre-registered and documented
[ ] Manipulation checks run and reported
[ ] Effect sizes computed alongside p-values
[ ] Confirmatory vs. exploratory analyses labeled
[ ] RDS: every computed object saved
[ ] Comments explain WHY not WHAT
```
