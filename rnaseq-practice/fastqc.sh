#!/bin/bash

# Script to run fastqc on all files within a directory
# Found at https://www.biostars.org/p/322842/
# Used by running fastqc.sh path/to/fastq
RUN_PATH=$1
cd $RUN_PATH
for file in $(ls $RUN_PATH)
do
    SAMPLE=`basename $file`
    fastqc ${SAMPLE} -o /home/vm2/projects/project_2018_libd/fastqc_output
done
