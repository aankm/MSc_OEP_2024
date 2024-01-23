## load libraries
library(ggplot2)
  # Wickham 2016
library(ggtree)
  # Guangchuang 2022

## additional packages called using namespace:: 
# library(treeio)
  # Wang et al. 2020
# library(ape)
  # Paradis & Schliep 2019
# library(wesanderson)
  # Ram & Wickham 2023
# library(readxl)
  # Wickham & Bryan 2023
# library(car)
  # Fox & Weisberg 2019
# library(dendextend)
  # Galili 2015
# library(AstralPlane)
  # Hutter 2021


## load ML COI tree from IQ-TREE
iq_coi <- treeio::read.newick(file = "PATH/FILE.nwk")
## load concatenated USCO tree from IQ-TREE
iq_usco <- treeio::read.newick(file = "PATH/FILE.txt")


## load associated data and format numerical factors
analeu <- readxl::read_excel("PATH/FILE.xlsx", sheet = "EU_analysis")
analeu$loc_ID <- as.factor(analeu$loc_ID)
analeu$cluster <- as.factor(analeu$cluster)


## set colour palettes
ASAP_cols <- c("1"="darkslategray4", "9"="lightblue3", "10"="magenta", "11"="springgreen3", 
              "2"="peru", "3"="slateblue4", "4"="red2", "5"="darkorange2", 
              "6"="turquoise2", "7"="lightcoral", "8"="yellowgreen", "OG"="black")

female_cols <- c("f-A"="olivedrab3", "f-A/N"="darkgreen", "male"="grey70", "f-D"="orangered", "f-L"="slateblue4", 
             "f-B"="darkmagenta", "f-N"="maroon2", "f-F"="turquoise2", "f-M/G'"="chocolate4", 
             "f-G"="firebrick3", "f-P"="gold2", "f-C"="steelblue3", "OG"="black")

mPTP_cols <- c("1"="goldenrod3", "10"="#CEAC85", "4"="slateblue4", "7"="#8FE660", 
                "12"="#D65388", "3"="#DED749", "6"="#77A3DB", "8"="magenta", 
                "14"="darkorchid3", "5"="firebrick2", "9"="darkolivegreen", "11"="#73D5D6", 
                "13"="thistle4", "2"="#77DEA3", "OG"="black")

male_cols <- c("m-a"="goldenrod1","m-c.1"="maroon2","m-c.2"="aquamarine4","m-e"="forestgreen",
               "m-f"="khaki4","m-g"="orange3","m-h"="saddlebrown","m-j"="orchid3",
               "m-i"="red2","m-g/j"="royalblue3","female"="grey88","OG"="black")

# plot base trees with node numbers (admin)
ggplot(iq_coi) %<+% analeu +
  geom_tree() +
  theme_tree() +
  # geom_tiplab()                                     # tip nodes
  geom_text(aes(x, y, label=node), hjust=-.3)      # internal nodes

ggplot(iq_usco) %<+% analeu +
  geom_tree() +
  theme_tree() +
  # geom_tiplab(aes(x, y, label=node))                # tip nodes
  geom_text(aes(x, y, label=node), hjust=-.3)      # internal nodes

#-----------------------------------------------------

### ASAPbar_tree: 
## ML COI IQ-TREE tree with ASAP putative species labelled with a bar, tips coloured by ASAP species
    # INTREE = iq_coi

