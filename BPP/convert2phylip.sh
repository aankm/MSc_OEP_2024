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
mv ${DIR}/phylip_format/01_alignment_all_loci/bpp_all_loci.aln ${WD}/eurytoma_phylip.txt

## make a backup copy of output
cp ${WD}/eurytoma_phylip.txt ${WD}/backup-eurytoma_phylip.txt

## remove the rest of the output to save space
rm -r ${DIR}/phylip_format


## the format for the taxon IDs in BPP input is slightly different than my file
## so I'm adding the ID tags (^[nr])

COUNT=1

for NAME in $(cat species_names.txt); do

    sed -i s/${NAME}/${NAME}\^${COUNT}/g eurytoma_phylip.txt
    ((COUNT++))

done
