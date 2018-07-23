#!/bin/bash

input_dir=$1
ref_dir=$2
fastANI_dir=$3
output_dir=$4

contigs=$(awk -vORS=' ' '{print $1}' $fastANI_dir/fastANI.out.refs | sed 's/,$//')

refs=$(awk -vORS=, '{print $2}' $fastANI_dir/fastANI.out.refs | sed 's/,$//')

docker run --rm -it \
	-v $input_dir:/input \
       	-v $ref_dir:/reference \
	-v $output_dir:/output \
	quast:4.6.3 python /quast/metaquast.py $contigs -R $refs -o /output
