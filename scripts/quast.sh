#!/bin/bash 
#SBATCH --job-name=merged_quast
#SBATCH --partition=hpc 
#SBATCH --nodes=1   
#SBATCH --cpus-per-task=8 
#SBATCH --ntasks-per-node=1 
#SBATCH --mem=30g 
#SBATCH --time=24:00:00 
#SBATCH --output=/shared/home/mbxyw1/OandE/%x_%j.out 
#SBATCH --error=/shared/home/mbxyw1/OandE/%x_%j.err 

# These steps are required to activate Conda 
source $HOME/.bash_profile 
conda activate /shared/conda/shared/ 

cd /workhere/students_2023/group3
python /shared/conda/shared/bin/quast quast/all_assembles/minimap2_long.fasta quast/all_assembles/unicycler_hybrid.fasta \
quast/all_assembles/unicycler_long.fasta quast/all_assembles/unicycler_short_H3931_S3_L001.fasta \
-u -l "minimap2 long,unicycler hybrid,unicycler long,unicycler short (H3931_S3_L001)" -r reference/GCF_000025685.1/GCF_000025685.1_ASM2568v1_genomic.fna \
-g reference/GCF_000025685.1/genomic.gff \
-o quast/

conda deactivate

