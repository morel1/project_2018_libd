#!/bin/bash

set -e
THREADS=1
IFD=/home/vm2/projects/project_2018_libd/index/chr5
read -e -p 'Read file 1 directory: ' RF1
read -e -p 'Read file 2 directory: ' RF2
read -e -p 'Output base filename: ' OUTPUT
echo
echo
echo 'creating .sam file'
hisat2 -p $THREADS -v --dta --time --rna-strandness RF -x $IFD -1 $RF1 -2 $RF2 -S /home/vm2/projects/project_2018_libd/hisat_align/${OUTPUT}.sam
echo 'Completed hisat2 .samfile creation'
echo
echo 'creating bam file'
samtools view -@ $THREADS -bS /home/vm2/projects/project_2018_libd/hisat_align/${OUTPUT}.sam > /home/vm2/projects/project_2018_libd/hisat_align/${OUTPUT}.bam
echo 'Created .bam file'
echo
echo 'creating sorted bam file'
samtools sort -@ $THREADS /home/vm2/projects/project_2018_libd/hisat_align/${OUTPUT}.bam -o /home/vm2/projects/project_2018_libd/hisat_align/${OUTPUT}_sorted.bam 
echo 'sorted .bam'
echo 'Complete'
