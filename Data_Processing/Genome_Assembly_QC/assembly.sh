#!/bin/bash
#SBATCH --time=21-00:00:00
#SBATCH --mem=10G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
source ~/scratch/NG_fastq/activate-Gen2EpiGUI-env.sh
perl ~/software/Gen2EpiGUI/Gen2Epi_Scripts-GUI/WGS_SIBP_P2.pl ~/scratch/NG_fastq_output/Prepare_Input.txt ~/scratch/NG_fastq_output/Trimming trimmed 4 ~/scratch/NG_fastq_output
