#!/bin/bash

cat NCBI_contigs.txt |while read line; do

quast.py "$line"_contigs.fasta -o "$line"_quast_results

done
