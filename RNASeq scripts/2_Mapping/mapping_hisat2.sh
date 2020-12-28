#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8000M
#SBATCH --time=02:00:00
#SBATCH --job-name=hisat2_mapping
#SBATCH --mail-user=bella.mattam@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/error_%j.e


# Sample names as arguments
sample=$1

read_1=/data/courses/rnaseq/toxoplasma_de/reads/${sample}_1.fastq.gz
read_2=/data/courses/rnaseq/toxoplasma_de/reads/${sample}_2.fastq.gz

HT2_INDEX_BASE=/data/courses/rnaseq/toxoplasma_de/bmattam/index_hisat2/Mus_musculus.GRCm38

OUT_DIR=/data/courses/rnaseq/toxoplasma_de/bmattam/map_hisat2/

module add UHTS/Aligner/hisat/2.2.1

# Map reads to reference genome (paired-end)
hisat2 -p 4 --rna-strandness RF -x ${HT2_INDEX_BASE} -1 ${read_1} -2 ${read_2} -S ${OUT_DIR}${sample}.sam

