#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=02:00:00
#SBATCH --job-name=FeatureCounts
#SBATCH --mail-user=bella.mattam@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/bmattam/featurecounts/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/bmattam/featurecounts/error_%j.e


ANNOTATION=/data/courses/rnaseq/toxoplasma_de/annotation/Mus_musculus.GRCm38.101.gtf
OUTPUT=/data/courses/rnaseq/toxoplasma_de/bmattam/featurecounts/featurecounts.txt
BAM_FILES=/data/courses/rnaseq/toxoplasma_de/mapping/*.sorted.bam


module add UHTS/Analysis/subread/2.0.1

featureCounts -p -s 2 -a $ANNOTATION -o $OUTPUT $BAM_FILES 
