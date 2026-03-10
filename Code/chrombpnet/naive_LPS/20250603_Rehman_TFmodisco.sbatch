#!/bin/bash

#SBATCH -J modisco
#SBATCH -N 1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --mail-user=sok65@pitt.edu
#SBATCH --mail-type=FAIL
#SBATCH -t 71:00:00

module purge
module load gcc/8.2.0
module load python/anaconda3.10-2022.10
module load cuda/11.2.0
source activate /bgfs/rgottschalk/Sonia/envs/chrombpnet_env

cd /bgfs/rgottschalk/Sonia/chrombpnet_AM_GSE100738

modisco motifs -i RehmanData/NB_counts_contribution_scores.h5 -n 1000000 -o RehmanData/modisco/NB_count_modisco_results.h5

modisco report -i RehmanData/modisco/NB_count_modisco_results.h5 -o RehmanData/modisco/NB_count_report/ -s RehmanData/modisco/NB_count_report/ -m data/JASPAR_motifname_fix.txt

modisco motifs -i RehmanData/NB_profile_contribution_scores.h5 -n 1000000 -o RehmanData/modisco/NB_profile_modisco_results.h5

modisco report -i RehmanData/modisco/NB_profile_modisco_results.h5 -o RehmanData/modisco/NB_profile_report/ -s RehmanData/modisco/NB_profile_report/ -m data/JASPAR_motifname_fix.txt


modisco motifs -i RehmanData/NI_counts_contribution_scores.h5 -n 1000000 -o RehmanData/modisco/NI_count_modisco_results.h5

modisco report -i RehmanData/modisco/NI_count_modisco_results.h5 -o RehmanData/modisco/NI_count_report/ -s RehmanData/modisco/NI_count_report/ -m data/JASPAR_motifname_fix.txt

modisco motifs -i RehmanData/NI_profile_contribution_scores.h5 -n 1000000 -o RehmanData/modisco/NI_profile_modisco_results.h5

modisco report -i RehmanData/modisco/NI_profile_modisco_results.h5 -o RehmanData/modisco/NI_profile_report/ -s RehmanData/modisco/NI_profile_report/ -m data/JASPAR_motifname_fix.txt

crc-job-stats
