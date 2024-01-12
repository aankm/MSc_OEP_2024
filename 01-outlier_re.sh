#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#$ -j n
#$ -N eu_aa_ORM
#$ -M [EMAIL]
#$ -m be

## compiler line
#g++ -O2 -I .  global-types-and-parameters.cpp remove_outlier_sequences.cpp -o Remove-Outlier-Sequences-v0.9.5

## move to directory where results should be saved
cd /share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_results/

## path to OliInSeq executable
run_outlier_removal="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/scripts/remove_outlier_sequences-v0.9.5-dist/Remove-Outlier-Sequences-v0.9.5"
## path to trimmed alignments
DIR="/share/pool/gbol3_eurytomidae_wgs/eury_buscophy/results/busco/phylo/busco_aa_alignments_trim"


for FILE in $( ls ${DIR}/*.fasta); do 

	NAME="${FILE##*/}"
	ID="${NAME%.fasta}"
	
	${run_outlier_removal} -i ${FILE} -o ${ID}_orm.fasta &> ${ID}_orm.log

done


cd /share/pool/gbol3_eurytomidae_wgs/eury_filtering/
