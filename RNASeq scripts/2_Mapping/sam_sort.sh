#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=25000M
#SBATCH --time=01:00:00
#SBATCH --job-name=sam_sort
#SBATCH --mail-user=bella.mattam@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/bmattam/sam_sort/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/bmattam/sam_sort/error_%j.e
#SBATCH --array=0-5

SAMPLES=("$@")


module add UHTS/Analysis/samtools/1.10


BAM_FILE=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.bam

SORTED_BAM_FILE=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sorted.bam

samtools sort -m 25000M -@ 4 -o ${SORTED_BAM_FILE} -T temp ${BAM_FILE}


