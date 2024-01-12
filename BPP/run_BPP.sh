#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#$ -j n
#$ -N eu_aa_bpp
#$ -M [EMAIL]
#$ -m e


## INFO:
    ## https://github.com/bpp/bpp/blob/master/README.md
    ## http://abacus.gene.ucl.ac.uk/ziheng/pdf/2020Flouri-bpptutorial.pdf
    ## http://abacus.gene.ucl.ac.uk/ziheng/pdf/2015YangCZv61p854.pdf

## BPP input:
    ## phylip format alignment file
        # eurytoma_phylip.txt
    ## Imap file with taxon ID tags and corresponding "group" (here each sample is its own group)
        # eurytoma.Imap.txt
    ## control file with analysis parameters
        # EU_bpp_A11.ctl

## to download BPP
    # wget https://github.com/bpp/bpp/releases/download/v4.7.0/bpp-4.7.0-linux-x86_64.tar.gz
    # tar zxvf bpp-4.7.0-linux-x86_64.tar.gz

## executable in bpp-4.7.0-linux-x86_64/bin

cd /share/pool/gbol3_eurytomidae_wgs/eury_BPP

## to run BPP
./bpp-4.7.0-linux-x86_64/bin/bpp --cfile EU_bpp_A11.ctl
