#!/bin/bash
#SBATCH --job-name=shortuni
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/workhere/students_2023/group3/result/unicycler/single_pair/%x.out
#SBATCH --error=/workhere/students_2023/group3/result/unicycler/single_pair/%x.err

source $HOME/.bash_profile
conda activate /shared/conda/shared/

cd /workhere/students_2023/group3/short_reads/

unicycler -1 H3931_S3_L001_R1_001.fastq.gz -2 H3931_S3_L001_R2_001.fastq.gz \
-o ../result/unicycler/single_pair

conda deactivate 

