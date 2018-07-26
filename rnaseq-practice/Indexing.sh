#!/bin/bash

# need gtf and fa files for indexing
# echo 'MAKE SURE FILES HAVE APPROPRIATE EXTENSIONS'
# echo
# read -e -p 'Please select .gtf file directory for indexing: ' GTF_FILE
# echo "You entered: $GTF_FILE"
# read -e -p 'Please select .fa file directory for indexing: ' FA_FILE
# echo "You entered: $FA_FILE"

GTF_FILE='./Homo_sapiens.GRCh38.91.gtf'
FA_FILE='./Homo_sapiens.GRCh38.dna.chromosome.5.fa'

set -o errexit 
#check to see if the files are correct
if [[  $GTF_FILE == *.gtf  &&  $FA_FILE == *.fa  ]]
then
    # files are accepted and will continue through HISAT2 processing
    echo "Make index directory ... $(date)"
    mkdir -p index_files
    echo "Extract splice sites ... $(date)"
    hisat2_extract_splice_sites.py $GTF_FILE > ./index_files/splicesites.tsv
    echo "Extract known exons ... $(date)"
    hisat2_extract_exons.py $GTF_FILE > ./index_files/exons.tsv
    echo "Building indexes ... $(date)"
    hisat2-build -p 2 --ss ./index_files/splicesites.tsv --exon ./index_files/exons.tsv $FA_FILE ./index_files/index
else
    printf "ERROR: INPUT FILE DOES NOT HAVE CORRECT EXTENSION\n" >&2
    exit 1
fi
echo
echo 'INDEXING COMPLETE'
