#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#$ -j n
#$ -N eu_aliscore
#$ -M [EMAIL]
#$ -m be


## move to directory where results should be saved
cd /share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_results/

## path to Aliscore script
run_aliscore="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/scripts/ALISCORE_v2.0/Aliscore.02.2.pl"
## path to input (output from 01-outlier_rem.sh)
DIR="/share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_results"

for FILE in $( ls ${DIR}/*_orm.fasta); do 

	${run_aliscore} -i ${FILE}

done

cd /share/pool/gbol3_eurytomidae_wgs/eury_filtering

