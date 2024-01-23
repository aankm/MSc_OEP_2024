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


### IQ-TREE  <br/>
Nguyen *et al*. 2015, Chernomor *et al*. 2016, Kalyaanamoorthy *et al*. 2017, Hoang *et al*. 2018 <br/>
Concatenated tree from filtered gene assemblies <br/>
> iqtree_filtered.sh (line 26)

Gene trees from filtered gene assemblies <br/>
> iqtree_filtered.sh (line 31)


### species tree inference from gene trees with ASTRAL-III  <br/>
Zhang *et al*. 2018 <br/>
> run_astral.sh


### Species delimitation and phylogeny with BPP <br/>
Yang & Rannala 2014, Flouri *et al*. (2020) <br/>
(https://github.com/bpp/bpp) <br/>

Prepare input alignments (Alvarez-Carretero 2019) <br/>
https://github.com/sabifo4/fasta-phylip-partitions <br/>
> bpp_A11/convert2phylip.sh

BPP control file with analysis parameters <br/>
> bpp_A11/run_BPP.sh

shell script to execute BPP <br/>
> run_BPP.sh


### Creating the figures  <br/>
R Core Team 2022, RStudio Team 2022 <br/>
Galili 2015, Wickham 2016, Fox & Weisberg 2019, Paradis & Schliep 2019, Wang *et al*. 2020, Hutter 2021, Guangchuang 2022, Ram & Wickham 2023, Wickham & Bryan 2023 <br/>
> Figures.R


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<br/>

### References:

Alvarez-Carretero S (2019) Fasta-Phylip-Partitions: Convert from fasta to phylip format and generate partitioned data if needed. available at https://github.com/sabifo4/fasta-phylip-partitions. last accessed 10.01.2024.  <br/>
Chernomor O, Von Haeseler A, Minh BQ (2016) Terrace aware data structure for phylogenomic inference from supermatrices. Systematic Biology 65:997-1008.  <br/>
Flouri T, Jiao X, Rannala B, Yang Z (2020) A Bayesian implementation of the multispecies coalescent model with introgression for phylogenomic analysis. Molecular Biology and Evolution 37:1211-1223.  <br/>
Fox J, Weisberg S. 2019. An R Companion to Applied Regression, Third edition. Sage, Thousand Oaks CA. https://socialsciences.mcmaster.ca/jfox/Books/Companion/.  <br/>
Galili T (2015) dendextend: An R package for visualizing, adjusting, and comparing trees of hierarchical clustering. Bioinformatics. doi:10.1093/bioinformatics/btv428.  <br/>
Guangchuang Y (2022) Data integration, manipulation and visualization of phylogenetic trees (1st edition). Chapman and Hall/CRC. <br/>
Hoang DT, Chernomor O, Von Haeseler A, Minh BQ, Vinh LS (2018) UFBoot2: improving the ultrafast bootstrap approximation. Molecular Biology and Evolution 35:518-522.  <br/>
Hutter C (2021) AstralPlane: R package for preparing, running, analyzing, and plotting for the species tree program ASTRAL-III (v.0.1.1). available at https://github.com/chutter/AstralPlane.  <br/>
Kalyaanamoorthy S, Minh BQ, Wong TK, Von Haeseler A, Jermiin LS (2017) ModelFinder: fast model selection for accurate phylogenetic estimates. Nature Methods 14:587-589.  <br/>
Kück P (2009) ALICUT: a PerlScript to cut out ALISCORE identified randomized sequence sections in multiple sequence alignments (version 2). Department of Bioinformatics, Leibniz-Institut zur Analyse des Biodiversitätswandels, Museum Koenig, Bonn. available at https://github.com/PatrickKueck/AliCUT. <br/>
Kück P, Meusemann K, Dambach J, Thormann B, Von Reumont BM, Wägele J, Misof B (2010) Parametric and non-parametric masking of randomness in sequence alignments can be improved and leads to better resolved trees. Frontiers in Zoology 710: DOI: 10.1186/1742-9994-7-10.  <br/>
Mayer C (2007) OliInSeq: Detecting, masking and removing of outlier sequences in multiple sequence alignments. Free Software Foundation, Inc. (https://fsf.org/). available at https://github.com/cmayer/OliInSeq.  <br/>
Mayer C, Dietz L, Call E, Kukowka S, Martin S, Espeland M (2021) Adding leaves to the Lepidoptera tree: capturing hundreds of nuclear genes from old museum specimens. Systematic Entomology 46:649-671.  <br/>
Misof B, Misof K (2009) A Monte Carlo approach successfully identifies randomness in multiple sequence alignments: a more objective means of data exclusion. Systematic Biology 58:21-34.  <br/>
Nguyen L-T, Schmidt HA, Von Haeseler A, Minh BQ (2015) IQ-TREE: A fast and effective stochastic algorithm for estimating maximum likelihood phylogenies. Molecular Biology and Evolution 32:268-274.  <br/>
Paradis E, Schliep K (2019) ape 5.0: An environment for modern phylogenetics and evolutionary analyses in R. Bioinformatics, 35, 526-528. doi:10.1093/bioinformatics/bty633.  <br/>
Ram K, Wickham H (2023) wesanderson: A Wes Anderson palette generator. https://github.com/karthik/wesanderson.  <br/>
R Core Team (2022) R: a language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. https://www.R-project.org/.  <br/>
RStudio Team (2022) RStudio: integrated development environment for R. RStudio, PBC, Boston, MA, USA. http://www.rstudio.com/.  <br/>
Wang LG, Lam TTY, Xu S, Dai Z, Zhou L, Feng T, Guo P, Dunn CW, Jones BR, Bradley T, Zhu H, Guan Y, Jiang Y, Yu G (2020) treeio: an R package for phylogenetic tree input and output with richly annotated and associated data. Molecular Biology and Evolution 37(2):599-603. doi: 10.1093/molbev/msz240.  <br/>
Wickham H (2016) ggplot2: Elegant graphics for data analysis. Springer-Verlag, New York, USA. https://ggplot2.tidyverse.org.  <br/>
Wickham H, Bryan J (2023) readxl: Read Excel files. https://readxl.tidyverse.org, https://github.com/tidyverse/readxl.  <br/>
Yang Z, Rannala B (2014) Unguided species delimitation using DNA sequence data from multiple loci. Molecular Biology and Evolution 31:3125-3135.  <br/>
Zhang C, Rabiee M, Sayyari E, Mirarab S (2018) ASTRAL-III: polynomial time species tree reconstruction from partially resolved gene trees. BMC Bioinformatics 19:15-30.  <br/>
