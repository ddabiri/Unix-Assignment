#!/bin/bash

for i in {1..10}; do
    input_file="teosinte-group_with_snp.txt"
    output_file="maize_chrom_unknown_${i}_decreasing.txt"
    
    awk -v pattern="/$i/" '$2 ~ pattern {print}' "$input_file" | sort -k3,3n > "$output_file"
done

# Concatenate all individual files into a single increasing order file
cat maize_chrom_unknown_*_decreasing.txt | sort -k3,3n > maize_chrom_unknown_increasing.txt

# Clean up intermediate files
rm maize_chrom_unknown_*_decreasing.txt