ggplot(iq_coi) %<+% analeu +
  geom_abline(slope = rep(0, 105), intercept = seq(from=-4.5, to=100, by=1), color="grey88") +  # background lines for the plot
  geom_tree() +
  geom_tippoint(size=6, aes(x, y, color=bar_sp, shape=sex)) +
  geom_tiplab(offset=0.01, size=5) +
  scale_color_manual(values=ASAP_cols, guide="none") +
  geom_nodelab(size=5, hjust=1.5, vjust=-0.5, color="black") +  # add bootstrap support values
  
  geom_cladelab(node=164, label="PS 1", align=TRUE, barcolor="darkslategray4", barsize=3, offset=.05, fontsize=9) +  # bars for putative species
  geom_cladelab(node=116, label="PS 2", align=TRUE, barcolor="peru", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=133, label="PS 3", align=TRUE, barcolor="slateblue4", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=129, label="PS 4", align=TRUE, barcolor="red", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=153, label="PS 5", align=TRUE, barcolor="darkorange2", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=105, label="PS 6", align=TRUE, barcolor="turquoise2", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=137, label="PS 7", align=TRUE, barcolor="lightcoral", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=125, label="PS 8", align=TRUE, barcolor="yellowgreen", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=146, label="PS 9", align=TRUE, barcolor="lightblue3", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=152, label="PS 11", align=TRUE, barcolor="springgreen3", barsize=3, offset=.05, fontsize=9) +

  geom_cladelab(node=1, label="PS 10", align=TRUE, color="magenta", barsize=3, offset=.05, fontsize=9) +  # "bar" for putative species with N=1
  geom_point(x=0.23525, y=3.8, shape=15, color="magenta", size=2.5) +
  geom_point(x=0.23525, y=4, shape=15, color="magenta", size=2.5) +
  geom_point(x=0.23525, y=4.2, shape=15, color="magenta", size=2.5) +

  geom_strip(4, 6, barsize=0, label="outgroup", offset=.08, offset.text=0.001, fontsize=9) +   # bars for outgroup
  geom_strip(4, 6, barsize=2, color="black", offset=.08) +
  geom_cladelab(node=69, label="outgroup ?", align=TRUE, color="black", barsize=3, offset=.08, fontsize=9) +
  geom_point(x=0.26525, y=73.8, shape=15, color="black") +
  geom_point(x=0.26525, y=74, shape=15, color="black") +
  geom_point(x=0.26525, y=74.2, shape=15, color="black") +

  geom_label(x=0.23525, y=97, label="ASAP", size=7) +
  
  guides(color="none") +
  theme_tree() +
  theme(legend.position=c(0.1,0.9), legend.text=element_text(size=20), legend.title=element_text(size=20)) +
  xlim(0, 0.3) +
  ylim(0, 98)


ggsave("PATH/FILE.png", width=40, height=60, units="cm")

#----------------------------------------------------

### mPTPbar_tree:
## ML COI IQ-TREE tree with mPTP putative species labelled with a bar, tips coloured by mPTP species
    # INTREE = iq_coi
# nodes found using ape::MRCA function

