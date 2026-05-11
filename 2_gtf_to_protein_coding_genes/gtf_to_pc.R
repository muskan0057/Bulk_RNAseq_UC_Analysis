library(rtracklayer)
library(dplyr)
library(stringr)

# Load GTF file
gtf <- import("E:/seq_bulk/gencode.v49.annotation.gtf/gencode.v49.annotation.gtf")

# Convert to data frame
gtf_df <- as.data.frame(gtf)

# Filter only transcript entries (ENST level)
gtf_transcripts <- gtf_df %>%
  filter(type == "transcript")

# Extract required columns
result <- gtf_transcripts %>%
  
  dplyr::select(
    gene_id,
    gene_name,
    gene_type,
    transcript_id
  ) %>%
  
  distinct()
# View
head(result)

# Save file
write.csv(result, "gene_transcript_biotype.csv", row.names = FALSE)
# Read your file
df <- read.csv("E:/seq_bulk/gene_transcript_biotype.csv")

# Filter protein coding
protein_coding_df <- df[df$gene_type == "protein_coding", ]

# Save new file
write.csv(protein_coding_df,
          "E:/seq_bulk/protein_coding_genes.csv",
          row.names = FALSE)

# Check
head(protein_coding_df)
library(dplyr)

clean_df <- protein_coding_df %>%
  dplyr::select(-transcript_id) %>%              # remove ENST column
  distinct(gene_id, .keep_all = TRUE)     # keep unique gene_id

# View
head(clean_df)

# Save
write.csv(clean_df,
          "E:/seq_bulk/protein_coding_unique_genes.csv",
          row.names = FALSE)