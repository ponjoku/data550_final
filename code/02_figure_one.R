library(dplyr)
library(ggplot2)

here::i_am("code/02_figure_one.R")

data_clean <- readRDS(
  file = here::here("data/clean_data.rds")
)


figure_one <- data_clean |>
  filter(!is.na(admissions), !is.na(stigmatized)) |>
  mutate(adm_group = ifelse(admissions == 0, "0",
                            ifelse(admissions <= 2, "1–2",
                                   ifelse(admissions <= 4, "3–4", "5 or more")))) |>
  ggplot(aes(x = adm_group, fill = stigmatized)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_manual(values = c("No" = "grey80", "Yes" = "#C0392B")) +
  labs(
    title = "Figure 1. Stigma increases with number of hospital admissions",
    x = "Hospital admissions in the past year",
    y = "Percentage of patients",
    fill = "Child stigmatized",
    caption = "Data: Harvard Dataverse, Eastern Uganda SCD clinics, 2018."
  ) +
  theme_classic()


ggsave(
  here::here("output/figure_one.png"),
  plot = figure_one,
  device = "png"
)
