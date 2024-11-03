#!/usr/bin/env python3

from Bio import SeqIO
import os

def filter_sequences(input_file, output_file):
    # Open the input and output files
    with open(input_file, "r") as input_handle, open(output_file, "w") as output_handle:
        # Iterate over the sequences in the input file
        for record in SeqIO.parse(input_handle, "fasta"):
            # Check sequence length
            if len(record.seq) >= 200:
                # Write the sequence to the output file
                SeqIO.write(record, output_handle, "fasta")

# Specify the file path containing the list of input files
file_list_path = "/media/haley/My Book/Gonorrhea_Jo-Anne/NG_fastq_output/Chrom_AssemblyTrimmedReads/06272023_NCBI_contigs/contigs.txt"

# Read the list of input files from the file
with open(file_list_path, "r") as file_list:
    # Iterate over the input files
    for line in file_list:
        # Remove leading/trailing whitespaces and newline characters
        input_file_path = line.strip()

        # Generate the output file path based on the input file path
        output_file_path = os.path.splitext(input_file_path)[0] + ".filtered.fasta"

        # Filter sequences and write to the output file
        filter_sequences(input_file_path, output_file_path)
        print("Filtered sequences from:", input_file_path)

print("All files processed.")
