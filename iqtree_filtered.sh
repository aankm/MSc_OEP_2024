#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#$ -j n
#$ -N IQtree_EU
#$ -M [EMAIL]
#$ -m e
#$ -pe smp 56 


## lines 21-26: species tree from concatenated loci
## lines 30-37: separate gene trees for each locus
## NB comment out the irrelevant section before running


## Load module
module load iqtree/2.1.2


## create and move to directory for concatenated IQ-TREE results
mkdir /share/pool/gbol3_eurytomidae_wgs/eury_filtering/tree_aa_filtered
cd /share/pool/gbol3_eurytomidae_wgs/eury_filtering/tree_aa_filtered

## species tree for all gene alignments
iqtree2 -p ../aa_filtered/ --prefix all_concat -B 1000 -T AUTO --threads-max 56

#------------------------------#

## loop over gene alignments and calculate gene trees
for FILE in ../aa_filtered/*.fasta
  do
  	iqtree2 -s ${FILE} -B 1000 -T AUTO --threads-max 56 --wbt ## --wbt: bootstrap trees are actually written to a file, and not just summarized in the output
  done

## NOTE: these results will be written to /share/pool/gbol3_eurytomidae_wgs/eury_filtering/aa_filtered
##       so might move those to a separate directory when they're done
