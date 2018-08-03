#!/bin/bash

# Script for htseq-count
BAM=/home/vm2/projects/project_2018_libd/hisat_align/brain_a_v2_sorted.bam
REF=/home/vm2/projects/project_2018_libd/refs/Homo_sapiens.GRCh38.91.gtf
TSV=brain_a

mkdir -p $TSV
cd $TSV

htseq-count -f bam -r pos -m union -s no -t exon -i gene_id $BAM $REF > ${TSV}.tsv
