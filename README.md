# LIFE4136 Rotation 1 Group 3
Welcome to the Github Repository dedicated to Rotation 1 of LIFE4136: Bioinformatics Group Research Project, of the MSc Bioinformatics at University of Nottingham 2023/2024. 

# Genome Assembly and Analysis Pipeline
This respository provides a comprehensive suite of scripts designed for the assembly and analysis of genomic data derived from both short-read (Illumina) and long-read (Nanopore) sequencing technologies. Our pipeline is crafted to support detailed exploration and modification of microbial genomes, making it possible to identify genetic modifications across various strains. Below you will find detailed instructions on how to deploy and utilize our pipeline, including descriptions of each script, their inputs and outputs, and the order in which to run them for optimal results.

## Workflow Overview
The pipeline includes multiple stages: Data preparation and quality control, Genome Assembly, Assembly Optimization, Quality Assessment, and Genomic Annotation. Below, each step is described with its associated scripts, inputs, and outputs.

### 1. Data Preparation and Quality Control
#### Merge Reads
- **Script**: `merge_reads.sh`
- **Objective**: Concatenates multiple FASTQ files from the same read direction into single files to simplify data handling.
- **Input**: `*R1_001.fastq.gz`, `*R2_001.fastq.gz` (all R1 and R2 read files in the directory)
- **Output**: `merged_R1.fastq.gz`, `merged_R2.fastq.gz`

#### Quality Control Setup
- **Script**: `nanoplot_env.sh`
- **Purpose**: Create a conda environment specifically for running NanoPlot, including installation of necessary packages.
- **Input**: No direct data input; sets up environment.
- **Output**: Conda environment ready for NanoPlot and NanoFilt.

#### Quality Control using Nanoplot
- **Script**: `plotQC.sh`
- **Objective**: Generate quality control plots using NanoPlot to assess sequencing data quality.
- **Input**: Merged FASTQ files (`*.fastq.gz`)
- **Output**: QC plot files in `../result/NanoPlot_QCresult/`

### 2. Genome Assembly
#### Long Read Assembly
- **Scripts**: `unicycler_long.sh`, `long03.sh`, `long09.sh`, `long10.sh`
- **Objective**: Assemble genomes using long-read Nanopore data for various barcodes.
- **Input**: `merged_long_*.fastq.gz` (merged long-read data for barcodes 03, 09, 10)
- **Output**: Genome assembly files in corresponding result directories (`/2nd_longreads/result/03/`, `/2nd_longreads/result/09/`, `/2nd_longreads/result/10/`)

#### Short Read Assembly
- **Script**: `unicycler_short.sh`
- **Objective**: Assemble genomes using short-read Illumina data.
- **Input**: `H3931_S3_L001_R1_001.fastq.gz`, `H3931_S3_L001_R2_001.fastq.gz`
- **Output**: Genome assembly files in `../result/unicycler/single_pair/`

#### Hybrid Assembly
- **Script**: `uni_hybrid.sh`
- **Objective**: Perform hybrid assemblies using both short and long reads.
- **Input**: Short reads (`H3931_S3_L001_R1_001.fastq.gz`, `H3931_S3_L001_R2_001.fastq.gz`), Long reads (`merged.fastq.gz`)
- **Output**: Hybrid assembly files in `assembly/unicycler/hybrid/`

### 3. Assembly Optimization and Refinement
#### Read Mapping and Unitig Assembly
- **Script**: `minimap2_test.sh`
- **Objective**: Quick assembly using Minimap2 and Miniasm for read overlaps and unitig generation.
- **Input**: `merged.fastq.gz` (merged long-read data)
- **Output**: Minimap and Miniasm output files in `../result/minimap2/`

### 4. Assembly Quality Assessment
#### QUAST Analysis
- **Script**: `quast.sh`
- **Objective**: Evaluate and compare the quality of different assemblies.
- **Input**: Assembled genomes (`minimap2_long.fasta`, `unicycler_hybrid.fasta`, etc.)
- **Output**: QUAST analysis reports in `quast/`
