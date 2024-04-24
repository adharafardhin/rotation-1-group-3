#!/bin/bash
#SBATCH --job-name=longuni
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/workhere/students_2023/group3/result/unicycler/long/%x.out
#SBATCH --error=/workhere/students_2023/group3/result/unicycler/long/%x.err

source $HOME/.bash_profile
conda activate /shared/conda/shared/

cd /workhere/students_2023/group3/barcode03/

unicycler -l merged.fastq.gz -o ../result/unicycler/long/

conda deactivate
