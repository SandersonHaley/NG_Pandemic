#!/bin/bash
#SBATCH --account=def-whitelab
#SBATCH --time=21-00:00:00
#SBATCH --mem=64G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

module load StdEnv/2020
module load cd-hit/4.8.1
module load mafft/7.471
source $HOME/Panaroo/bin/activate 
mkdir NG_2017-2022_Panaroo_2
panaroo -i *.gff3 -o NG_2017-2022_Panaroo_2 --clean-mode strict -t 4 -a core
