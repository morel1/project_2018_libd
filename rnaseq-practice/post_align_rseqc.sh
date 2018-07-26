#!/bin/bash

# Using RSeQC tool to visualize the .bam files in a pdf output similar to Fastqc, but less interactive
# MAKE SURE THAT THE PYTHON SCRIPTS FROM RSEQC TOOLS ARE MADE INTO EXECUTABLE FILES BEFORE STARTING CAN BE DONE BY ENTERING "chmod +x script.py"
#Look over the RSeQC manuals to change options as needed

# Need to select a .bam file
read -e -p 'Select the .bam file directory: ' B_FILE
read -e -p 'Select the refernce .bed file directory: ' R_FILE
read -p 'Select output name tag: ' NM

# The process of producing different data visuals
bam_stat.py -i $B_FILE
clipping_profile.py -i $B_FILE -o $NM -s 'choose "PE" or "SE"'

# geneBody_coverage can have many inputs, but seperated by "," without a space
geneBody_coverage.py -r $R_FILE -i $B_FILE  -o $NM
infer_experiment.py -r $R_FILE -i $B_FILE
inner_distance.py -r $R_FILE -i $B_FILE -o $NM
junction_annotation.py -r $R_FILE -i $B_FILE -o $NM
junction_saturation.py -r $R_FILE -i $B_FILE -o $NM
read_distribution.py -r $R_FILE -i $B_FILE -o $NM
read_duplication.py -i $B_FILE -o $NM
read_GC.py -i $B_FILE -o $NM
read_NVC.py -i $B_FILE -o $NM
read_quality.py -i $B_FILE -o $NM

#Show what was made into pdfs
echo 'RSeQC Results'
ls *.pdf