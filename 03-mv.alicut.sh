#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#$ -j n
#$ -N eu_aa_admin
#$ -M [EMAIL]
#$ -m be


# NOTE: running ALICUT from script doesn't work, so I will call it from the command line
# STEPS:
# move into the directory that contains both the OliInSeq fasta files and the ALISCORE output files
	#cd /share/pool/gbol3_eurytomidae_wgs/eury_filtering/results/
# call ALICUT
	#perl /share/pool/gbol3_eurytomidae_wgs/eury_filtering/scripts/ALICUT_V2.3.pl


## after running ALICUT from the command line I'll copy the output to a separate directory for use in IQ-TREE
## for consistency I'll change the name from the automatically generated ALICUT_{NAME}_aa_orm.fasta to {NAME}_aa_orm_ali.fasta


## path to directory with output from 01-outlier_rem.sh and 02-aliscore.sh
DIR="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_results"
## create directory with final filtered sequences for downstream analysis
ALI="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_filtered"
mkdir ${ALI}


## NB some loci have empty List files, so if their ALICUT_*.fasta doesn't exist, I'm copying the ORM output to aa_filtered
for FILE in $(ls ${DIR} | grep ".fasta$" | grep -v "ALICUT"); do

  NAME="${FILE##*/}"
	NAME="${NAME%.fasta}"

  if [ ! -f "${DIR}/ALICUT_${NAME}.fasta" ]; then
      cp "${DIR}/${NAME}.fasta" "${ALI}/${NAME}_ali.fasta"
  fi

done


## Now move the existing ALICUT_*.fasta to aa_filtered (and rename)
INDIR="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_results"
OUTDIR="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_filtered"

for FILE in $( ls ${INDIR}/ALICUT_*_orm.fasta); do 

	NAME="${FILE##*/}"
	NAME="${NAME%.fasta}"
	NAME="${NAME/#ALICUT_}"

	#echo ${OUTDIR}/${NAME}"_ali.fasta"
	mv ${FILE} ${OUTDIR}/${NAME}"_ali.fasta"

done
