# Template/

This folder contains the Beamer theme used by `/make-slides` for all study presentations.

**The `/make-slides` skill reads this folder first and follows its design language exactly.**

---

## What belongs here

Place your Beamer template files here. Typical contents:

```
Template/
├── README.md               ← this file
├── beamertheme[Name].sty   ← custom theme file (if any)
├── preamble.tex            ← \usepackage, \definecolor, \usetheme, \usecolortheme
├── example_slide.tex       ← a complete minimal .tex showing the intended style
└── assets/
    ├── logo.pdf            ← institution logo for title slide / footer
    └── background.pdf      ← background image (if used)
```

## What make-slides extracts from this folder

1. **`\definecolor` entries** → ggplot2 color palette for figures
2. **`\documentclass[...]` options** → copied verbatim into generated .tex
3. **`\usepackage` declarations** → copied verbatim
4. **Custom environments** (e.g., `\begin{block}`, `\begin{highlight}`) → used in slide content
5. **Frame layout patterns** from `example_slide.tex` → column layouts, title placement, logo placement
6. **Preamble file path** → `\input{../../Template/preamble.tex}` in generated slides

## Setup instructions

1. Copy your Beamer `.sty` and preamble files into this folder
2. Create `example_slide.tex` showing at minimum: title frame, content frame with bullets, figure frame, two-column frame
3. Run `/make-slides Study 1` — it will read this folder automatically

## If no template exists yet

`/make-slides` will halt and ask you to populate this folder before proceeding.
A minimal `preamble.tex` with just `\usetheme{Madrid}` and a color definition is enough to start.