ggplot(iq_coi) %<+% analeu +
  geom_abline(slope = rep(0, 105), intercept = seq(from=-4.5, to=100, by=1), color="grey88") +  # background lines for the plot
  geom_tree() +
  geom_tippoint(size=6, aes(x, y, color=mPTP_sp, shape=sex)) +
  geom_tiplab(offset=0.01, size=5) +
  scale_color_manual(values=mPTP_cols, guide="none") +
  geom_nodelab(size=5, hjust=1.5, vjust=-0.5, color="black") +

  geom_cladelab(node=175, label="PS 10", align=TRUE, barcolor="#CEAC85", barsize=3, offset=.05, fontsize=9) +  # bars for putative species
  geom_cladelab(node=165, label="PS 2", align=TRUE, barcolor="darkolivegreen", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=153, label="PS 11", align=TRUE, barcolor="#8FE660", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=152, label="PS 13", align=TRUE, barcolor="magenta", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=137, label="PS 7", align=TRUE, barcolor="#D65388", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=133, label="PS 4", align=TRUE, barcolor="#73D5D6", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=129, label="PS 12", align=TRUE, barcolor="thistle4", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=125, label="PS 3", align=TRUE, barcolor="darkorchid3", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=106, label="PS 14", align=TRUE, barcolor="slateblue4", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=118, label="PS 6", align=TRUE, barcolor="#77DEA3", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=117, label="PS 8", align=TRUE, barcolor="#DED749", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=146, label="PS 9", align=TRUE, barcolor="#77A3DB", barsize=3, offset=.05, fontsize=9) +
  
  geom_cladelab(node=18, label="PS 5", align=TRUE, barcolor="firebrick2", barsize=3, offset=.05, fontsize=9) +  # "bars" for putative species with N=1
  geom_point(x=0.23525, y=15.8, shape=15, color="firebrick2", size=2.5) +
  geom_point(x=0.23525, y=16, shape=15, color="firebrick2", size=2.5) +
  geom_point(x=0.23525, y=16.2, shape=15, color="firebrick2", size=2.5) +
  geom_cladelab(node=1, label="PS 1", align=TRUE, barcolor="goldenrod3", barsize=3, offset=.05, fontsize=9) +
  geom_point(x=0.23525, y=3.8, shape=15, color="goldenrod3", size=2.5) +
  geom_point(x=0.23525, y=4, shape=15, color="goldenrod3", size=2.5) +
  geom_point(x=0.23525, y=4.2, shape=15, color="goldenrod3", size=2.5) +  

  geom_strip(4, 6, barsize=0, label="outgroup", offset=.08, offset.text=0.001, fontsize=9) +  # bars for outgroup
  geom_strip(4, 6, barsize=2, color="black", offset=.08) +
  geom_cladelab(node=69, label="outgroup ?", align=TRUE, color="black", barsize=3, offset=.08, fontsize=9) +
  geom_point(x=0.26525, y=73.8, shape=15, color="black") +
  geom_point(x=0.26525, y=74, shape=15, color="black") +
  geom_point(x=0.26525, y=74.2, shape=15, color="black") +  
  geom_label(x=0.23525, y=97, label="mPTP", size=7) +
  
  guides(color="none") +
  theme_tree() +
  theme(legend.position=c(0.1,0.9), legend.text=element_text(size=20), legend.title=element_text(size=20)) +
  xlim(0, 0.3) +
  ylim(0, 98)


ggsave("PATH/FILE.png", width=40, height=60, units="cm")

#----------------------------------------------------

### usco_concat:
## concatenated USCO IQ-TREE tree with ASAP and mPTP putative species bars, tips coloured by mPTP putative species
    # INTREE = iq_usco

