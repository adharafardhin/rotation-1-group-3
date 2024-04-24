# LIFE4136 Rotation 1 Group 3
Welcome to the Github Repository dedicated to Rotation 1 of LIFE4136: Bioinformatics Group Research Project, of the MSc Bioinformatics at University of Nottingham 2023/2024.

## Introduction
The problem we face in this project centers on the complex task of identifying and understanding genetic modifications in strains of a micro-organism whose genomes have been altered. These modifications are unknown in terms of their nature and location, posing significant challenges for genetic mapping and characterization. We are provided with a mixture of sequencing data, including short-read (Illumina) and long-read (Nanopore) data, which differ in their accuracy and coverage capabilities. The challenge lies in effectively using this data to assemble the genomes and pinpoint the genetic changes, thereby facilitating a deeper understanding of the biological functions these modifications may affect.

## Objectives of our study
The objective of our study is to develop a comprehensive bioinformatics pipeline that utilizes both short-read (Illumina) and long-read (Nanopore) sequencing data to assemble and analyze microbial genomes. By doing so, we aim to accurately identify and characterize genetic modifications in various strains of a micro-organism. These insights will enable us to determine the locations and functions of these genetic alterations, enhancing our understanding of microbial genetics and its implications for health, disease, and industrial applications. Through this project, we seek to streamline the genomic assembly process, improve the accuracy of genetic modification detection, and provide a robust toolset for researchers in the field of microbial genomics.

## Expected outcomes
The expected outcomes of our study are to accurately assemble and annotate the genomes of various genetically modified strains of a micro-organism, identifying precisely where and what changes have occurred at the genetic level. We aim to determine how these modifications impact the organism's biological functions, providing insights into potential alterations in metabolic pathways or resistance mechanisms. By effectively utilizing a combination of short-read and long-read sequencing data, the pipeline is expected to overcome common challenges associated with genomic assembly, such as resolving complex genomic regions and bridging gaps that single-method approaches might miss.

This project also result in a set of robust tools and protocols that can be adapted for similar genomic studies, enhancing our ability to tackle complex bioinformatics challenges in microbial genomics. Furthermore, documenting and sharing detailed findings through this repository will contribute to the broader scientific community, promoting further research and collaboration in the field of genetic engineering and microbial analysis.

# Prerequisites

## Files and Data required
- Short Reads: **Illumina** Data
- Long Reads: **Nanopore** Data

## Environment Setup

Before running the scripts in this repository, it's essential to set up a proper environment including Python and Miniconda. The setup instructions for the respective environment can be found as follows:

- Windows environment: [windows_env_setup](https://github.com/adharafardhin/rotation-1-group-3/blob/main/windows_env_setup.md) file
- Linux/MacOS environment: [linux_or_mac_env_setup](https://github.com/adharafardhin/rotation-1-group-3/blob/main/linux_or_mac_env_setup.md) file

## Tool versions and links

This project utilizes several key bioinformatics tools that are crucial for genome assembly and analysis. The following table lists these tools along with their versions and links to their official documentation or home pages.

| Tool Name  | Version | Link                                         |
|------------|---------|----------------------------------------------|
| Unicycler  | 0.5.0   | [Unicycler](https://github.com/rrwick/Unicycler) |
| NanoPlot   | 1.42.0  | [NanoPlot](https://github.com/wdecoster/NanoPlot) |
| QUAST      | 5.2.0   | [QUAST](http://quast.sourceforge.net/quast)   |
| BUSCO      | 5.7.1   | [BUSCO](https://busco.ezlab.org/)            |
| Prokka     | 1.14.6  | [Prokka](https://github.com/tseemann/prokka) |
| Minimap2   | 2.28    | [Minimap2](https://github.com/lh3/minimap2)  |

## Tools installation

A conda environment (named 'myenv' was already created during the environment setup). If not created yet, we can create a new conda environment using the following command:

```
conda create -n bioinfo_env python=3.8
conda activate bioinfo_env
```

### Install required tools using commands:

```
conda install -c bioconda unicycler=0.5.0
conda install -c bioconda nanoplot=1.42.0
conda install -c bioconda quast=5.2.0
conda install -c bioconda busco=5.7.1
conda install -c bioconda prokka=1.14.6
conda install -c bioconda minimap2=2.28
```

### Verify installation

```
unicycler --version
NanoPlot --help
quast --version
busco --version
prokka --version
minimap2 --version
```

Note: If any dependency related issues are faced during installation, the following code can be used and then the installation steps can be carried out again.

```
conda update conda
```

## Script Description

All the scripts can be found inside the scripts folder of this repository.

| Script Name             | Description                                                                                                  | Input                                        | Output                                       |
|-------------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------|----------------------------------------------|
| `merge_reads.sh`        | Merges multiple FASTQ files from the same read direction into single files to simplify data handling.        | `*R1_001.fastq.gz`, `*R2_001.fastq.gz`       | `merged_R1.fastq.gz`, `merged_R2.fastq.gz`   |
| `nanoplot_env.sh`      | Sets up a conda environment specifically for running NanoPlot, including necessary package installations.    | None                                         | Conda environment ready for NanoPlot         |
| `plotQC.sh`       | Generates quality control plots using NanoPlot to assess the quality of the sequencing data.                 | Merged FASTQ files (`*.fastq.gz`)            | QC plot files                                |
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

## License


## Authors
Group 3: 
- Adhara Fardhin Dhruba (mbxad11@nottingham.ac.uk)
- Deniz Totuk (mbxdt3@nottingham.ac.uk)
- Yuyun WU (mbxyw1@nottingham.ac.uk)

