# Study 1 Data Codebook

**Raw file:** `data/raw/[filename].csv`
**Processed file:** `data/processed/[filename]_clean.csv`
**Collected:** [YYYY-MM-DD]
**Platform:** [MTurk / Prolific / Lab]
**N raw / N after exclusions:** [X] / [X]

---

## Variable Dictionary

| Variable | Type | Values | Description |
|----------|------|--------|-------------|
| `id` | string | unique | Participant ID |
| `condition` | factor | "A" / "B" | Experimental condition |
| `attention_check` | binary | 0 = fail, 1 = pass | Attention filter item |
| `manip_check` | integer | 1–7 | Manipulation check: "[item text]" |
| `dv_1` | integer | 1–7 | DV item 1: "[item text]" |
| `dv_2` | integer | 1–7 | DV item 2: "[item text]" |
| `dv_3` | integer | 1–7 | DV item 3: "[item text]" (reverse-scored) |
| `dv_composite` | numeric | 1–7 | Mean of dv_1, dv_2, dv_3r |
| `age` | integer | years | Self-reported age |
| `gender` | factor | M / F / Other | Self-reported gender |

## Scale Sources

| Scale | Citation | α |
|-------|---------|---|
| [DV name] | [Author, Year] | [.XX] |

## Processing Notes

- `dv_3` reverse-scored before composite
- Exclusions: [description of criteria applied]
- Known issues: [any data quality notes]
