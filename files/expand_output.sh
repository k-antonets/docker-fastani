#!/bin/bash

input=$1

function get_name() {
ifile=$1

line=$(awk 'NR==1{print $2"_"$3"_"$4"_"$5"_"$6"_"$7}' $ifile)

if [ $(sed 's/_//g' $line) != '' ]; then
       line=$ifile
fi

return $line
}

while read line; do
	IFS=' ' read -r -a fields <<< "$line"
	ifile="${fields[1]}"
	ofile="${fields[2]}"

	iname=$(get_name($ifile))
	oname=$(get_name($ofile))

	echo "${line} $iname $oname"

done < $input
