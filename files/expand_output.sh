#!/bin/bash

input=$1

function get_name() {
local ifile=$1

local line=$(awk 'NR==1{print $2"_"$3"_"$4"_"$5"_"$6"_"$7}' $ifile)

if [ "$(echo $line | sed 's/_//g')" == '' ]; then
       echo "$ifile"
else
       echo "$line"
fi
}

while read line; do
	IFS=$'\t' read -r -a fields <<< "$line"
	ifile="${fields[0]}"
	ofile="${fields[1]}"

	iname=$(get_name $ifile)
	oname=$(get_name $ofile)

	echo "${line} $iname $oname"

done < $input
