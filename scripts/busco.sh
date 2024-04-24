#!/bin/bash
#SBATCH --job-name=busco
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8 
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/home/mbxyw1/OandE/%x.out
#SBATCH --error=/shared/home/mbxyw1/OandE/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/conda/busco

# Run BUSCO
cd /workhere/students_2023/group3/quast/all_assembles/
for fa in *.fasta; do busco -f -i $fa -m genome -l archaea_odb10 -o ../../busco/BUSCO_${fa%.fasta} ; done

conda deactivate