ggplot(iq_usco) %<+% analeu +
  geom_abline(slope = rep(0, 105), intercept = seq(from=-4.5, to=100, by=1), color="grey88") +
  geom_tree() +
  geom_tippoint(size=6, aes(x, y, color=mPTP_sp, shape=sex)) +
  scale_color_manual(values=mPTP_cols, guide="none") +
  geom_tiplab(offset=0.01, size=5) +
  geom_nodelab(size=5, hjust=1.5, vjust=-0.5, color="black") +

  geom_cladelab(node=149, label="PS 1", align=TRUE, barcolor="darkslategray4", barsize=3, offset=.05, fontsize=9) +  # bars for ASAP putative species
  geom_cladelab(node=140, label="PS 2", align=TRUE, barcolor="peru", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=107, label="PS 3", align=TRUE, barcolor="slateblue4", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=124, label="PS 4", align=TRUE, barcolor="red", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=181, label="PS 5", align=TRUE, barcolor="darkorange2", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=129, label="PS 6", align=TRUE, barcolor="turquoise2", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=115, label="PS 7", align=TRUE, barcolor="lightcoral", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=111, label="PS 8", align=TRUE, barcolor="yellowgreen", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=175, label="PS 9", align=TRUE, barcolor="lightblue3", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=180, label="PS 11", align=TRUE, barcolor="springgreen3", barsize=3, offset=.05, fontsize=9) +
  geom_cladelab(node=3, label="PS 10", align=TRUE, color="magenta", barsize=3, offset=.05, fontsize=9) +
  geom_point(x=0.1235, y=2.8, shape=15, color="magenta", size=2.5) +
  geom_point(x=0.1235, y=3, shape=15, color="magenta", size=2.5) +
  geom_point(x=0.1235, y=3.2, shape=15, color="magenta", size=2.5) +
  
  geom_strip(32, 37, barsize=0, label="PS 4", offset=.08, offset.text=0.001, fontsize=9) +  # bars for mPTP putative species
  geom_strip(32, 37, barsize=3, color="slateblue4", offset=.08) +
  geom_cladelab(node=141, label="PS 2", align=TRUE, barcolor="#77DEA3", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=107, label="PS 11", align=TRUE, barcolor="#73D5D6", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=124, label="PS 13", align=TRUE, barcolor="thistle4", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=181, label="PS 7", align=TRUE, barcolor="#8FE660", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=115, label="PS 12", align=TRUE, barcolor="#D65388", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=147, label="PS 3", align=TRUE, barcolor="#DED749", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=111, label="PS 14", align=TRUE, barcolor="darkorchid3", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=175, label="PS 6", align=TRUE, barcolor="#77A3DB", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=180, label="PS 8", align=TRUE, barcolor="magenta", barsize=3, offset=.08, fontsize=9) +
  geom_cladelab(node=149, label="", align=TRUE, barcolor="darkolivegreen", barsize=3, offset=.079, fontsize=9) +
  geom_cladelab(node=149, label="PS 9/10", align=TRUE, barcolor="#CEAC85", barsize=3, offset=.081, fontsize=9) +
  geom_cladelab(node=31, label="PS 5", align=TRUE, barcolor="firebrick2", barsize=3, offset=.08, fontsize=9) +
  geom_point(x=0.15315, y=39.8, shape=15, color="firebrick2", size=2.5) +
  geom_point(x=0.15315, y=40, shape=15, color="firebrick2", size=2.5) +
  geom_point(x=0.15315, y=40.2, shape=15, color="firebrick2", size=2.5) +
  geom_cladelab(node=3, label="PS 1", align=TRUE, barcolor="goldenrod3", barsize=3, offset=.08, fontsize=9) +
  geom_point(x=0.15315, y=2.8, shape=15, color="goldenrod3", size=2.5) +
  geom_point(x=0.15315, y=3, shape=15, color="goldenrod3", size=2.5) +
  geom_point(x=0.15315, y=3.2, shape=15, color="goldenrod3", size=2.5) +

  geom_strip(1, 6, barsize=0, label="outgroup", offset=.1, offset.text=0.001, fontsize=9) +  # bar for outgroup
  geom_strip(1, 6, barsize=2, color="black", offset=.1) +
  
  geom_label(x=0.1235, y=97, label="ASAP", size=7) +
  geom_label(x=0.15315, y=97, label="mPTP", size=7) +

  guides(color="none") +
  theme_tree() +
  theme(legend.position=c(0.1,0.9), legend.text=element_text(size=20), 
        legend.title=element_text(size=20)) +
  xlim(0, 0.2) +
  ylim(0, 97.1)


ggsave("PATH/FILE.png", width=40, height=60, units="cm")

#----------------------------------------------------

### MTCOI
## morphotypes (females only) plotted on ML COI IQ-TREE tree
# INTREE=iq_coi

## create column in dataframe for only female MTs
analeu$fMT_sp <- car::recode(analeu$female_cols, "'grey88'='male'; else=analeu$MT")
analeu$fMT_sp <- as.factor(analeu$fMT_sp)

# create column for only male MTs
analeu$mMT_sp <- car::recode(analeu$male_cols, "'grey88'='female'; else=analeu$MT")
analeu$mMT_sp <- as.factor(analeu$mMT_sp)

df <- data.frame(node=c(164,116,133,129,153,105,137,125,146,152,1)) # parent nodes of putative species

## plot females
ggplot(iq_coi) %<+% analeu +
  geom_tree() +
  geom_tippoint(size=6, aes(x, y, color=fMT_sp, shape=sex)) +
  geom_tiplab(offset=0.01, size=5) +
  scale_color_manual(values=female_cols, guide="none") +
  geom_nodelab(size=5, hjust=1.5, vjust=-0.5, color="black") +
  
  geom_hilight(data=df, aes(node=node), colour="grey50", linetype=2, fill=NA, extendto=0.235) +  # add boxes around putative species
  
  guides(color="none") +
  theme_tree() +
  theme(legend.position=c(0.1,0.9), legend.text=element_text(size=20), legend.title=element_text(size=20)) +
  xlim(0, 0.25) +
  ylim(0, 98)


