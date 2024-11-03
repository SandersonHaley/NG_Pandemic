#!/bin/bash

cat NCBI_contigs.txt |while read line; do

bakta --db "/home/haley/Desktop/08042023_NG_NCBI_QC_contigs/BAKTADB/db" "$line"_contigs.fasta --prefix "$line" --verbose --output "$line"_BAKTA_RESULTS

done
