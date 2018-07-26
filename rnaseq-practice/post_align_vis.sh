#!/bin/bash

# This script is for alignment visualization

# Index the .bam files to create .bam.bai
read -e -p 'Select directory to folder containing .bam files (DO NOT SELECT .BAM FILE): ' BDIR
cd $BDIR
find *bam -exec echo samtools index {} \; | sh
echo 'INDEXED: now ready for IGV visualization'
# Can now use the IGV tool to visualize the .bam files

# Setting up for bam-readcount
cd ..
mkdir bam_readcount
cd bam_readcount
read -e -p 'Select file directory for reference fasta: ' REF_FASTA
samtools faidx $REF_FASTA
echo 'FAIDX COMPLETE'

# Then run mpileup tool to check for variance in a region
# Edit as needed (can have multiple bam files)
read -p 'Select region of interest (ex. chr:start-end): ' RI
samtools mpileup -f $REF_FASTA -r $RI path/to/file.bam
echo 'MPILEUP COMPLETE'

# The bam-readcount cheching variant position
read -p 'Select region of interest (ex. chr start end): ' SNVS
read -p 'Select .bam file directory: ' BFILE
read -p 'Select name on bam-readcount file: ' NM
$SNVS > snvs.bed
bam-readcount -l snvs.bed -f $RNA_FASTA $BFILE 2>/dev/null 1>"$NM"_bamreadcount.txt

# Parse the readcounts for each base
cat "$NM"_bamreadcount.txt | perl -ne '@data=split("\t", $_); @Adata=split(":", $data[5]); @Cdata=split(":", $data[6]); @Gdata=split(":", $data[7]); @Tdata=split(":", $data[8]); print "UHR Counts\t$data[0]\t$data[1]\tA: $Adata[1]\tC: $Cdata[1]\tT: $Tdata[1]\tG: $Gdata[1]\n";'