ggsave("PATH/FILE.png", width=40, height=60, units="cm")

## plot males
ggplot(bar_boot) %<+% analeu +  
  geom_tree() +
  geom_tippoint(size=6, aes(x, y, color=mMT_sp, shape=sex)) +
  geom_tiplab(offset=0.01, size=5) +
  scale_color_manual(values=male_cols, guide="none") +
  geom_nodelab(size=5, hjust=1.5, vjust=-0.5, color="black") +
  
  geom_hilight(data=df, aes(node=node), colour="grey50", linetype=2, fill=NA, extendto=0.235) +
  
  guides(color="none") +
  theme_tree() +
  theme(legend.position=c(0.1,0.9), legend.text=element_text(size=20), legend.title=element_text(size=20)) +
  xlim(0, 0.25) +
  ylim(0, 98)


ggsave("PATH/FILE.png", width=40, height=60, units="cm")

#----------------------------------------------------

### tree_compare
## comparison collapsed topologies of ML COI IQ-TREE tree and USCO trees

# load reduced trees
coired <- treeio::read.newick(file="PATH/FILE.txt")
uscored <- treeio::read.newick(file="PATH/FILE.txt")

# add arbitrary edge lengths
coired$edge.length <- rep(1, 22)
uscored$edge.length <- rep(1, 22)

# rename tips to match the other figures
coired$tip.label <- c("PS 4", "PS 7", "PS 3", "PS 8", "PS 1", "PS 5", "PS 11", "PS 9", "PS 6", "PS 2", "PS 10", "outgroup")
uscored$tip.label <- c("PS 4", "PS 7", "PS 3", "PS 8", "PS 1", "PS 5", "PS 11", "PS 9", "PS 6", "PS 2", "PS 10", "outgroup")

# get an idea of the layout
ggplot(coired, branch.length="none", ladderize=FALSE) +
  geom_tree() +
  geom_tiplab(offset=0.01, size=5) +
  theme_tree() +
  xlim(0, 7)

ggplot(uscored, branch.length="none", ladderize=FALSE) +
  geom_tree() +
  geom_tiplab(offset=0.01, size=5) +
  theme_tree() +
  xlim(0, 8)

# convert to dendrograms
coidend <- ape::chronos(coired)
uscodend <- ape::chronos(uscored)

# start save to .png
png(file="PATH/FILE.png", 
    width=500, height=400)
# plot
dendextend::tanglegram(coidend, uscodend, 
                       common_subtrees_color_branches=FALSE, 
                       highlight_distinct_edges=FALSE, 
                       highlight_branches_lwd=FALSE, 
                       edge.lwd=2,color_lines="white", 
                       margin_inner=5.8, columns_width=c(5,1,5), 
                       axes=FALSE, lab.cex=1.5, 
                       main_left="A   (COI)", main_right="B   (USCO)", cex_main_left=1.4, cex_main_right=1.4)

arrows(x0=0.52, y0=0.88, x1=0.52, y1=0.35, lty=1, lwd=2, col="grey30", code=3, angle=90, length=0.05)
arrows(x0=0.4, y0=-0.1, x1=0.4, y1=0.6, lty=1, lwd=2, col="grey30", code=3, angle=90, length=0.05)
# end save to .png
dev.off()

#----------------------------------------------------

### astral_tree
## MSC USCO ASTRAL speciestree from IQ-TREE gene trees

# load annotated speciestree as astral object
astratree <- treeio::read.astral(file="PATH/FILE.tree")

