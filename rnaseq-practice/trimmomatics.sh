#!/bin/bash

# Purpose of this script is to run Trimmomatics to trim fastq.gz files
# MODIFY AS NEEDED

read -e -p 'fastq file 1 dir: ' FQ1
read -e -p 'fastq file 2 dir: ' FQ2
read -p 'output basename: ' BSNM
java -jar /home/vm2/tools/bin/trimmomatic-0.38.jar PE $FQ1 $FQ2 -baseout $BSNM.gz ILLUMINACLIP:/home/vm2/tools/bin/TruSeq3-PE.fa:2:30:10 LEADING:15 TRAILING:15 SLIDINGWINDOW:4:15 MINLEN:36

echo "Complete"
