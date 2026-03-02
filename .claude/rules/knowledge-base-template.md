---
paths:
  - "Study */RAgent works/**/*.R"
  - "Beamer/**/*.tex"
---

# Project Knowledge Base: [YOUR PROJECT NAME]

<!-- Fill in the tables below with YOUR project-specific content.
     Claude reads this automatically before creating or modifying
     R scripts and Beamer slides within this project. -->

---

## Construct Registry

Key constructs used across all studies. Ensures consistent naming and operationalization.

| Construct | Role | Operationalization | Scale | α (if known) |
|-----------|------|--------------------|-------|-------------|
| [IV name] | Focal IV | [Manipulation / measure description] | [1–7 / between-subjects] | — |
| [DV name] | Focal DV | [Item examples] | [1–7] | [.XX] |
| [Mediator] | Mediator | [Item examples] | [1–7] | [.XX] |
| [Moderator] | Moderator | [Description] | [1–7 / continuous] | — |

---

## Study Progression

| # | Study Name | Design | N target | Status | Key IV | Key DV |
|---|-----------|--------|----------|--------|--------|--------|
| 1 | [Name] | [between / within, N conditions] | [N] | [Planning / Collected / Analyzed] | [IV] | [DV] |
| 2 | [Name] | | | | | |

---

## Analysis Conventions

Project-wide defaults. Override per-study in `Study N/RAgent works/README.md`.

| Convention | Value | Rationale |
|-----------|-------|-----------|
| Alpha threshold | 0.05 (two-tailed) | Standard in JCR/JMR |
| Power target | 0.80 | Conventional minimum |
| Effect size reference | d = [X] | [Source: pilot / prior work] |
| Seed convention | `set.seed(YYYYMMDD)` | Data-collection date |
| Mediation | PROCESS macro (Model 4) | Hayes 2018 |
| Path convention | `here::here()` or relative from `RAgent works/` | |

---

## R Packages (Standard Stack)

```r
library(tidyverse)   # data wrangling + ggplot2
library(rstatix)     # pipe-friendly ANOVA, t-tests
library(effectsize)  # Cohen's d, eta-squared
library(emmeans)     # contrasts and marginal means
library(mediation)   # or use PROCESS via source()
library(gt)          # tables
library(here)        # robust paths
```

---

## Figure Standards

| Property | Value |
|----------|-------|
| Theme | `theme_minimal()` + project customizations |
| Color palette | [PLACEHOLDER — fill from Beamer/beamercolorthemeaggie.sty] |
| DPI | 300 |
| Format | PDF (print) + PNG (supplementary) |
| Error bars | 95% CI (not SE) |
| Width | 6.5 in (single column) |

---

## R Code Anti-Patterns

| Anti-Pattern | Problem | Correct Approach |
|-------------|---------|-----------------|
| `set.seed()` inside a loop | Non-reproducible | Set once at top of script |
| `p < .05` binary reporting | Loses information | Report exact p, effect size, CI |
| `mean()` on Likert without α | Assumes unidimensionality | Report α, consider composite |
| Hard-coded absolute paths | Breaks on other machines | Use `here::here()` or relative paths |
| Unnamed ANOVA contrasts | Uninterpretable output | Label all contrasts explicitly |

---

<!-- Add project-specific sections as needed:
     - Exclusion criteria and rationale
     - Known data quirks (e.g., specific Qualtrics variable names)
     - Planned robustness checks
-->
