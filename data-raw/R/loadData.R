####################################################################################################
## Project:         MaizeOmics
## Script purpose:  Import raw dataset files relevant to this project
##
## Output:
##        maize.walley.expression.raw
##        experiment.map
##        maize.walley.abundance.raw
##        experiment.map.proteins
##        maize.kaeppler.expression.raw
##
## Date: 2017-08-25
## Author: Jesse R. Walsh
####################################################################################################
library(readr)
library(readxl)

## Expression data from the Walley 2016 paper in FPKM for 23 tissues
maize.walley.expression.raw <- read_delim("./data-raw/walley2016/GSE50191_FPKM.tsv", "\t", trim_ws = TRUE)
experiment.map <- read_delim("./data-raw/walley2016/tracking_ids.csv", ",", trim_ws = TRUE)

## Protein data from the Walley 2016 paper in dNSAF for 33 tissues
maize.walley.abundance.raw <- read_xlsx("./data-raw/walley2016/aag1125_SupportingFile_Table_S2-1.xlsx", sheet = 3, col_names = TRUE)
experiment.map.proteins <- read_delim("./data-raw/walley2016/experiment_map_proteins.csv", ",", trim_ws = TRUE)

## Expression data from the Kaeppler 2015 paper in FPKM for 79 tissues
maize.kaeppler.expression.raw <- read_delim("./data-raw/kaeppler2015/Dataset S1.txt", "\t", trim_ws = TRUE)

#--------------------------------------------------------------------------------------------------#
detach("package:readr", unload=TRUE)
detach("package:readxl", unload=TRUE)
