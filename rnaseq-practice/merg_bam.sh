#!/bin/bash

# This script is to merge the .bam files created after alignment
# Make sure to have Java installed onto path

# Select files
read -e -p 'Select output file directory: ' OTDIR

# Merging files (To include more files jut add 'INPUT=next_file.bam'
java -Xmx2g -jar picard.jar MergeSamFiles OUTPUT=$OTDIR INPUT=example_file.bam