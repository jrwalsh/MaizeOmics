####################################################################################################
## Project:         MaizeOmics
## Script purpose:  Convert identifiers, average replicates, export datasets.
##
## Output:
##        maize.walley.expression.replicate
##        maize.walley.expression
##        maize.walley.abundance
##        maize.kaeppler.expression.replicate
##        maize.kaeppler.expression
##
## Date: 2017-09-14
## Author: Jesse R. Walsh
####################################################################################################
source("./data-raw/R/loadData.R")
source("./data-raw/R/cleanData.R")
library(tidyr)
library(dplyr)

#==================================================================================================#
## maize.walley.expression.replicate
#--------------------------------------------------------------------------------------------------#
maize.walley.expression.replicate <- maize.walley.expression.clean

## Convert to v4 ids
maize.walley.expression.replicate <-
  maize.walley.expression.replicate %>%
  inner_join(maize.genes.v3_to_v4_map.clean, by=c("tracking_id" = "v3_id")) %>%
  rename(geneID=v4_id)

## Reorder columns
maize.walley.expression.replicate <- maize.walley.expression.replicate[,c(70,2:69)]

## Merge duplicate rows by adding FPKM values together
maize.walley.expression.replicate <-
  maize.walley.expression.replicate %>%
  group_by(geneID) %>%
  summarise_all(funs(sum))

#==================================================================================================#
## maize.walley.expression
#--------------------------------------------------------------------------------------------------#
maize.walley.expression <- maize.walley.expression.clean

## Convert to v4 ids
maize.walley.expression <-
  maize.walley.expression %>%
  inner_join(maize.genes.v3_to_v4_map.clean, by=c("tracking_id" = "v3_id")) %>%
  rename(geneID=v4_id)

## Reorder columns
maize.walley.expression <- maize.walley.expression[,c(70,2:69)]

## convert to sample names, merge replicates in each sample using mean, and output in long form
maize.walley.expression <-
  maize.walley.expression %>%
  gather("tracking_id", "FPKM",-1) %>%
  left_join(experiment.map, by=c("tracking_id"="tracking_id")) %>%
  select(geneID, Sample, FPKM) %>%
  group_by(geneID, Sample) %>%
  summarise(FPKM_avg=mean(FPKM, na.rm=TRUE)) %>%
  arrange(geneID)

## When all replicates have NA, mean returns NaN.  Convert it back to NA.
maize.walley.expression$FPKM_avg[is.nan(maize.walley.expression$FPKM_avg)] <- NA

#==================================================================================================#
## maize.walley.abundance
#--------------------------------------------------------------------------------------------------#
maize.walley.abundance <- maize.walley.abundance.clean

## Convert to v4 ids
maize.walley.abundance <-
  maize.walley.abundance %>%
  inner_join(maize.genes.v3_to_v4_map.clean, by=c("v3_id" = "v3_id")) %>%
  rename(geneID=v4_id)

## Reorder columns
maize.walley.abundance <- maize.walley.abundance[,c(length(maize.walley.abundance),3:length(maize.walley.abundance)-1)]

## Reduce columns to only the ones comparable to expression data
colsToKeep <- colnames(maize.walley.abundance) %in% c("geneID",experiment.map.proteins$Replicate[!is.na(experiment.map.proteins$ExpressionSampleName)])
maize.walley.abundance <- maize.walley.abundance[,colsToKeep]

## convert to sample names using the same terms used in expression set, merge replicates in each sample using mean, and output in long form
maize.walley.abundance <-
  maize.walley.abundance %>%
  gather("Replicate", "dNSAF",-1) %>%
  left_join(experiment.map.proteins, by=c("Replicate"="Replicate")) %>%
  select(geneID, ExpressionSampleName, dNSAF) %>%
  group_by(geneID, ExpressionSampleName) %>%
  summarise(dNSAF_avg=mean(dNSAF, na.rm=TRUE)) %>%
  rename(Sample=ExpressionSampleName) %>%
  arrange(geneID)

## When all replicates have NA, mean returns NaN.  Convert it back to NA.
maize.walley.abundance$dNSAF_avg[is.nan(maize.walley.abundance$dNSAF_avg)] <- NA


#==================================================================================================#
## maize.kaeppler.expression.replicate
#--------------------------------------------------------------------------------------------------#
maize.kaeppler.expression.replicate <- maize.kaeppler.expression.clean

## Convert to v4 ids
maize.kaeppler.expression.replicate <-
  maize.kaeppler.expression.replicate %>%
  inner_join(maize.genes.v3_to_v4_map.clean, by=c("Maize_AGPv2_gene" = "v3_id")) %>%
  rename(geneID=v4_id)

## Reorder columns
maize.kaeppler.expression.replicate <- maize.kaeppler.expression.replicate[,c(81,2:80)]

## Merge duplicate rows by adding FPKM values together
maize.kaeppler.expression.replicate <-
  maize.kaeppler.expression.replicate %>%
  group_by(geneID) %>%
  summarise_all(funs(sum))

#==================================================================================================#
## maize.kaeppler.expression
#--------------------------------------------------------------------------------------------------#
maize.kaeppler.expression <- maize.kaeppler.expression.clean

## Convert to v4 ids
maize.kaeppler.expression <-
  maize.kaeppler.expression %>%
  inner_join(maize.genes.v3_to_v4_map.clean, by=c("Maize_AGPv2_gene" = "v3_id")) %>%
  rename(geneID=v4_id)

## Reorder columns
maize.kaeppler.expression <- maize.kaeppler.expression[,c(81,2:80)]

## Output in long form
maize.kaeppler.expression <-
  maize.kaeppler.expression %>%
  gather("Sample", "FPKM",-1) %>%
  group_by(geneID, Sample) %>%
  summarise(FPKM_avg=mean(FPKM, na.rm=TRUE)) %>%
  arrange(geneID)

#==================================================================================================#
## Save the output to /data
#--------------------------------------------------------------------------------------------------#
devtools::use_data(maize.walley.expression.replicate, overwrite = TRUE)
devtools::use_data(maize.walley.expression, overwrite = TRUE)
devtools::use_data(maize.walley.abundance, overwrite = TRUE)
devtools::use_data(maize.kaeppler.expression.replicate, overwrite = TRUE)
devtools::use_data(maize.kaeppler.expression, overwrite = TRUE)

devtools::document(roclets=c('rd', 'collate', 'namespace'))

#--------------------------------------------------------------------------------------------------#
detach("package:tidyr", unload=TRUE)
detach("package:dplyr", unload=TRUE)
