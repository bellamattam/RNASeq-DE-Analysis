#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=samtools_view
#SBATCH --mail-user=bella.mattam@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/bmattam/sam_view/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/bmattam/sam_view/error_%j.e
#SBATCH --array=0-4

# Sample names passed as arguments stored here
SAMPLES=("$@")

# Convert sam files to bam format
module add UHTS/Analysis/samtools/1.10

SAM_FILE=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sam
BAM_FILE=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.bam

samtools view -hbS ${SAM_FILE} > ${BAM_FILE}

