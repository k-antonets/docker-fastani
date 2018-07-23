#!/bin/bash

query=$(/root/FastANI/prepare_list.sh /input | head -n 1)

/root/FastANI/prepare_list.sh /reference > /root/FastANI/ref.list

cd /root/FastANI

./fastANI -q $query --rl ./ref.list -o /output/fastANI.out

./expand_output.sh /output/fastANI.out > /output/fastANI.out.expanded

./get_refs.sh $query /root/FastANI/ref.list > /output/fastANI.out.refs
