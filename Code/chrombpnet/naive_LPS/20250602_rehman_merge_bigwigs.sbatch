#!/bin/bash
#SBATCH -J bigwig_merge
#SBATCH -N 1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100g
#SBATCH --mail-user=sok65@pitt.edu
#SBATCH --mail-type=FAIL
#SBATCH -t 0-10:00

module purge
module load gcc/8.2.0
module load python/anaconda3.10-2022.10
source activate /bgfs/rgottschalk/Sonia/envs/chrombpnet_env

cd /bgfs/rgottschalk/Sonia/chrombpnet_AM_GSE100738

#NaiveBasal count
#bigWigMerge RehmanData/fold0_contribution_scores/fold0NB.counts_scores.bw RehmanData/fold1_contribution_scores/fold1NB.counts_scores.bw RehmanData/fold2_contribution_scores/fold2NB.counts_scores.bw RehmanData/fold3_contribution_scores/fold3NB.counts_scores.bw RehmanData/fold4_contribution_scores/fold4NB.counts_scores.bw RehmanData/NB_counts_contribution_scores.bg

#bedSort RehmanData/NB_counts_contribution_scores.bg RehmanData/NB_counts_contribution_scores_sorted.bg

#bedGraphToBigWig RehmanData/NB_counts_contribution_scores_sorted.bg data/mm10.chrom.sizes RehmanData/NB_counts_contribution_scores.bw

#NaiveBasal profile
#bigWigMerge RehmanData/fold0_contribution_scores/fold0NB.profile_scores.bw RehmanData/fold1_contribution_scores/fold1NB.profile_scores.bw RehmanData/fold2_contribution_scores/fold2NB.profile_scores.bw RehmanData/fold3_contribution_scores/fold3NB.profile_scores.bw RehmanData/fold4_contribution_scores/fold4NB.profile_scores.bw RehmanData/NB_profile_contribution_scores.bg

#bedSort RehmanData/NB_profile_contribution_scores.bg RehmanData/NB_profile_contribution_scores_sorted.bg

#bedGraphToBigWig RehmanData/NB_profile_contribution_scores_sorted.bg data/mm10.chrom.sizes RehmanData/NB_profile_contribution_scores.bw

#NaiveInjury count
bigWigMerge RehmanData/fold0_contribution_scores/fold0NI.counts_scores.bw RehmanData/fold1_contribution_scores/fol14NI.counts_scores.bw RehmanData/fold2_contribution_scores/fold2NI.counts_scores.bw RehmanData/fold3_contribution_scores/fold3NI.counts_scores.bw RehmanData/fold4_contribution_scores/fold4NI.counts_scores.bw RehmanData/NI_counts_contribution_scores.bg

bedSort RehmanData/NI_counts_contribution_scores.bg RehmanData/NI_counts_contribution_scores_sorted.bg

bedGraphToBigWig RehmanData/NI_counts_contribution_scores_sorted.bg data/mm10.chrom.sizes RehmanData/NI_counts_contribution_scores.bw

#NaiveInjury profile
bigWigMerge RehmanData/fold0_contribution_scores/fold0NI.profile_scores.bw RehmanData/fold1_contribution_scores/fol14NI.profile_scores.bw RehmanData/fold2_contribution_scores/fold2NI.profile_scores.bw RehmanData/fold3_contribution_scores/fold3NI.profile_scores.bw RehmanData/fold4_contribution_scores/fold4NI.profile_scores.bw RehmanData/NI_profile_contribution_scores.bg

bedSort RehmanData/NI_profile_contribution_scores.bg RehmanData/NI_profile_contribution_scores_sorted.bg

bedGraphToBigWig RehmanData/NI_profile_contribution_scores_sorted.bg data/mm10.chrom.sizes RehmanData/NI_profile_contribution_scores.bw

crc-job-stats
