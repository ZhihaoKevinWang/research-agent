---
paths:
  - "Study */**/*.R"
  - "Study */**"
  - "manuscripts/**"
---

# Task Completion Verification Protocol

**At the end of EVERY task, Claude MUST verify the output works correctly.** This is non-negotiable.

All paths below are **relative to `Study N/`** unless the task is project-wide.

## For R Scripts (`Study N/scripts/`):
```bash
cd "Study N" && Rscript scripts/analysis.R 2>&1 | tail -30
```
- Check exit code (0 = success)
- Verify output files in `Study N/output/` were created with non-zero size
- Spot-check effect sizes and N for reasonable magnitude
- Confirm `Study N/data/raw/` was NOT modified

## For Manuscript Files (`manuscripts/`):
```bash
Rscript -e "rmarkdown::render('manuscripts/[file].Rmd')" 2>&1 | tail -20
```
- Check exit code
- Verify rendered output (PDF, HTML, DOCX) exists
- Check for render warnings or missing citations

## For Data Processing Scripts:
1. Run the script from the study directory
2. Verify `Study N/data/processed/` files created with non-zero size
3. Check row count vs. expected N minus documented exclusions
4. Confirm `Study N/data/raw/` files unchanged

## For Preregistration Alignment (only if prereg exists):
1. Find `Study N/preregistrations/[file].md`
2. Check that primary hypothesis variable names match the script
3. Flag any divergence as a comment — do not block execution

## Common Pitfalls:
- **Wrong working directory:** Run scripts from `Study N/`, not the project root
- **Running analysis on raw data:** Always use `Study N/data/processed/`
- **Hardcoded absolute paths:** Use paths relative to the study folder
- **Assuming success:** Always verify output files exist AND have non-zero size

## Verification Checklist:
```
[ ] Script run from correct directory (Study N/)
[ ] Output files created in Study N/output/
[ ] No R errors or unexpected warnings
[ ] Study N/data/raw/ unchanged
[ ] Effect sizes / N are plausible
[ ] Reported results to user
```
