#!/bin/bash 
#SBATCH --job-name=unihybrid
#SBATCH --partition=hpc 
#SBATCH --nodes=1   
#SBATCH --cpus-per-task=8 
#SBATCH --ntasks-per-node=1 
#SBATCH --mem=30g 
#SBATCH --time=48:00:00 
#SBATCH --output=/shared/home/mbxyw1/OandE/%x.out 
#SBATCH --error=/shared/home/mbxyw1/OandE/%x.err 

# These steps are required to activate Conda 
source $HOME/.bash_profile 
conda activate /shared/conda/shared/ 

cd /workhere/students_2023/group3/

unicycler --kmers 25,55,71 -t 8 -1 short_reads/H3931_S3_L001_R1_001.fastq.gz \
-2 short_reads/H3931_S3_L001_R2_001.fastq.gz -l barcode03/merged.fastq.gz \
-o assembly/unicycler/hybrid/

conda deactivate
