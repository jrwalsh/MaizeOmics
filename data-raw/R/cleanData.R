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
## Output:
##        maize.walley.expression.clean
##        maize.kaeppler.expression.clean
##        maize.genes.v3_to_v4_map.clean
##        maize.walley.abundance.clean
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
## maize.genes.v3_to_v4_map.raw
#--------------------------------------------------------------------------------------------------#
maize.genes.v3_to_v4_map.clean <- maize.genes.v3_to_v4_map.raw

maize.genes.v3_to_v4_map.clean <-
  maize.genes.v3_to_v4_map.clean %>%
  rename(v3_id = `v3 gene ID`, v4_id = `v4 gene ID (if present)`) %>%
  select(v3_id, v4_id)

maize.genes.v3_to_v4_map.clean$v3_id[maize.genes.v3_to_v4_map.clean$v3_id == "na"] <- NA
maize.genes.v3_to_v4_map.clean$v4_id[maize.genes.v3_to_v4_map.clean$v4_id == "na"] <- NA

maize.genes.v3_to_v4_map.clean$v3_id[startsWith(maize.genes.v3_to_v4_map.clean$v3_id, "AF")] <- NA
maize.genes.v3_to_v4_map.clean$v3_id[startsWith(maize.genes.v3_to_v4_map.clean$v3_id, "AY")] <- NA
maize.genes.v3_to_v4_map.clean$v3_id[startsWith(maize.genes.v3_to_v4_map.clean$v3_id, "EF")] <- NA
maize.genes.v3_to_v4_map.clean$v3_id[startsWith(maize.genes.v3_to_v4_map.clean$v3_id, "zma")] <- NA
maize.genes.v3_to_v4_map.clean$v4_id[startsWith(maize.genes.v3_to_v4_map.clean$v4_id, "zma")] <- NA
maize.genes.v3_to_v4_map.clean$v4_id[maize.genes.v3_to_v4_map.clean$v4_id == "not in v4"] <- NA

maize.genes.v3_to_v4_map.clean <-
  maize.genes.v3_to_v4_map.clean %>%
  filter(!is.na(v3_id) & !is.na(v4_id))

#--------------------------------------------------------------------------------------------------#
detach("package:tidyr", unload=TRUE)
detach("package:dplyr", unload=TRUE)
