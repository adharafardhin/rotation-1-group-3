#!/bin/bash
#SBATCH --job-name=Nanoplot
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=4g
#SBATCH --time=02:00:00
#SBATCH --output=/workhere/students_2023/group3/result/NanoPlot_QCresult/%x.out
#SBATCH --error=/workhere/students_2023/group3/result/NanoPlot_QCresult/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/conda/shared

# Run NanoPlot
cd /workhere/students_2023/group3/barcode03
NanoPlot -t 2 --maxlength 40000 --fastq *.fastq.gz --outdir ../result/NanoPlot_QCresult/

conda deactivate
