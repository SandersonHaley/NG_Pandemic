#!/bin/bash
#SBATCH --account=def-whitelab
#SBATCH --time=21-00:00:00
#SBATCH --mem=64G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

module load fasttree-double/2.1.11
FastTree -gtr -gamma -nt core_gene_alignment.aln > NG_2017-2022.treefile

