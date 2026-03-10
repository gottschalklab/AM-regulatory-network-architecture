#!/bin/bash

#SBATCH -J contributions
#SBATCH --cluster=gpu
#SBATCH --partition=a100
#SBATCH -N 1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --gres=gpu:4
#SBATCH --mail-user=sok65@pitt.edu
#SBATCH --mail-type=FAIL
#SBATCH -t 71:00:00

module purge
module load gcc/8.2.0
module load python/anaconda3.10-2022.10
module load cuda/11.2.0
source activate /bgfs/rgottschalk/Sonia/envs/chrombpnet_env

cd /bgfs/rgottschalk/Sonia/chrombpnet_AM_GSE100738

mkdir RehmanData/fold0_contribution_scores

chrombpnet contribs_bw \
        -m chrombpnet_model_fold0/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveBasal_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold0_contribution_scores/fold0NB

mkdir RehmanData/fold1_contribution_scores

chrombpnet contribs_bw \
        -m chrombpnet_model_fold1/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveBasal_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold1_contribution_scores/fold1NB

mkdir RehmanData/fold2_contribution_scores

chrombpnet contribs_bw \
        -m chrombpnet_model_fold2/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveBasal_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold2_contribution_scores/fold2NB

mkdir RehmanData/fold3_contribution_scores

chrombpnet contribs_bw \
        -m chrombpnet_model_fold3/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveBasal_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold3_contribution_scores/fold3NB

mkdir RehmanData/fold4_contribution_scores

chrombpnet contribs_bw \
        -m chrombpnet_model_fold4/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveBasal_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold4_contribution_scores/fold4NB

chrombpnet contribs_bw \
        -m chrombpnet_model_fold0/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveInjury_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold0_contribution_scores/fold0NI

chrombpnet contribs_bw \
        -m chrombpnet_model_fold1/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveInjury_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold1_contribution_scores/fol14NI

chrombpnet contribs_bw \
        -m chrombpnet_model_fold2/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveInjury_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold2_contribution_scores/fold2NI

chrombpnet contribs_bw \
        -m chrombpnet_model_fold3/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveInjury_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold3_contribution_scores/fold3NI

chrombpnet contribs_bw \
        -m chrombpnet_model_fold4/models/chrombpnet_nobias.h5 \
        -r RehmanData/rehman_ATAC_NaiveInjury_no_blacklist.bed \
        -g data/mm10.fa \
        -c data/mm10.chrom.sizes \
        -op RehmanData/fold4_contribution_scores/fold4NI

crc-job-stats
