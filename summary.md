### Trimming and assembly <br/>
> assemblySnakefile

based on Target Enrichment Analysis TEnriAn (Mayer *et al*. 2021) (https://github.com/ZFMK/TEnriAn)


### Extract USCO genes and construct preliminary tree (IQ-TREE) <br/>
> buscophySnakefile <br/>


### Filtering <br/>
Outlier removal OliInSeq (Mayer 2007) <br/>
(https://github.com/cmayer/OliInSeq/) <br/>
> 01-outlier_rem.sh

Aliscore (Misof & Misof 2009, Kück *et al*. 2010) <br/>
(https://bonn.leibniz-lib.de/en/research/research-centres-and-groups/aliscore) <br/>
> 02-aliscore.sh

Alicut (Kück 2009) <br/>
(https://github.com/PatrickKueck/AliCUT) <br/>
> 03-mv_alicut.sh


### IQ-TREE <br/>
Concatenated tree from filtered gene assemblies <br/>
> iqtree_filtered.sh (line XX)

Gene trees from filtered gene assemblies <br/>
> iqtree_filtered.sh (line YY)


### Species delimitation and phylogeny with BPP <br/>
Flouri *et al*. (2020) (https://github.com/bpp/bpp) <br/>
> bpp_A11/

