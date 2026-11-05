# PLEASE READ CAREFULLY 

# Clinical Burden and Treatment Gaps Among Patients 
# with Sickle Cell Disease in Eastern Uganda


## Report description

This report analyzes data from 1,829 patients with sickle cell disease (SCD) 
who attended four clinics in eastern Uganda (Mbale, Soroti, Atutur, and Ngora) 
between February and August 2018.

The report contains:

- **Table 1:** patient characteristics (age group, sex, family history of SCD, 
hospital admissions, transfusions, and hydroxyurea awareness and use), 
stratified by whether the child was stigmatized, with p-values.

- **Figure 1:** a stacked bar chart of the percentage of children stigmatized, 
grouped by number of hospital admissions in the past year.


## How to generate the final report

1. Clone this repository and open a terminal in the project folder (`project_2/`).
2. Install the required R packages (see below).
3. Run: make in the terminal 


This runs every step in order and produces `project_2.html` in the project folder.

To delete all generated files and rebuild from scratch:
run - make clean

## File structure

| `data/SCD.xls` | Raw data from Harvard Dataverse |
| `code/00_clean_data.R` | Selects and renames variables, creates age groups, 
  and saves `data/clean_data.rds` |
| `code/01_table_one.R` | **Creates Table 1** and saves it to `output/table_one.rds` |
| `code/02_figure_one.R` | **Creates Figure 1** and saves it to `output/figure_one.png` |
| `code/03_render_report.R` | Renders `project_2.Rmd` into `project_2.html` |
| `project_2.Rmd` | R Markdown report that reads in the saved table and figure |
| `Makefile` | The build steps and their dependencies |
| `output/` | Folder for the generated table and figure |

## Code for the required table

Table 1 is created in **`code/01_table_one.R`** using `gtsummary::tbl_summary()`. 
The script saves the table to `output/table_one.rds`, and the report reads it from there.

## Code for the required figure

Figure 1 is created in **`code/02_figure_one.R`** using `ggplot2`. 
The script saves the figure to `output/figure_one.png`, and the report includes 
it with `knitr::include_graphics()`.

## Required R packages

`here`, 
`readxl`, 
`dplyr`, 
`labelled`, 
`gtsummary`, 
`ggplot2`, 
`scales`, 
`knitr`, 
`rmarkdown`

