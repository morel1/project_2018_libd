#!/bin/bash

set -e
THREADS=1
IFD=/home/vm2/projects/project_2018_libd/index/chr5
read -e -p 'Read file 1 directory: ' RF1
read -e -p 'Read file 2 directory: ' RF2
read -e -p 'Output base filename: ' OUTPUT
hisat2 -p $THREADS -x $IFD --dta -1 $RF1 -2 $RF2 | samtools view -bo /home/vm2/projects/project_2018_libd/hisat_align/${OUTPUT}.bam 
echo 'Complete'
