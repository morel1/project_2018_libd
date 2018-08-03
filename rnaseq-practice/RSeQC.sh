#!/bin/bash

# Script to run all RSeQC and have output into single directory
# Assumes RSeQC is in path or used "pip install RSeQC"
set -e
# Choosing input files
BAM=/home/vm2/projects/project_2018_libd/hisat_align/brain_a_v2_sorted.bam
OTNM=brain_a
REF=/home/vm2/projects/project_2018_libd/refs/hg38_GENCODE_v24_basic.bed
mkdir -p ${OTNM}_RSeQC
cd ${OTNM}_RSeQC

# RSeQC
echo 'bam_stat'
bam_stat.py -i $BAM
echo 'clipping'
clipping_profile.py -i $BAM -s PE -o $OTNM
echo 'genebodycoverage'
geneBody_coverage.py -r $REF -i $BAM -o $OTNM
echo 'infer_exp'
infer_experiment.py -r $REF -i $BAM
echo 'in_dist'
inner_distance.py -r $REF -i $BAM -o $OTNM
echo 'junc_annot'
junction_annotation.py -r $REF -i $BAM -o $OTNM
echo 'junc_sat'
junction_saturation.py -r $REF -i $BAM -o $OTNM
echo 'read_dist'
read_distribution.py -r $REF -i $BAM
echo 'read_dup'
read_duplication.py -i $BAM -o $OTNM
echo 'read_gc'
read_GC.py -i $BAM -o $OTNM
echo 'read_NVC'
read_NVC.py -i $BAM -o $OTNM
echo 'read_quality'
read_quality.py -i $BAM -o $OTNM
echo 'Complete'
ls *.pdf
