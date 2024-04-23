# LIFE4136 Rotation 1 Group 3
Welcome to the Github Repository dedicated to Rotation 1 of LIFE4136: Bioinformatics Group Research Project, of the MSc Bioinformatics at University of Nottingham 2023/2024.

## What is the problem we have been presented with?
The problem we face in this project centers on the complex task of identifying and understanding genetic modifications in strains of a micro-organism whose genomes have been altered. These modifications are unknown in terms of their nature and location, posing significant challenges for genetic mapping and characterization. We are provided with a mixture of sequencing data, including short-read (Illumina) and long-read (Nanopore) data, which differ in their accuracy and coverage capabilities. The challenge lies in effectively using this data to assemble the genomes and pinpoint the genetic changes, thereby facilitating a deeper understanding of the biological functions these modifications may affect.

## What are the objectives of our study?

## What are the expected outcomes?

# Prerequisites
## Files and Data required
- Short Reads: Illumina Data
- Long Reads: Nanopore Data
## Tool versions and links

## Tools installation

## Script Description
| Script Name             | Description                                                                                                  | Input                                        | Output                                       |
|-------------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------|----------------------------------------------|
| `merge_reads.sh`        | Merges multiple FASTQ files from the same read direction into single files to simplify data handling.        | `*R1_001.fastq.gz`, `*R2_001.fastq.gz`       | `merged_R1.fastq.gz`, `merged_R2.fastq.gz`   |
| `mynanoplotenv.sh`      | Sets up a conda environment specifically for running NanoPlot, including necessary package installations.    | None                                         | Conda environment ready for NanoPlot         |
| `plotQC_yuyun.sh`       | Generates quality control plots using NanoPlot to assess the quality of the sequencing data.                 | Merged FASTQ files (`*.fastq.gz`)            | QC plot files                                |
| `unicycler_long.sh`     | Assembles genomes using long-read Nanopore data.                                                             | Merged long-read FASTQ files                 | Genome assembly files                        |
| `long03.sh`             | Similar to `unicycler_long.sh`, for specific barcode data.                                                   | Merged long-read FASTQ for barcode 03        | Genome assembly files for barcode 03         |
| `long09.sh`             | Similar to `unicycler_long.sh`, for specific barcode data.                                                   | Merged long-read FASTQ for barcode 09        | Genome assembly files for barcode 09         |
| `long10.sh`             | Similar to `unicycler_long.sh`, for specific barcode data.                                                   | Merged long-read FASTQ for barcode 10        | Genome assembly files for barcode 10         |
| `unicycler_short.sh`    | Assembles genomes using short-read Illumina data.                                                            | Paired-end Illumina FASTQ files              | Genome assembly files                        |
| `uni_hybrid.sh`         | Performs hybrid assemblies using both short and long reads.                                                  | Short and long-read FASTQ files              | Hybrid genome assembly files                 |
| `minimap2_test.sh`      | Uses Minimap2 and Miniasm for quick assembly of long reads, mapping reads onto themselves.                    | Merged long-read FASTQ file                  | Minimap and Miniasm output files             |
| `quast.sh`              | Evaluates the quality of various genome assemblies using QUAST.                                              | Assembled genome files                       | QUAST analysis reports                       |
| `busco.sh`              | Assesses the completeness of genome assemblies using BUSCO.                                                  | Assembled genome FASTA files                 | BUSCO analysis reports                       |
| `prokka_test.sh`        | Annotates the assembled genomes to identify genes and other features using Prokka.                           | Assembled genome FASTA file                  | Annotation files                             |


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

#### BUSCO Analysis
- **Script**: `busco.sh`
- **Objective**: Assess the completeness of the assemblies using BUSCO.
- **Input**: Fasta files of assemblies (`*.fasta`)
- **Output**: BUSCO reports in `../../busco/`

### 5. Genomic Annotation
#### Prokka Annotation
- **Script**: `prokka_test.sh`
- **Objective**: Annotate the assembled genomes to identify genes and other features.
- **Input**: `assembly.fasta`
- **Output**: Annotation files in `/workhere/students_2023/group3/prokka/10`

## Usage

To run each script, ensure that the SLURM job scheduler is used with the provided settings. Modify paths and parameters as necessary to fit your computational environment.

## Requirements

This pipeline requires a high-performance computing environment with SLURM, access to Conda environments, and installed bioinformatics tools such as Unicycler, Prokka, QUAST, BUSCO, and NanoPlot.

## License


## Authors
Group 3: 
- Adhara Fardhin Dhruba
- Deniz Totuk
- Yuyun 

