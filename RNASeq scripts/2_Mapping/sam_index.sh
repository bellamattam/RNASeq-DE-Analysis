#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=sam_index
#SBATCH --mail-user=bella.mattam@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/bmattam/sam_index/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/bmattam/sam_index/error_%j.e
#SBATCH --array=0-5

SAMPLES=("$@")


module add UHTS/Analysis/samtools/1.10

SORTED_BAM_FILE=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sorted.bam

samtools index ${SORTED_BAM_FILE}

