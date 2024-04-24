#!/bin/bash 
#SBATCH --job-name=prokka10
#SBATCH --partition=hpc 
#SBATCH --nodes=1   
#SBATCH --cpus-per-task=8 
#SBATCH --ntasks-per-node=1 
#SBATCH --mem=30g 
#SBATCH --time=24:00:00 
#SBATCH --output=/shared/home/mbxyw1/OandE/%x.out 
#SBATCH --error=/shared/home/mbxyw1/OandE/%x.err 

# These steps are required to activate Conda 
source $HOME/.bash_profile 
conda activate /shared/conda/shared

cd /workhere/students_2023/group3/2nd_longreads/result/10
prokka assembly.fasta --kingdom Archaea --outdir /workhere/students_2023/group3/prokka/10

conda deactivate

