---
name: make-slides
description: Create a Beamer presentation for the current Study N/ using the project Template/ folder. Generates figures in R, writes the .tex file, and compiles it. Requires analyze-data and write-section to be complete first.
argument-hint: "[Study N]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Bash", "Task"]
---

# Make Beamer Slides for Study N

Create a complete, compiled Beamer presentation for the current study, following the project template exactly.

**Input:** `$ARGUMENTS` — study identifier, e.g. "Study 1" or "Study 2".

---

## Phase 0: Prerequisite Checks

Before writing a single line of LaTeX, verify two things. **Halt if either fails.**

### Check 1 — Analysis outputs exist
```bash
ls "Study N/output/figures/"
ls "Study N/output/tables/"
ls "Study N/output/"*.rds 2>/dev/null
```
If `Study N/output/figures/` is empty or missing, stop:
> "Analysis outputs not found. Please run `/analyze-data Study N` first, then come back."

### Check 2 — Written content exists
Look for any of:
- `manuscripts/` draft referencing this study
- A section draft in `Study N/quality_reports/`
- A `write-section` output for this study

If none found, stop:
> "No written content found for Study N. Please run `/write-section Study N` first, then come back."

---

## Phase 1: Read the Template

The `Template/` folder at the **project root** is the single source of truth for all design decisions.

```
Glob("Template/**")
```

Read every file found:
- `.sty` / preamble `.tex` — extract `\usetheme`, `\usecolortheme`, `\definecolor`, font commands, custom environments
- Sample `.tex` slide files — extract structural patterns: how title slides, section dividers, figure slides, and table slides are constructed
- Any `README` or style guide — follow its instructions literally

**Extract and record:**
- Exact `\documentclass[...]` options
- All `\usepackage` declarations
- All `\definecolor` entries → these become the ggplot2 palette
- All custom environments (`\begin{...}`) and commands (`\key{}`, `\highlight{}`, etc.)
- Frame layout conventions (does content go in columns? is there a sidebar? logo placement?)
- Which preamble file to include (`\input{...}` or `\include{...}`)

**Do not invent design choices.** If the template does not specify something, leave it to LaTeX defaults.

---

## Phase 2: Generate Figures in R

All figures for the slides **must be regenerated** at slide-appropriate dimensions and using the template's color palette extracted in Phase 1.

### 2a: Create the figure script

Write `Study N/scripts/slides_figures.R`:

```r
# ============================================================
# Study N: Slide Figures
# Purpose: Generate publication-quality figures for Beamer slides
# Inputs:  Study N/output/*.rds  (pre-computed results)
# Outputs: Study N/slides/figures/*.pdf
# ============================================================
# Run from: Study N/

library(tidyverse)

dir.create("slides/figures", recursive = TRUE, showWarnings = FALSE)

# --- Color palette from Template/ (fill in from Phase 1) ---
# Example — replace with actual colors from Template/:
col_primary   <- "#[EXTRACTED_FROM_TEMPLATE]"
col_secondary <- "#[EXTRACTED_FROM_TEMPLATE]"
col_accent    <- "#[EXTRACTED_FROM_TEMPLATE]"
col_text      <- "#[EXTRACTED_FROM_TEMPLATE]"

theme_slides <- function(base_size = 18) {
  theme_minimal(base_size = base_size) +
    theme(
      text             = element_text(color = col_text),
      plot.title       = element_text(face = "bold", color = col_primary, size = base_size + 2),
      axis.title       = element_text(size = base_size - 2),
      axis.text        = element_text(size = base_size - 4),
      legend.position  = "bottom",
      legend.title     = element_blank(),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(color = "grey92"),
      plot.background  = element_rect(fill = "transparent", color = NA),
      panel.background = element_rect(fill = "transparent", color = NA)
    )
}

# --- Load pre-computed results ---
result_h1    <- readRDS("output/result_h1.rds")
exclusions   <- readRDS("output/exclusions.rds")
# Add other RDS loads as needed

# --- Figure: Main result (condition means) ---
# Load or reconstruct summary data from RDS, then plot:

fig_main <- [reconstruct from RDS] |>
  ggplot(aes(x = condition, y = M, fill = condition)) +
  geom_col(width = 0.55, color = NA) +
  geom_errorbar(aes(ymin = CI_lo, ymax = CI_hi), width = 0.15, linewidth = 0.7) +
  scale_fill_manual(values = c(col_primary, col_secondary)) +
  labs(
    title = "[Main finding in plain language]",
    x     = "[Condition label]",
    y     = "[DV label] (1–7)"
  ) +
  theme_slides()

# Beamer figure dimensions: 4:3 ratio, transparent background
ggsave("slides/figures/fig_main.pdf",
       fig_main, width = 8, height = 5,
       bg = "transparent")

# Add additional figures as needed
```

### 2b: Run the script and verify

```bash
cd "Study N" && Rscript scripts/slides_figures.R 2>&1 | tail -20
```

Check:
- Exit code 0
- `Study N/slides/figures/` contains at least one `.pdf`
- File sizes > 0

**Do not proceed to Phase 3 until all figure PDFs exist.**

---

## Phase 3: Write the .tex File

Write `Study N/slides/study_N_slides.tex` (use actual study name in filename).

### 3a: Preamble

