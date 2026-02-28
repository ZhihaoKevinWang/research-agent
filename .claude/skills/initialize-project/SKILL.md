---
name: initialize-project
description: Reads all project files (proposal, manuscripts, existing data, scripts) and generates a project-specific CLAUDE.md and MEMORY.md, then scaffolds the actual Study N/ folder structure based on the proposal. Run once at project start or when onboarding to an existing project.
argument-hint: "[optional: path to proposal file]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Bash"]
---

# Initialize Project

Read the proposal and all existing project files, then:
1. Scaffold `Study 1/`, `Study 2/`, ... based on the proposal
2. Generate a project-specific `CLAUDE.md`
3. Generate a project-specific `MEMORY.md`

**This is the only skill with project-wide file access.** All other skills are scoped to one study.

---

## Phase 1: Discovery (Read Everything)

### Find and Read the Proposal
- Look for: `*.pdf`, `*.docx`, `*.md` in root or `references/` containing "proposal", "grant", "study plan"
- Extract: project title, PI, institution, number of studies, study descriptions, hypotheses, key constructs

### Scan Existing Files
Look for any existing content across the full project:

```
Glob("Study */**")           → existing study folders
Glob("manuscripts/**")       → existing drafts
Glob("**/preregistrations/**") → any prereg docs
Glob("**/*.R")               → existing scripts
Glob("**/codebook*")         → data dictionaries
Glob("references.bib")       → bibliography
```

Read each discovered file to extract:
- Study names and purposes
- N targets and designs
- IV/DV names and operationalizations
- Status (planning / collected / analyzed / complete)
- Theoretical frameworks cited

---

## Phase 2: Scaffold Study Folders

**From the proposal, determine the study list.** For each study described:

1. Create `Study N/` with the full standard structure:

```bash
mkdir -p "Study N/data/raw"
mkdir -p "Study N/data/processed"
mkdir -p "Study N/experiments/stimuli"
mkdir -p "Study N/experiments/qualtrics"
mkdir -p "Study N/experiments/materials"
mkdir -p "Study N/preregistrations"
mkdir -p "Study N/scripts"
mkdir -p "Study N/output/figures"
mkdir -p "Study N/output/tables"
mkdir -p "Study N/quality_reports"
```

2. Write `Study N/README.md` populated with real information from the proposal:
   - Study name (actual name, not "Study N")
   - Purpose (what it tests, why it's the right study)
   - Hypotheses (as stated in proposal)
   - Key variables (IV, DV, manipulations)
   - Status: Planning / Data Collection / Analysis / Complete
   - Target N (from proposal or power analysis)

3. Write `Study N/data/codebook.md` as a template pre-filled with variable names from the proposal.

4. Write `Study N/scripts/analysis.R` as a template pre-filled with:
   - Correct study name in header
   - Hypothesis labels matching the proposal
   - Correct IV/DV variable name placeholders

**Important:** Use the exact study names from the proposal, not generic "Study 1", "Study 2". Example: if the proposal calls it "Study 1: Scarcity Framing Experiment", name the folder `Study 1/` but populate README.md with the real name and description.

### Also Create (if not present):

```
manuscripts/      ← empty, for the combined paper
literature/       ← empty, for PDFs
slides/           ← empty, for presentations
quality_reports/plans/
quality_reports/session_logs/
explorations/ARCHIVE/
```

---

## Phase 3: Generate CLAUDE.md

Overwrite (or create) `CLAUDE.md` with all `[PLACEHOLDER]` fields filled in:

```markdown
**Project:** [ACTUAL title from proposal]
**Institution:** [ACTUAL institution]
**PI / Lead Researcher:** [ACTUAL PI name]
```

Customize:
- **Folder structure** — list the actual study folder names
- **Study table** — real study names, designs, target N, status
- **Manuscript table** — real manuscript files if any exist
- **Analysis conventions** — alpha, power target, primary DVs, packages used
- **Commands** — actual script names

---

## Phase 4: Generate MEMORY.md

Create or update `MEMORY.md` with everything needed to resume work without re-reading all files:

```markdown
# Project Memory: [Project Title]

## Project Identity
- **Title:** [Full title]
- **PI:** [Name], [Institution]
- **Domain:** [Sub-area — e.g., scarcity, social comparison, luxury]
- **Target journals:** [JCR / JMR / JCP / etc.]

## Studies
| Study | Name | Design | N target | Status | Key IV | Key DV |
|-------|------|--------|----------|--------|--------|--------|
| 1 | [name] | [design] | [N] | [status] | [IV] | [DV] |
| 2 | [name] | [design] | [N] | [status] | [IV] | [DV] |

## Theoretical Framework
- [Core theory 1]: [brief description and relevance]
- [Core theory 2]: [brief description]

## Key Constructs
- **Focal IV:** [name, operationalization]
- **Focal DV:** [name, scale, α if known]
- **Mediator:** [if any]
- **Moderator:** [if any]

## Analysis Conventions
- Alpha: [threshold]
- Power target: [e.g., .80]
- Effect size reference: [source + d/η² value]
- Primary R packages: [tidyverse, rstatix, effectsize, ...]
- Run scripts from: study directory (cd "Study N" && Rscript scripts/analysis.R)

## Current Active Study
[Study N — what's being worked on now]

## File Map
- Manuscripts: [file names]
- Key scripts: [Study N/scripts/analysis.R, ...]
- Bibliography: references.bib

## Open Questions / Blockers
[Any unresolved issues found in existing files]
```

---

## Phase 5: Report to User

Summarize what was done:

```
✓ Scaffolded N study folders: Study 1/ [name], Study 2/ [name], ...
✓ README.md populated for each study
✓ CLAUDE.md generated ([N] placeholders remaining)
✓ MEMORY.md created

Placeholders still needing your input:
- [ ] Primary color palette (for R figures)
- [ ] [Any other fields Claude couldn't determine from proposal]

Recommended next steps:
1. Review Study 1/README.md and correct anything I got wrong
2. Add raw data file to Study 1/data/raw/ when ready
3. Run /analyze-data "Study 1" to begin analysis
```

---

## Rules

- **Only fill in values actually found in the proposal or existing files.** Leave `[PLACEHOLDER]` for anything that cannot be determined.
- **Never read or modify `Study N/data/raw/`** — raw data is protected.
- **If study folders already exist**, compare them against the proposal. Note discrepancies but do not overwrite existing analysis scripts or data.
- **If the proposal is ambiguous** about number of studies, ask the user before scaffolding.
