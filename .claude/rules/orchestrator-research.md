---
paths:
  - "scripts/**/*.R"
  - "explorations/**"
  - "manuscripts/**"
---

# Research Project Orchestrator (Simplified)

**For R scripts, data analysis, and manuscript drafting** -- use this simplified loop instead of the full multi-agent orchestrator.

## The Simple Loop

```
Plan approved → orchestrator activates
  │
  Step 1: IMPLEMENT — Execute plan steps
  │
  Step 2: VERIFY — Run code, check outputs
  │         R scripts: Rscript runs without error
  │         Analyses: effect sizes / N are sensible
  │         Manuscripts: renders without error
  │         Preregistration alignment: check only if prereg file exists
  │         If verification fails → fix → re-verify
  │
  Step 3: SCORE — Apply quality-gates rubric
  │
  └── Score >= 80?
        YES → Done (commit when user signals)
        NO  → Fix blocking issues, re-verify, re-score
```

**No 5-round loops. No multi-agent reviews. Just: write, test, done.**

## Verification Checklist

- [ ] Script runs without errors
- [ ] All packages loaded at top
- [ ] No hardcoded absolute paths
- [ ] `set.seed()` once at top if stochastic
- [ ] Output files created at expected paths
- [ ] Pre-registered exclusions applied
- [ ] Confirmatory vs. exploratory analyses labeled
- [ ] Effect sizes computed and reported
- [ ] Quality score >= 80
