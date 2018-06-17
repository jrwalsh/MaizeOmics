####################################################################################################
## Project:         MaizeOmics
## Script purpose:  Clean up raw datafiles needed for this project, including renaming column and
##        selecting relevant columns, handling missing data and incomplete rows, and any global
##        conversions or modification to data to make it usable.
##
## Input:
##        maize.walley.expression.raw
##        maize.kaeppler.expression.raw
##        maize.genes.v3_to_v4_map.raw
##        maize.walley.abundance.raw
##        maize.walley.v4mapped.expression.SRR957{415-482}.raw
## Output:
##        maize.walley.expression.clean
##        maize.kaeppler.expression.clean
##        maize.genes.v3_to_v4_map.clean
##        maize.walley.abundance.clean
##        maize.walley.v4mapped.expression.clean
##
## Date: 2017-08-25
## Author: Jesse R. Walsh
####################################################################################################
library(tidyr)
library(dplyr)

#==================================================================================================#
## maize.walley.expression.raw
#--------------------------------------------------------------------------------------------------#
maize.walley.expression.clean <- maize.walley.expression.raw

## Remove low FPKM values
maize.walley.expression.clean[maize.walley.expression.clean < 1] <- NA

#==================================================================================================#
## maize.walley.abundance.raw
#--------------------------------------------------------------------------------------------------#
maize.walley.abundance.clean <- maize.walley.abundance.raw

## Rename the gene id column
maize.walley.abundance.clean <-
  maize.walley.abundance.clean %>%
  rename(v3_id=X__1)

## Remove low dNSAF values
maize.walley.abundance.clean[maize.walley.abundance.clean < 1] <- NA

#==================================================================================================#
## maize.kaeppler.expression.raw
#--------------------------------------------------------------------------------------------------#
maize.kaeppler.expression.clean <- maize.kaeppler.expression.raw

## Select relevant columns (i.e. get rid of chromosome position columns)
maize.kaeppler.expression.clean <-
  maize.kaeppler.expression.clean %>%
  select(-chromosome, -position_left, -position_right)

## Remove low FPKM values
maize.kaeppler.expression.clean[maize.kaeppler.expression.clean < 1] <- NA

#==================================================================================================#
## maize.walley.v4mapped.expression.clean
#--------------------------------------------------------------------------------------------------#
## Merge FPKM column from all 68 samples.  Only keep tracking_id's for v4 genes (Zm#s) with an FPKM status of "OK".
## Sometimes the same gene is listed multiple times in the FPKM file, so just sum the two counts together.  If we don't, the
## full joins go crazy and overload the memory.
maize.walley.v4mapped.expression.clean <-
  maize.walley.v4mapped.expression.SRR957482.raw %>%
  subset(FPKM_status == "OK" & startsWith(tracking_id, "Zm")) %>%
  select(tracking_id, FPKM) %>%
  rename(geneID = tracking_id, SRR957482 = FPKM) %>%
  group_by(geneID) %>%
  summarise_all(funs())

for (id in seq(482, 415)) {
  maize.walley.v4mapped.expression.clean <-
    get(paste0("maize.walley.v4mapped.expression.SRR957", id, ".raw")) %>%
    subset(FPKM_status == "OK" & startsWith(tracking_id, "Zm")) %>%
    select(tracking_id, FPKM) %>%
    setNames(c("geneID", paste0("SRR957", id))) %>%
    group_by(geneID) %>%
    summarise_all(funs(sum)) %>%
    full_join(maize.walley.v4mapped.expression.clean, by=c("geneID" = "geneID"))
}

## Remove low FPKM values
maize.walley.v4mapped.expression.clean[maize.walley.v4mapped.expression.clean < 1] <- NA

#--------------------------------------------------------------------------------------------------#
detach("package:tidyr", unload=TRUE)
detach("package:dplyr", unload=TRUE)
