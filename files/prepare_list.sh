#!/bin/bash

input_dir=$1

if [ -f $input_dir/genomes.list ]; then 
	cat $input_dir/genomes.list
else
	find $input_dir -type f -regextype posix-extended -regex '^.*(fasta|fna)$'
fi
