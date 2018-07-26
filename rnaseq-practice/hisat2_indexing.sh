#!/bin/bash

GTF_FILE=''
FA_FILE=''
THREADS=1

mkdir index

hisat2_extract_splice_sites.py $GTF_FILE > ./index/splicesites.tsv
hisat2_extract_exons.py $GTF_FILE > ./index/exons.tsv

hisat2-build -p $THREADS --ss ./index/splicesites.tsv \
	     --exon ./index/exons.tsv $FA_FILE ./index/mm10_genome
