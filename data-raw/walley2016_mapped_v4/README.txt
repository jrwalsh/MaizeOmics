PROTOCOL.txt is a summary of the tools used to align the SRA data to B73v4.

Trimmomatic_logs contains a summary of the output logs for all 68 runs of trimmomatic as defined in the Protocol document,
combined into a single spreadsheet.

STAR_logs contains output log for all 68 runs of STAR as defined in the Protocol document.

cufflinks_fpkm contains FPKM count output for all 68 runs of cufflinks as defined in the Protocol document.

Log.final.out.combined.tab is the combined output logs for all 68 STAR runs merged into a single spreadsheet and formatted
for easy import and analysis in R.

Comparison of trimmed vs untrimmed read mapping.tab is an excel analysis of the improvement to %Unique mapped reads due
to trimming adapter sequences.  Note the loss of total unique reads as a result of throwing out reads that previously mapped.

map_SRA_accessions is a mapping file to link SRA accessions to the tissues used in the experiment.