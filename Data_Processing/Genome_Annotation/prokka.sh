#!/bin/bash

cat NCBI_contigs_redo.txt |while read line; do

prokka --outdir "$line"_prokka --prefix "$line" "$line"_contigs.fasta --centre X --compliant

done
