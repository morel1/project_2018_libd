#!/bin/bash

# Script written to run stringtie
# Set the working directory
OTNM=brain_a
mkdir -p ${OTNM}_stringtie
cd ${OTNM}_stringtie

# Inputs
BAM=/home/vm2/projects/project_2018_libd/hisat_align/brain_a_v2_sorted.bam
REF=/home/vm2/projects/project_2018_libd/refs/Homo_sapiens.GRCh38.91.gtf
THD=1

# Stringtie command (maintain verbose)
stringtie -v -p $THD -G $REF -B -o ${OTNM}_transcripts.gtf -A ${OTNM}_gene_abundance.tsv $BAM
