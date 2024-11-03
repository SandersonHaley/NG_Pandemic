#!/bin/bash
cat NCBI_contigs.txt | while read line; do  
mob_recon --infile "$line"_contigs.fasta --outdir  "$line"_mobsuiteUNI_3_WGS -n 4 
done
