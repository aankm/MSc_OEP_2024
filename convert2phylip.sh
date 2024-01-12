#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#$ -j n
#$ -N eu_aa_phylip
#$ -M [EMAIL]
#$ -m e


## I need to convert my fasta alignments to phylip format
## https://github.com/sabifo4/fasta-phylip-partitions

## path to filtered gene alignments
DIR="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_filtered"
## working directory (where output phylip file will be saved)
WD="/share/pool/gbol3_eurytomidae_wgs/eury_BPP"
## path to executable
RUN="/share/pool/gbol3_eurytomidae_wgs/eury_BPP/fasta-phylip-partitions/src/Run_tasks.sh"

## the program needs a list of taxa IDs
## mine was saved in {WD} and it needs to be in the same directory as the input alignments
mv species_names.txt ${DIR}

## run program
${RUN} ${DIR} bpp partN

## move list of taxa IDs and output to {WD}
mv ${DIR}/species_names.txt ${WD}
mv ${DIR}/phylip_format ${WD}
