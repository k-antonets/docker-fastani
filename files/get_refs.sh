#!/bin/bash

inpfile=$1
outfile=$2

grep $inpfile $outfile | awk 'NR==1{print $2}'