Mirror the template exactly:

```latex
\documentclass[aspectratio=169,10pt]{beamer}   % match template options

% --- Follow template preamble exactly ---
\input{../../Template/[preamble_file]}           % adjust relative path to Template/
% or copy \usepackage and \definecolor blocks if \input isn't possible

% --- Title info (fill from CLAUDE.md / Study README) ---
\title{[Study title from README.md]}
\subtitle{[Paper title or conference name]}
\author{[PI name from CLAUDE.md]}
\institute{[Institution from CLAUDE.md]}
\date{\today}
```

### 3b: Slide Structure

Follow this sequence. Use template environments and commands throughout:

**1. Title frame**
```latex
\begin{frame}
  \titlepage
\end{frame}
```

**2. Motivation (2–3 frames)**
- Real-world observation or puzzle — 1 concrete example
- Why existing research falls short — 1-2 bullets
- Research question stated explicitly

**3. Theoretical Framework (2–3 frames)**
- Core theory — named, 2-3 bullet fragments
- Proposed mechanism — arrow diagram in TikZ if the template uses it, otherwise bullets
- Formal hypotheses:
```latex
\begin{block}{H1}
  [Hypothesis text from Study README.md]
\end{block}
```

**4. Study Design (1 frame)**
```latex
% Two-column layout if template supports it:
\begin{columns}
  \column{0.5\textwidth}
    \textbf{Design:} [N]-condition between-subjects \\
    \textbf{N:} [N] participants \\
    \textbf{IV:} [name and manipulation] \\
    \textbf{DV:} [name and scale]
  \column{0.5\textwidth}
    [Procedure timeline or stimulus image if available]
\end{columns}
```

**5. Results — Figure First (1–2 frames per key finding)**

Each results frame: figure dominates, minimal text below.
```latex
\begin{frame}{H1: [Brief hypothesis label]}
  \begin{center}
    \includegraphics[width=0.72\textwidth]{figures/fig_main.pdf}
  \end{center}
  \vspace{-0.3em}
  {\small [Condition A] > [Condition B]: $t([df]) = [X]$, $p = [X]$, $d = [X]$}
\end{frame}
```

Tables go on supplementary frames at the end, not in the main flow.

**6. Discussion (1 frame)**
- 3–4 bullet fragments: what we learned, why it matters, what it rules out

**7. Theoretical Contributions (1 frame)**
- "This research shows that..."  — 3–5 points using template highlight command

**8. Implications & Next Steps (1 frame)**
- Managerial takeaway (1 bullet)
- Limitation + future study (1–2 bullets)

**9. Thank You**
```latex
\begin{frame}
  \centering
  \Large Thank you! \\[1em]
  \normalsize [email / website]
\end{frame}
```

**10. Appendix (optional)**
```latex
\appendix
\begin{frame}{Full Results Table}
  % Table from output/tables/
\end{frame}
```

---

## Phase 4: Compile

Run 3-pass XeLaTeX from the study's `slides/` directory (XeLaTeX handles unicode and most Beamer themes):

```bash
cd "Study N/slides" && \
  TEXINPUTS=../../Template/:$TEXINPUTS \
  xelatex -interaction=nonstopmode study_N_slides.tex 2>&1 | tail -30

cd "Study N/slides" && \
  TEXINPUTS=../../Template/:$TEXINPUTS \
  xelatex -interaction=nonstopmode study_N_slides.tex 2>&1 | grep -E "Error|Warning|Overfull" | head -20

cd "Study N/slides" && \
  TEXINPUTS=../../Template/:$TEXINPUTS \
  xelatex -interaction=nonstopmode study_N_slides.tex 2>&1 | tail -5
```

### Compilation checks:
- Exit code 0 → success
- `study_N_slides.pdf` exists and size > 10 KB
- Grep for `! ` (fatal errors) — must be zero
- Grep for `Overfull \hbox` — note count; flag if > 5 instances
- Grep for `undefined` — flag any undefined references or commands

### If compilation fails:
1. Read the full log: `cat "Study N/slides/study_N_slides.log" | grep -A3 "! "`
2. Fix the specific error (missing package, undefined command, path issue)
3. Re-compile — up to 2 fix attempts before reporting to user

---

## Phase 5: Report

Once compiled successfully:

```
✓ Figures generated: Study N/slides/figures/ (N files)
✓ Slides written:    Study N/slides/study_N_slides.tex (N frames)
✓ Compiled:          Study N/slides/study_N_slides.pdf
  - Overfull hbox warnings: N
  - Total frames: N (target: ~1 per minute of talk)

Slides follow template: Template/[template_name]
Color palette used: [col_primary], [col_secondary], [col_accent]
```

If there are remaining warnings or issues, list them clearly so the user can decide whether to fix them.

---

## Hard Rules

1. **Template is the law.** Never invent colors, fonts, environments, or layouts not present in `Template/`.
2. **ggplot2 only.** No base R plots, no matplotlib, no hand-drawn diagrams in the tex.
3. **Figures first.** Every results frame leads with the figure, not the bullet list.
4. **No full sentences on slides.** Fragment bullets only.
5. **No compilation, no finish.** The skill is not complete until the PDF exists and the exit code is 0.
6. **Scope: Study N/ only.** Do not read or modify other study folders.
