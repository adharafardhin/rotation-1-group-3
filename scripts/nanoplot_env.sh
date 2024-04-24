#!/bin/bash

 

 

#SBATCH --job-name=software_install

#SBATCH --partition=hpc

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=1

#SBATCH --mem=8g

#SBATCH --time=02:00:00

#SBATCH --output=/shared/home/mbxdt3/slurm-%x-%j.out

 

 

#######################

# PREPARE ENVIRONMENT #

#######################

 

 

# load your bash profile (so you can use your conda install)

source $HOME/.bash_profile

 

 

# create conda environment with software install

conda create --name nanoplot -y -c conda-forge -c bioconda python==3.9

 

 

# enter your new conda environment

conda activate nanoplot

 

 

# Update pip, setuptools and wheel

pip install -U pip setuptools wheel

 

# Install nanoplot

pip install nanoplot

 

# install nanofilt

pip install nanofilt

 

 

# deactivate conda environment

conda deactivate
