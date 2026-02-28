---
paths:
  - "scripts/**/*.R"
  - "manuscripts/**"
  - "preregistrations/**"
---

# Quality Gates & Scoring Rubrics

## Thresholds

- **80/100 = Commit** -- good enough to save
- **90/100 = Co-author review / submission** -- ready for external eyes
- **95/100 = Excellence** -- journal-ready

## R Scripts (.R)

| Severity | Issue | Deduction |
|----------|-------|-----------|
| Critical | Syntax errors | -100 |
| Critical | Exclusions not applied per preregistration | -30 |
| Minor | Confirmatory/exploratory not labeled (recommended) | -3 |
| Critical | Hardcoded absolute paths | -20 |
| Major | Missing set.seed() | -10 |
| Major | Effect sizes not reported | -10 |
| Major | Missing manipulation check | -10 |
| Major | Wrong test for design (e.g., lm for binary DV) | -15 |
| Minor | Missing RDS save for key objects | -5 |
| Minor | Long lines without math justification | -1 per line |

## Manuscripts (.Rmd / .tex / .docx)

| Severity | Issue | Deduction |
|----------|-------|-----------|
| Critical | Render/compile failure | -100 |
| Critical | Exploratory finding presented as confirmatory | -40 |
| Critical | Broken citation | -15 |
| Critical | N does not match preregistration (undocumented) | -20 |
| Major | Missing effect size for any test | -10 |
| Major | Missing 95% CI for any estimate | -5 |
| Major | Hypothesis not stated formally | -5 |
| Major | Manipulation check not reported | -10 |
| Minor | Abstract exceeds word limit | -5 |
| Minor | APA formatting errors | -2 per instance |

## Enforcement

- **Score < 80:** Block commit. List blocking issues.
- **Score < 90:** Allow commit, warn. List recommendations.
- User can override with justification.

## Quality Reports

Generated **only at merge time**. Use `templates/quality-report.md` for format.
Save to `quality_reports/merges/YYYY-MM-DD_[branch-name].md`.

## Effect Size Benchmarks (Consumer Psychology)

| Effect | Small | Medium | Large |
|--------|-------|--------|-------|
| Cohen's d | 0.20 | 0.50 | 0.80 |
| η² | 0.01 | 0.06 | 0.14 |
| r | 0.10 | 0.30 | 0.50 |
| f² (regression) | 0.02 | 0.15 | 0.35 |
