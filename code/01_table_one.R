library(dplyr)
library(gtsummary)
library(labelled)

here::i_am("code/01_table_one.R")

data_clean <- readRDS(
  file = here::here("data/clean_data.rds")
)

var_label(data_clean) <- list(
  age_group  = "Age group (years)",
  sex        = "Sex",
  family_scd = "Relatives with SCD",
  admissions = "Admissions in past year",
  transfused = "Transfused during admissions",
  heard_hu   = "Heard of hydroxyurea",
  uses_hu    = "Uses hydroxyurea"
)

table_one <- data_clean |>
  select(age_group, sex, family_scd, admissions,
         transfused, heard_hu, uses_hu, stigmatized) |>
  tbl_summary(
    by = stigmatized, missing = "no") |>
  add_overall() |>
  add_p() |>
  bold_labels() |>
  modify_spanning_header(c("stat_1", "stat_2")
                         ~ "**Child stigmatized**") |>
  modify_caption("**Table 1. Characteristics of patients with sickle 
                 cell disease, by stigma status**")

saveRDS(
  table_one, 
  file = here::here("output/table_one.rds")
)

