#!/bin/bash

# This script is for the purpose of using featureCounts to analyze post alignment data
# Assumes that featurCounts is added to path

# Paths to gtf and fa files
GTF=/home/vm2/projects/project_2018_libd/refs/Homo_sapiens.GRCh38.91.gtf.gz
FA=/home/vm2/projects/project_2018_libd/refs/Homo_sapiens.GRCh38.dna.chromosome.5.fa
read -e -p 'bam file directory: ' IBAM

# Set Outputs
read -p 'Name of output: ' ONM

featureCounts --verbose -s 0 -R BAM -a $GTF -G $FA -o $ONM $IBAM
