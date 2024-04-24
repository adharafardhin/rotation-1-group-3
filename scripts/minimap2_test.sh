#!/bin/bash
#SBATCH --job-name=mini
#SBATCH --partition=hpc
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --mem=20g
#SBATCH --time=24:00:00
#SBATCH --output=/workhere/students_2023/group3/result/minimap2/%x.out
#SBATCH --error=/workhere/students_2023/group3/result/minimap2/%x.err

source $HOME/.bash_profile
conda activate /shared/conda/shared/

cd /workhere/students_2023/group3/barcode03/

# map the reads onto themselves and compress the output
minimap2 -x ava-ont merged.fastq.gz merged.fastq.gz | gzip -1 > ../result/minimap2/minimap.paf.gz

# assemble unitigs
miniasm -f merged.fastq.gz ../result/minimap2/minimap.paf.gz > ../result/minimap2/miniasm.gfa

cd ../result/minimap2/

# convert to fasta format
awk '/^S/{print ">"$2"\n"$3}' miniasm.gfa > miniasm.fasta

conda deactivate 

