#!/bin/bash
## Edits = KJ Benjamin

# Created for post-trim alignment
# Set file info

## These should be omitted from you basic script
# read -p 'Read group ID:' RGID 
# read -p 'Read group sample name:' RSM
# read -p 'Read group library name:' RLB
# read -p 'Read group sequencing platform:' RSP
# read -p 'Read group sequencing platform unit:' RPU

THREADS=1
IFD=''
READS=''
read -e -p 'Output file directory (ex. path/to/filename.sam):' OUTPUT ## If using rf (Apua github), this should just be file name

#read -e -p 'Index file directory:' IFD ## This shouldn't change
#read -e -p 'Read 1 file directory (FASTQ file):' DF_1 ## Reads should be in the same directory (I think you mean file name)
#read -e -p 'Read 2 file directory (FASTQ file):' DF_2 ## See above

#Use information to create the .sam file using hisat2 MODIFY AS NEEDED
## You can pipe into sample tools so as to reduce unnecessary files

hisat2 -p $THREADS \
       -x $IFD \
       --rna-strandness RF \
       -1 $READS/1.fastq.gz \
       -2 $READS/1.fastq.gz \
       --dta --time | \
    samtools view -@ $THREADS -b | \ ## Missing conversion to BAM file
    samtools sort -@ $THREADS -o ${OUTPUT}_sorted.bam 
	 
echo 'Completed alignment, conversion and sorting...'

# # Converting .sam into .bam
# read -p 'Name of .bam file' NBM


