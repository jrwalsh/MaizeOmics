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
##        maize.walley.v4mapped.expression.SRR957{415-482}.raw
##        SRA.accessions
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

## Expression data from the Walley 2016 paper remapped to the B73 v4.37 assembly
maize.walley.v4mapped.expression.SRR957415.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957415", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957416.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957416", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957417.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957417", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957418.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957418", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957419.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957419", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957420.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957420", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957421.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957421", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957422.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957422", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957423.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957423", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957424.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957424", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957425.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957425", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957426.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957426", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957427.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957427", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957428.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957428", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957429.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957429", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957430.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957430", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957431.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957431", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957432.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957432", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957433.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957433", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957434.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957434", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957435.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957435", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957436.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957436", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957437.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957437", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957438.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957438", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957439.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957439", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957440.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957440", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957441.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957441", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957442.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957442", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957443.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957443", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957444.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957444", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957445.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957445", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957446.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957446", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957447.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957447", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957448.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957448", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957449.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957449", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957450.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957450", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957451.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957451", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957452.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957452", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957453.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957453", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957454.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957454", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957455.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957455", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957456.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957456", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957457.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957457", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957458.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957458", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957459.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957459", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957460.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957460", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957461.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957461", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957462.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957462", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957463.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957463", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957464.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957464", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957465.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957465", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957466.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957466", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957467.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957467", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957468.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957468", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957469.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957469", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957470.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957470", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957471.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957471", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957472.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957472", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957473.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957473", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957474.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957474", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957475.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957475", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957476.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957476", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957477.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957477", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957478.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957478", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957479.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957479", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957480.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957480", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957481.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957481", "\t", escape_double = FALSE, trim_ws = TRUE)
maize.walley.v4mapped.expression.SRR957482.raw <- read_delim("data-raw/walley2016_mapped_v4/cufflinks_fpkm/genes.fpkm_tracking.SRR957482", "\t", escape_double = FALSE, trim_ws = TRUE)
SRA.accessions <- read_delim("./data-raw/walley2016_mapped_v4/map_SRA_accessions.txt", "\t", trim_ws = TRUE)


#--------------------------------------------------------------------------------------------------#
detach("package:readr", unload=TRUE)
detach("package:readxl", unload=TRUE)
