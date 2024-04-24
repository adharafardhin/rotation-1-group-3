#!/bin/bash
#SBATCH --job-name=longuni10
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/workhere/students_2023/group3/2nd_longreads/result/10/%x.out
#SBATCH --error=/workhere/students_2023/group3/2nd_longreads/result/10/%x.err

source $HOME/.bash_profile
conda activate /shared/conda/shared/

cd /workhere/students_2023/group3/2nd_longreads/barcode10

unicycler -l merged_long_10.fastq.gz -o /workhere/students_2023/group3/2nd_longreads/result/10/

conda deactivate
