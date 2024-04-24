#!/bin/bash
#SBATCH --job-name=merge
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=2g
#SBATCH --time=02:00:00
#SBATCH --output=/workhere/students_2023/group3/short_reads/%x.out
#SBATCH --error=/workhere/students_2023/group3/short_reads/%x.err

# merge compressed files
cd /workhere/students_2023/group3/short_reads/
cat *R1_001.fastq.gz > merged_R1.fastq.gz
cat *R2_001.fastq.gz > merged_R2.fastq.gz
