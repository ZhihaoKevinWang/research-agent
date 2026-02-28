# ============================================================
# Study 1: [Study Name]
# Author: [YOUR NAME]
# Date: [YYYY-MM-DD]
# Purpose: [Brief description of what this script tests]
# Preregistration: preregistrations/[file].md (if any)
# Inputs:  data/processed/[study]_clean.csv
# Outputs: output/figures/*, output/tables/*, output/*.rds
# ============================================================
# NOTE: Run this script from Study 1/ as the working directory
#       or use here::here() to anchor paths to the study root.
# ============================================================

# 0. Setup ----
library(tidyverse)
library(rstatix)
library(effectsize)
library(modelsummary)
library(psych)

set.seed(20240101)  # Replace with YYYYMMDD of data collection

dir.create("output/figures", recursive = TRUE, showWarnings = FALSE)
dir.create("output/tables",  recursive = TRUE, showWarnings = FALSE)

# Project color palette (copy from CLAUDE.md or .claude/rules/r-code-conventions.md)
primary_color <- "#[PLACEHOLDER]"
accent_color  <- "#[PLACEHOLDER]"

theme_project <- function(base_size = 14) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title    = element_text(face = "bold", color = primary_color),
      legend.position = "bottom",
      panel.grid.minor = element_blank()
    )
}

# 1. Load Data ----
df_raw <- read_csv("data/processed/study1_clean.csv")
message("Loaded: ", nrow(df_raw), " observations")

# 2. Exclusions ----
# Apply before inspecting DVs
df <- df_raw |>
  filter(attention_check == 1)

message("After exclusions: ", nrow(df), " (excluded: ", nrow(df_raw) - nrow(df), ")")

exclusions <- list(n_raw = nrow(df_raw), n_final = nrow(df))
saveRDS(exclusions, "output/exclusions.rds")

# 3. Scale Construction ----
df <- df |>
  mutate(dv_composite = rowMeans(across(c(dv_1, dv_2, dv_3)), na.rm = TRUE))

alpha_dv <- psych::alpha(df |> select(dv_1, dv_2, dv_3))
saveRDS(alpha_dv, "output/alpha_dv.rds")

# 4. Manipulation Check ----
manip_result <- df |>
  t_test(manip_check ~ condition, var.equal = FALSE) |>
  add_cohens_d(df, manip_check ~ condition)
saveRDS(manip_result, "output/manip_check.rds")

# ============================================================
# CONFIRMATORY — H1: [Hypothesis text]
# ============================================================
result_h1 <- df |>
  t_test(dv_composite ~ condition, var.equal = FALSE) |>
  add_cohens_d(df, dv_composite ~ condition)
saveRDS(result_h1, "output/result_h1.rds")

# ============================================================
# EXPLORATORY — not pre-registered
# ============================================================
# [Add exploratory analyses here]

# 5. Figures ----
fig1 <- df |>
  group_by(condition) |>
  summarise(M = mean(dv_composite), SE = sd(dv_composite) / sqrt(n()),
            CI_lo = M - 1.96 * SE, CI_hi = M + 1.96 * SE) |>
  ggplot(aes(x = condition, y = M, fill = condition)) +
  geom_col(width = 0.5) +
  geom_errorbar(aes(ymin = CI_lo, ymax = CI_hi), width = 0.15) +
  scale_fill_manual(values = c(primary_color, accent_color)) +
  labs(x = "Condition", y = "[DV label] (1–7)", fill = NULL) +
  theme_project()

ggsave("output/figures/fig1_means.pdf", fig1, width = 6.5, height = 4, dpi = 300)
ggsave("output/figures/fig1_means.png", fig1, width = 6.5, height = 4, dpi = 300)

message("Done. Outputs saved to output/")
