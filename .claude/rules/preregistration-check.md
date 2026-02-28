---
paths:
  - "preregistrations/**"
  - "scripts/**/*.R"
  - "manuscripts/**"
---

# Preregistration Guide (Optional)

Preregistration is **optional**. Many studies in this project are pilots or exploratory. Claude will never require a preregistration to exist before running an analysis or writing a section.

---

## When Preregistration Is Relevant

If a `preregistrations/` file exists for a study, Claude will:
- Read it to understand the intended analysis plan
- Note any divergences in code comments (not block execution)
- Help draft or update preregistration documents on request

If no preregistration exists, Claude proceeds without complaint.

---

## Study Types — Label in Code Comments

To keep analyses organized, label each analysis block with its status:

```r
# PILOT — informing study design, no formal hypotheses yet

# EXPLORATORY — hypothesis-generating, will not be reported as confirmatory

# CONFIRMATORY — pre-registered at [OSF URL / filename]
```

Labeling is **good practice but not enforced**. Omitting labels is fine for early-stage work.

---

## If You Do Preregister

Recommended file naming:
```
preregistrations/
├── study1_prereg_v1.md       # Draft
├── study1_prereg_LOCKED.md   # Final (optional lock)
└── study1_osf_link.txt       # OSF / AsPredicted URL
```

`*_LOCKED.md` files are no longer write-protected by default. Rename manually when ready.

---

## Preregistration Templates

If you want to preregister a study, ask Claude to draft one using the template at `project-skeleton/preregistrations/study1_prereg_v1.md`.