# add arbitrary lengths to terminal nodes
astratree@phylo$edge.length <- car::recode(astratree@phylo$edge.length, "NaN=0.2; else=astratree@phylo$edge.length")
# save posterior probability of consensus topology (pp1) as node labels
astratree@phylo$node.label <- car::recode(astratree@data$pp1, "NaN=NaN; else=astratree@data$pp1")
# round node labels to 2 decimal places
astratree@phylo$node.label <- round(astratree@phylo$node.label, digits=2)

# root at outgroup
astratree <- ape::root(astratree, node=139)

# add labels for highest identification for each specimen to dataframe
analeu$sp_label <- car::recode(analeu$TIS, "'ZFMK-TIS-2637690'='Eurytoma rosae group'; 
                                'ZFMK-TIS-2637691'='Bruchophagus robiniae'; 'ZFMK-TIS-2637692'='Eurytoma appendigaster group'; 
                                'ZFMK-TIS-2637693'='Bruchophagus aspila group'; 'ZFMK-TIS-2637694'='Eurytoma compressa group'; 
                                'ZFMK-TIS-2637695'='Eurytoma compressa group'; 'ZFMK-TIS-2634061'='Eurytoma robusta group ?'; 
                                else=' '")

# set colours
sp_cols <- c("Bruchophagus aspila group"="grey10", "Bruchophagus robiniae"="grey30", "Eurytoma compressa group"="grey50", 
             "Eurytoma rosae group"="grey70", "Eurytoma robusta group ?"="tomato4", " "="sienna3")

# overview
ggtree(astratree) + geom_text(aes(x, y, label=node))

# plot
AstralPlot <- ggplot(astratree) %<+% analeu +
  geom_tree() +
  theme_tree() +
  geom_tippoint(size=6, aes(x, y, shape=sex, color=sp_label)) +
  scale_color_manual(values=sp_cols) +
  
  geom_hilight(node=166, fill=NA, colour="grey30", linetype=2, extendto=3.93) +  # boxes around putative species
  geom_hilight(node=108, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=110, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=112, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=29, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=128, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=121, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=120, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=157, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=154, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=149, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=146, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=43, fill=NA, colour="grey30", linetype=2, extendto=3.93) +

  geom_text(aes(x, y, label=sp_label), hjust=-0.1, size=5) +
  geom_nodelab(size=5, hjust=1.5, vjust=-1, color="black") +
  
  geom_cladelab(node=138, label="Eurytoma robusta group",
                barcolor="sienna3", barsize=3, offset=0.1, fontsize=9, angle=90, vjust=1.2, hjust=0.45) +
  
  labs(color="") +
  theme(legend.position=c(0.17,0.85), legend.text=element_text(size=20), legend.title=element_text(size=20)) +
  xlim(-1, 4.5) +
  ylim(0, 98)

flip(AstralPlot, 141, 139) %>% flip(143, 142)  # flip for readability


ggsave("PATH/FILE.png", width=40, height=60, units="cm")

#----------------------------------------------------

### countree
## MSC USCO ASTRAL speciestree from IQ-TREE gene trees
# INTREE=astratree


countree <- ggplot(astratree) %<+% analeu +
  geom_tree() +
  theme_tree() +
  
  geom_hilight(node=166, fill=NA, colour="grey30", linetype=2, extendto=3.93) +  # boxes for putative species
  geom_hilight(node=108, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=110, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=112, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=29, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=128, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=121, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=120, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=157, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=154, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=149, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=146, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  geom_hilight(node=43, fill=NA, colour="grey30", linetype=2, extendto=3.93) +
  
  geom_tippoint(size=6, aes(x, y, color=cluster, fill=cluster, shape=country)) +  # colour tip points by sampling location cluster, shape represents country
  scale_color_manual(values=wesanderson::wes_palette("Darjeeling1", n=10, type="continuous"), guide="none") +
  scale_fill_manual(values=wesanderson::wes_palette("Darjeeling1", n=10, type="continuous"), guide="none") +
  scale_shape_manual(values=c(21,22,23,24,25)) +
  guides(shape = guide_legend(override.aes=list(fill="black"))) +
  
  geom_cladelab(node=138, label="Eurytoma robusta group",
                barcolor="grey", barsize=3, offset=0.1, fontsize=9, angle=90, vjust=1.2, hjust=0.45) +
  geom_nodelab(size=5, hjust=1.5, vjust=-0.5, color="black") +
  
  theme(legend.position=c(0.14,0.9), legend.text=element_text(size=20), legend.title=element_text(size=20)) +
  xlim(-0.5, 4.5) +
  ylim(0, 98)

flip(countree, 141, 139) %>% flip(143, 142)  # flip for readability


ggsave("PATH/FILE.png", width=40, height=60, units="cm")

#----------------------------------------------------

### disco_tree
## MSC USCO ASTRAL speciestree from IQ-TREE gene trees, with quartet frequencies
# INTREES=astral.data (3120_speciestree)

## ggdensitree doesn't work for gene trees with taxa missing
## using this instead: https://github.com/chutter/AstralPlane

# define outgroup
outgroup <- c("ZFMK-TIS-2634061", "ZFMK-TIS-2637690", "ZFMK-TIS-2637691", "ZFMK-TIS-2637692", 
              "ZFMK-TIS-2637693", "ZFMK-TIS-2637694", "ZFMK-TIS-2637695")

# load annotated tree as AstralPlane object
astral.data = AstralPlane::createAstralPlane(astral.tree = "PATH/FILE.tree",
                                outgroups = outgroup,
                                tip.length = 0.2)

# remove quartet frequencies (q1,q2,q3) for q1 < 0.4
astral.data@nodeData$q1 <- car::recode(astral.data@nodeData$q1, "0:0.39999=NA; else=astral.data@nodeData$q1")
astral.data@nodeData$q2 <- car::recode(astral.data@nodeData$q1, "NA=NA; else=astral.data@nodeData$q2")
astral.data@nodeData$q3 <- car::recode(astral.data@nodeData$q1, "NA=NA; else=astral.data@nodeData$q3")

# start save to .png
png(file="PATH/FILE.png", 
    width=5000, height=7500)

## this is a customisation of the AstralPlane::astralProjection function
## just to get the edge.lwd option, as the magnification was making the default tree unreadable
astralProject(astral.plane = astral.data,
              local.posterior = TRUE,
              pie.plot = TRUE,
              pie.data = "qscore",
              pie.colors = c("#81A88D", "#DC863B", "#046C9A"),
              node.color.text = c("black"),
              node.color.bg = c("white"),
              edge.lwd = 7, 
              node.label.size = 6,
              tip.label.size = 7,
              pie.chart.size = .75)

arrows(x0=4.6, y0=94.4, x1=4.6, y1=93.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=89.4, x1=4.6, y1=85.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=85.4, x1=4.6, y1=80.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=80.4, x1=4.6, y1=76.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=76.4, x1=4.6, y1=66.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=66.4, x1=4.6, y1=64.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=64.4, x1=4.6, y1=57.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=57.4, x1=4.6, y1=56.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=56.4, x1=4.6, y1=45.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=45.4, x1=4.6, y1=40.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=40.4, x1=4.6, y1=38.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=38.4, x1=4.6, y1=26.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)
arrows(x0=4.6, y0=26.4, x1=4.6, y1=0.6, lty=1, lwd=20, col="grey20", code=3, angle=90, length=0.5)

rect(xleft=1, xright=4.8, ybottom=93.5, ytop=94.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=85.5, ytop=89.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=80.5, ytop=85.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=76.5, ytop=80.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=66.5, ytop=76.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=64.5, ytop=66.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=57.5, ytop=64.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=56.5, ytop=57.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=45.5, ytop=56.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=40.5, ytop=45.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=38.5, ytop=40.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=26.5, ytop=38.5, border="grey30", lty=2, lwd=5)
rect(xleft=1, xright=4.8, ybottom=0.5, ytop=26.5, border="grey30", lty=2, lwd=5)
# end save to .png
dev.off()
