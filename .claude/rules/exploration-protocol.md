---
paths:
  - "explorations/**"
---

# Exploration Protocol for Consumer Psychology Research

**All exploratory analyses, pilot work, and speculative ideas go into `explorations/` first.**
Never run unplanned analyses on main study data without documenting them as exploratory.

---

## Why This Matters

In consumer psychology, the boundary between confirmatory and exploratory research is scientifically and ethically critical. The exploration folder is a sandbox where:
- Pilot study analyses are developed
- Preliminary ideas are tested before preregistration
- Post-hoc explorations are clearly quarantined from confirmed findings

---

## Folder Structure

```
explorations/
├── ACTIVE_PROJECTS.md          # Running list of active explorations
├── [study-name_exploration]/
│   ├── README.md               # Goal, status, findings, confirmatory status
│   ├── scripts/                # Code (use _v1, _v2 for iterations)
│   ├── output/                 # Results (figures, tables, RDS)
│   └── SESSION_LOG.md          # Progress notes
└── ARCHIVE/
    ├── completed_[name]/       # Graduated to preregistration or paper
    └── abandoned_[name]/       # Dead ends (document why)
```

---

## Lifecycle

1. **Create** — `mkdir -p explorations/[name]/{scripts,output}` + README
2. **Mark status** — every README must declare one of:
   - `STATUS: PILOT` — pre-collection, informing design
   - `STATUS: EXPLORATORY` — post-collection, hypothesis-generating
   - `STATUS: GRADUATED` — moved to preregistration
   - `STATUS: ABANDONED` — not pursued
3. **Develop** — work entirely within the exploration folder
4. **Decide:**
   - **Graduate** — findings inform a new preregistration; copy clean script to `scripts/`; archive
   - **Keep exploring** — document next steps in README
   - **Abandon** — move to `ARCHIVE/abandoned_[name]/` with explanation

---

## Graduate Checklist (Exploration → Preregistration)

- [ ] Effect size from exploration used for power analysis
- [ ] Stimuli and measures finalized based on pilot
- [ ] Preregistration drafted at `preregistrations/study_prereg_v1.md`
- [ ] Exploration archived at `ARCHIVE/completed_[name]/`
- [ ] README updated with `STATUS: GRADUATED` and link to preregistration

---

## Strict Rule: No HARKing

**NEVER move exploratory findings into a manuscript's confirmatory section.**

If a finding was not pre-registered, it must be reported as exploratory. The exploration folder enforces this discipline by making the exploratory origin of every analysis traceable.

Any manuscript section drawing on `explorations/` must:
1. Label the finding as exploratory or pilot-based
2. Note that the finding was not pre-registered
3. Recommend future preregistered replication
