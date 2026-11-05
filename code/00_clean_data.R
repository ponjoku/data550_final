here::i_am("code/00_clean_data.R")

library(gtsummary)
library(dplyr)
library(ComplexUpset)
library(knitr)
library(readxl)
library(ggplot2)
library(labelled)

#read in data
data <- read_excel(here::here("data/SCD.xls"), na = c("", "Missing"))

data_clean <- data |>
  select(
    age = Age,
    sex = Sex,
    tribe        = Tribe,
    family_scd   = relativeswithsicklersinthefamily,
    admissions   = N17Howmanyadmissionsdidthechildhavelastyear,
    transfused   = N19Wasthechildtransfusedinthoseadmissions,
    heard_hu     = N13HaveyouheardaboutadrugcalledHYDROXYUREA,
    uses_hu      = N15IsarethesicklersinyourfamilyusingHYDROXYUREA,
    stigmatized  = N24Isthechildstigmatized,
    pain         = N2Pains,
    fever        = N1Fever,
    anemia       = N3Lackofblood,
    swelling     = N9Swollenhandsandfeet,
    malaria      = N4Malaria,
    hip_pain     = N12Painfulhip,
    pneumonia    = N5Pneumonia
  ) |>
  mutate(
    age_group = ifelse(age <= 4, "0-4",
                       ifelse(age <= 9, "5-9",
                              ifelse(age <= 17, "10-17", "18+"))),
    age_group = factor(age_group, levels = c("0-4", "5-9", "10-17", "18+"))
  )

saveRDS(
  data_clean, 
  file = here::here("data/clean_data.rds")
)
