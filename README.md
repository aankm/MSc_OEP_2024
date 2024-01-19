## <p align="center"> Shaping Diversity: A Look into Species Limits in the *Eurytoma robusta* Species Group (Chalcidoidea: Eurytomidae) Using Genome Sequence Data


<p align="center"> Scripts and supplementary information for Thesis
<p align="center"> submitted in partial fulfilment of the requirements for the degree
  
### <p align="center"> Master of Science
</p>

<br/><br/>
Master programme in
Organismic Biology, Evolutionary Biology and Palaeobiology
(OEP-Biology)


Faculty of Mathematics and Natural Sciences, Rheinische Friedrich-Wilhelms-Universität Bonn

<br/>
Presented by
Anne Ankermann
<br/>
Bonn, January 2024

<br/><br/>
This work was performed at:
<br/>
Leibniz-Institute for the Analysis of Biodiversity Change (LIB)
<br/>
Section Hymenoptera / GBOL III
<br/>
In the team of Dr. Ralph Peters


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<br/>

### Summary

#### Trimming and assembly <br/>
> assemblySnakefile

based on Target Enrichment Analysis TEnriAn (Mayer *et al*. 2021) (https://github.com/ZFMK/TEnriAn)


#### Extract USCO genes and construct preliminary tree (IQ-TREE) <br/>
> buscophySnakefile <br/>


#### Filtering <br/>
Outlier removal OliInSeq (Mayer 2007) <br/>
(https://github.com/cmayer/OliInSeq/) <br/>
> 01-outlier_rem.sh

Aliscore (Misof & Misof 2009, Kück *et al*. 2010) <br/>
(https://bonn.leibniz-lib.de/en/research/research-centres-and-groups/aliscore) <br/>
> 02-aliscore.sh

Alicut (Kück 2009) <br/>
(https://github.com/PatrickKueck/AliCUT) <br/>
> 03-mv_alicut.sh


#### IQ-TREE <br/>
Concatenated tree from filtered gene assemblies <br/>
> iqtree_filtered.sh (line XX)

Gene trees from filtered gene assemblies <br/>
> iqtree_filtered.sh (line YY)


#### Species delimitation and phylogeny with BPP <br/>
Flouri *et al*. (2020) (https://github.com/bpp/bpp) <br/>

Prepare input alignments (https://github.com/sabifo4/fasta-phylip-partitions) <br/>
> bpp_A11/convert2phylip.sh

BPP control file with analysis parameters <br/>
> bpp_A11/run_BPP.sh

shell script to execute BPP <br/>
> run_BPP.sh


#### Creating the figures<br/>
> Figures.R


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<br/>

### References:
