# Bulk_rna_seq
**Ulcerative Colitis Transcriptomic Meta-Analysis in Human samples- 339 Samples (UC_uninflammatory-276 vs Healthy-63)**
**Overview**
This study investigates transcriptional changes associated with Ulcerative Colitis (UC) by comparing gene expression profiles from intestinal biopsies of UC patients with those of healthy controls using publicly available bulk RNA-seq and microarray datasets from the GEO database.
The primary objective is to identify: Differentially expressed genes (DEGs), dysregulated biological pathways, inflammatory signaling signatures, and potential biomarkers associated with UC pathogenesis.The analysis integrates multiple independent datasets to improve the robustness and reproducibility of findings.
About Ulcerative Colitis (UC): Ulcerative Colitis is a chronic inflammatory bowel disease (IBD) characterized by persistent inflammation of the colon and rectum. Major pathological features include mucosal inflammation, epithelial barrier disruption, immune cell infiltration, cytokine dysregulation, and tissue ulceration.

**Datasets Used: The following GEO datasets were integrated in this study:**
GSE13734 -	Colon/intestinal transcriptomic profiling of UC and healthy samples
GSE158952	- Bulk transcriptomic dataset containing inflammatory bowel disease samples
GSE165512 -	RNA-seq dataset for UC-associated intestinal inflammation
GSE228122 - Intestinal biopsy transcriptome dataset including UC and controls
GSE81266 - Gene-expression profiling of ulcerative colitis tissues

**The workflow combines:**
Linux/bash-based RNA-seq preprocessing, R-based statistical analysis, pathway enrichment, PCA visualization, volcano plotting, and Reactome pathway analysis.
**1) Linux/bash - SRA Download, Quantification, Alignment, and Visualization**
This workflow describes the complete RNA-seq processing pipeline used for transcriptomic analysis of inflammatory ulcerative colitis samples compared to healthy controls. The pipeline includes downloading sequencing data from NCBI SRA, converting SRA files into FASTQ format, transcript quantification using Salmon (or genome alignment using STAR), BAM processing using Samtools, quality control using FastQC/MultiQC, and visualization using IGV. If required based on QC results, read trimming and adapter removal can be performed using Trimmomatic to remove low-quality reads and adapter contamination. After alignment, raw gene-count matrices can be generated using featureCounts or HTSeq-count for downstream differential expression analysis.
Additional preprocessing steps, such as rRNA contamination assessment using SortMeRNA, removal of contaminating reads using BBDuk, and evaluation of uniquely mapped reads (>60%) from STAR alignment statistics, are also recommended to ensure high-quality RNA-seq data analysis.
**2) R-based statistical analysis pathway enrichment, PCA visualization, Heatmaps, volcano plotting, and pathway analysis.**
R-based downstream analysis was performed to identify transcriptional alterations associated with ulcerative colitis and to explore the underlying inflammatory biological pathways. The workflow included preprocessing of raw count matrices, filtering of protein-coding genes, handling missing values, normalization, and batch-effect correction using limma. Principal Component Analysis (PCA) was used to evaluate sample clustering, dataset heterogeneity, and the effectiveness of batch correction. Differential gene-expression analysis was performed using limma, edgeR, and DESeq2 to identify significantly upregulated and downregulated genes between ulcerative colitis and healthy control samples. Heatmaps and correlation plots were generated to visualize expression patterns and sample relationships, while volcano plots were used to display significantly dysregulated genes based on fold-change and statistical significance. Functional enrichment and pathway analyses were conducted using Reactome, GSVA/GSEA, clusterProfiler, and related Bioconductor packages to identify activated inflammatory pathways, interferon signaling, immune-response programs, cytokine signaling, and epithelial dysfunction associated with ulcerative colitis pathology.

**Points to remember:**
1) DESeq2 should be used only with raw integer count data, whereas limma can be applied to both raw and normalized expression data (CPM, TPM, log2-transformed, median-normalized, etc.).
2) Metadata preparation is critical and should include correct sample IDs, conditions, and batch information before analysis. During batch correction, conditions represented by only one dataset/batch should generally be removed, since batch effects cannot be reliably separated from biological effects in such cases.
3) keep performing sanity checks
4) PCA plots help evaluate the presence of batch effects by showing how samples cluster before correction. They are also useful for assessing whether batch correction using the removeBatchEffect() function from limma successfully reduces technical variation while preserving biological grouping.

**Visualization**
Heatmaps and volcano plots were generated to visualize gene-expression patterns across samples and identify significantly upregulated and downregulated genes based on fold change and statistical significance.
GSEA (Gene Set Enrichment Analysis) identifies biologically enriched pathways using ranked gene-expression data, while GSVA (Gene Set Variation Analysis) estimates pathway activity scores at the individual sample level to study pathway-level expression variation across conditions.

**R packages**
* clusterProfiler was used for gene ontology, pathway enrichment, GSEA and biological interpretation of differentially expressed genes.
* org.Hs.eg.db provides human gene annotation mappings such as ENTREZ IDs, gene symbols and functional annotations required for enrichment analysis.
* enrichplot was used to visualize enrichment and pathway-analysis results through dot plots, enrichment plots and pathway-based graphical summaries.
* ggplot2 was used for generating publication-quality plots including PCA plots, volcano plots and pathway visualizations.
* tibble provides improved data-frame handling and cleaner tabular data manipulation within the tidyverse ecosystem.
* readr was used for efficient import and export of CSV and text-based datasets.
* ReactomePA was used for Reactome-based pathway enrichment and GSEA to identify inflammatory and immune-related signaling pathways associated with ulcerative colitis.
* limma was used for differential expression analysis, batch correction and statistical modeling of transcriptomic data.
* edgeR was used for normalization and analysis of count-based RNA-seq expression data.
* factoextra was used for PCA visualization and exploratory analysis of sample clustering patterns.
* ggplot2 was used to generate publication-quality plots including PCA, volcano and pathway-enrichment visualizations.
* ggrepel was used to add clear and non-overlapping gene labels in volcano and scatter plots.
* BiocParallel was used to manage and control parallel processing during computationally intensive analyses such as GSEA.
* DESeq2 was used for raw count-based differential gene-expression analysis using negative binomial statistical modeling.
* tidyverse was used for streamlined data manipulation, visualization and preprocessing workflows.
