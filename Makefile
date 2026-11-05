#! To build report
project_2.html: code/03_render_report.R project_2.Rmd output/table_one.rds output/figure_one.png
	Rscript code/03_render_report.R
	
data/clean_data.rds: code/00_clean_data.R data/SCD.xls
	Rscript code/00_clean_data.R
	
output/table_one.rds: code/01_table_one.R data/clean_data.rds
	Rscript code/01_table_one.R
	
output/figure_one.png: code/02_figure_one.R data/clean_data.rds
	Rscript code/02_figure_one.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png