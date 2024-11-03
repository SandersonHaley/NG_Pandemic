# NG_Pandemic
Data Processing and intermediate data analysis of N. gonnorrhea isolates from Saskatchewan 2017-2022 looking at treands during the COVID-19 Pandemic. This Github includes the data processing and internmediate analysis for this work.

## Data Processing
### Assembly and Quality Control
1. The de novo genome assembly and analysis was generated using the Gen2Epi [(Singh et al, 2019)](https://github.com/ReemaSingh/Gen2Epi). Gonnorheae specific data processing was initially also done with this pipeline using the *assembly.sh* script to initiate the pipeline.
2. The quality of the assemblies was determined using QUAST with the *quast.sh* script.
3. Additional non-Programmatic Analysis: Sequence-typing (MLST, NG-STAR, NG-MAST) was completed using Pathogenwatch. When sequence typing for NG-STAR and MG-MAST was incomplete using Pathogenwatch, the genomes were submitted to PubMLST for further sequence typing and allele comparison. Alleles that did not match any version on PubMLST and were considered novel were submitted for inclusion in the database for inclusion and the closest version of the allele in the database was used for typing. Genogroups were determined by extracting the porB and tbpB genes from the genomes and these genes were used to generate alignments. Genogroups were assigned based on the tbpB and porB genes being => 99% identical then the genogroup was named by the predominant NG-MAST sequence type. If there was no predominant sequence type, the group was named after all the sequence types in the group.
### Genome Annotation
1. Genome annotation was completed using both Bakta and Prokka using the *batka.sh* and *prokka.sh* scripts. The annotations from Bakta were used in downstream analysis.
### Phylogenetic Tree
1. The core genome phylogenetic tree was created using Panaroo using the *Panaroo.sh* script and FastTree using the *NG_tree.sh* script.
2. The tree was annotated and visualized using ete3 in intermediate results using the *08172023_NG_tree_with_outgroup.ipynb* and *08172023_NG_tree_annotations.ipynb* jupyter notebooks.
### Plasmid Detection
1. Plasmid detection in the genomes was done using MOB-suite and the *mobsuite.sh* script. This analysis was not included in the final manuscript.
### NCBI Submission Processing
1. A python script *removeshortcontigs.py* removed the contigs that are too small to be submmitted to NCBI from the genomes using the Bio and SeqIO python packages.
## Intermediate Analysis
This scripts constitute intermediate analysis for this work. This includes data wrangling work and inital statistical analysis of the dataset as it evolved over the course of the research project. The final analysis, in most cases, was not done computationally due to the corresponding author's preference. I will list what was done in each jupyter notebook below.

### *02172024 PEN abstract figures.ipynb* 
This Jupyter Notebook using the Phenotype and Genotype Antimicrobial Resistance data and generated line graphs signifying the percentage of genomes resistance (phenotypic resistance) over the study period for all of the antibiotics. Resistance, Intermediate Resistance and Susceptible counts/proportions are given different lines in the line graph. I then used the NG-STAR genes and ST to generate tables looking at the prevalence of each gene variant over the study period. Then I generate a table of all the gene variants for each gene over time and generate crosstabs for each and save them as a CSV.

### *03022024_refining yearST table with pathogenwatch only.ipynb* :
This Jupyter Notebook refines the table of Sequence Types for each genomes using the PathogenWatch data and Gen2Epi data favoring the PathogenWatch STs for downstream analysis.*08162023_NG_yearST_table.ipynb* is an older Jupyter Notebook were I was summarizing the NG-MASTER results and the csv generated is a previous version of this table.

### *05122024 ST by Year FINAL.ipynb*
This Jupyter Notebook summarizes an intermediate version of the data getting the counts for each ST and saving it to a csv.

### *ST over time 2024.ipynb*
This Jupter Notebook includes analysis of ST and Antimicrobial Resistance over time using linear regression.

### *07212024 Restistance and ST stats.ipynb*
This Jupyter Notebook includes looking at the difference in MIC for the genomes through the years using the Fisher Exact test and generating a p-value (with Bonferroni correction) for each comparison including a combination of NG-MAST And NG-STAR. *08172023_NG_stats_by_year.ipynb* is an older version of this analysis. \

*08182023_NG_proportional_stats.ipynb* is also an old version of this analysis, likelihood and linear regression analysis and addition heatmap generation related to the STs (not used in final analysis).

### *12032023_NG_AMR_Pheno_Geno_matching_and_over_time.ipynb*
This analysis includes comparing phenotypic resistance to genotypic resistance, including linear regression to show change over time. Preliminary bar graphs of phenotypic resitance and STs were also generated here (final version where generated in excel).

## Final Analysis
This folder includes a single script (*08162023_NG_quast.ipynb*) of Quast results for the genomes in which the results are culmminated into a single csv file using pandas and numpy.

## Software
- Gen2Epi v.0.1
- PathogenWatch v.23.0.1
- Quast v.5.2
- PUBMLST 
- Bakta v.1.9.4
- Prokka v1.14.6
- MOB-suite v.3.1.9
- Bio v.1.7.1
- Numpy v.2.1.3
- Pandas v.2.2.3
- matplotlib v.3.9.2
- statsmodels v.0.14.4
- scikit_posthocs v.0.10.0
- seaborn v.0.13.2
- itertools v.0.1.1
- statannotations v.0.6.0
- scipy v.1.14.1
- networkx v.3.4.2
- ete3 v.3.1.3
- dendropy v.5.0.1
- plotly v.5.24.1
- PIL v.0.1.0
- re v.0.4.0
- csv v.0.3.4

## Author
**Main Contributor** \
Dr. Haley Sanderson \
Bioinformatics Programmer \
Agriculture and Agri-Food Canada \
Haley Sanderson Consulting \
haley.sanderson@agr.gc.ca or haley.sanderson.092018@gmail.com
## License
Please view the licence [here](LICENSE)
## References
- Gen2Epi: Singh, R., Dillon, J. A. R., Demczuk, W., & Kusalik, A. (2019). Gen2Epi: an automated whole-genome sequencing pipeline for linking full genomes to antimicrobial susceptibility and molecular epidemiological data in Neisseria gonorrhoeae. BMC genomics, 20, 1-11.
- PathgenWatch: Sánchez-Busó, L., Yeats, C. A., Taylor, B., Goater, R. J., Underwood, A., Abudahab, K., ... & Aanensen, D. M. (2020). A community-driven resource for genomic epidemiology and antimicrobial resistance prediction of Neisseria gonorrhoeae at Pathogenwatch. bioRxiv, 2020-07.
- PUBMLST: Jolley, K. A., Bray, J. E., & Maiden, M. C. (2018). Open-access bacterial population genomics: BIGSdb software, the PubMLST. org website and their applications. Wellcome open research, 3
- Bakta: Schwengers, O., Jelonek, L., Dieckmann, M. A., Beyvers, S., Blom, J., & Goesmann, A. (2021). Bakta: rapid and standardized annotation of bacterial genomes via alignment-free sequence identification. Microbial genomics, 7(11), 000685.
- Prokka: Seemann, T. (2014). Prokka: rapid prokaryotic genome annotation. Bioinformatics, 30(14), 2068-2069.
- Mobsuite: Robertson, J., & Nash, J. H. (2018). MOB-suite: software tools for clustering, reconstruction and typing of plasmids from draft assemblies. Microbial genomics, 4(8), e000206.
- Quast: Gurevich, A., Saveliev, V., Vyahhi, N., & Tesler, G. (2013). QUAST: quality assessment tool for genome assemblies. Bioinformatics, 29(8), 1072-1075.
