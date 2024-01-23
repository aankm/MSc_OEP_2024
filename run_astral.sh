#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#$ -j n
#$ -N eu_astral_bs
#$ -M [EMAIL]
#$ -m e


## https://github.com/smirarab/ASTRAL/blob/master/README.md#installation
## https://github.com/smirarab/ASTRAL/blob/master/astral-tutorial.md


module load java/jre1.8.0_231
module load astral/5.7.8

## ASTRAL with full annotation

runASTRAL="Astral/astral.5.7.8.jar"
INFILE="3120_genetrees.tre"
OUTFILE="3120_speciestree_quartet.tre"
LOGFILE="3120_speciestree_quartet.log"


java -jar ${runASTRAL} -i ${INFILE} -t 2 -o ${OUTFILE} 2>${LOGFILE}

