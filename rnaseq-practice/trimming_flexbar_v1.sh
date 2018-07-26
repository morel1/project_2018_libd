#!/bin/bash                                                                                          

# Created for flexbar trimming

# Need adaptor sequence files and trimming settings                                                  
read -e -p 'Select the adapter sequence files directory: ' ADAPT_FA                                  
echo "You have selected $ADAPT_FA"                                                                   
read -p 'Are the reads paired? (y/n): ' RDPR                                                         
read -e -p 'Select output directory (ex. path/to/filename.fastq.g)z: ' OTDIR
echo "You have selected $OTDIR"

# Add flexbar options as wanted to this script on lines 17 or 23
# For single reads
if [ "$RDPR" == "n" ];                                                                               
then                                                                                             
    read -e -p 'Select read file directory: ' SINGLE_RD                                           
    flexbar -r $SINGLE_RD -a $ADAPT_FA -t $OTDIR 
# For paired reads                                                                               
elif [ "$RDPR" == "y" ];
then
    read -e -p 'Select read 1 file directory: ' PAIR_RD_1     
    read -e -p 'Select read 2 file directory: ' PAIR_RD_2                                          
    flexbar -r $PAIR_RD_1 -p $PAIR_RD_2 -a $ADAPT_FA -t $OTDIR
else
    printf 'ERROR: DID NOT APPROPRIATELY SELECT PAIRING OPTION' >&2
fi
