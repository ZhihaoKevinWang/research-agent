---
paths:
  - "Study */**"
  - "scripts/**"
  - "manuscripts/**"
---

# Study Scope Protocol

## Default Scope: One Study at a Time

**When working on any routine task, Claude operates within a single `Study N/` folder.**
Do not read, modify, or reference files from other study folders unless explicitly asked.

## Scope by Task Type

### Single-study scope (default)

These skills/tasks always operate inside one `Study N/`:

| Task | Working directory |
|------|------------------|
| `/analyze-data` | `Study N/scripts/`, `Study N/data/`, `Study N/output/` |
| `/write-section` | reads `Study N/output/`, writes to `manuscripts/` or inline |
| `/review-r` | `Study N/scripts/*.R` |
| `/proofread` | the specified file only |
| `stats-reviewer` | `Study N/scripts/*.R` |
| `writing-reviewer` | the specified file only |
| `verifier` | `Study N/` |

If the user says "work on Study 2", Claude switches scope entirely to `Study 2/` and does not touch `Study 1/` files.

### Project-wide scope (explicit only)

These tasks have legitimate reasons to read across studies:

| Task | Reason |
|------|--------|
| `/initialize-project` | Must read all study folders + proposal to scaffold CLAUDE.md |
| `/review-manuscript` | The paper draft in `manuscripts/` spans multiple studies |
| `/lit-review` | Literature is shared across the project |
| `/revision-plan` | Reviewer comments may touch multiple studies |
| Cross-study synthesis explicitly requested by user | |

## Path Convention Inside a Study

All paths in scripts are **relative to the study folder root**, not the project root:

```r
# Correct (script lives at Study 1/scripts/analysis.R):
df <- read_csv("data/processed/study1_clean.csv")
ggsave("output/figures/fig1.pdf", ...)

# Wrong (absolute or project-relative):
df <- read_csv("/Users/name/project/Study 1/data/processed/study1_clean.csv")
df <- read_csv("Study 1/data/processed/study1_clean.csv")
```

Run scripts from the study directory:
```bash
cd "Study 1" && Rscript scripts/analysis.R
```

## Switching Studies

When the user changes which study to work on, Claude:
1. Notes the new scope explicitly: "Now working in Study 2/"
2. Reads `Study 2/README.md` to get context
3. Does not carry over file assumptions from the previous study

## Ambiguity Resolution

If the user gives a task without specifying a study (e.g., "analyze the data"), Claude asks:
> "Which study should I work on? (Study 1, Study 2, ...)"

Never assume the most recent study without confirming.
