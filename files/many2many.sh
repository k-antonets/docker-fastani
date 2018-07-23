#!/bin/bash

/root/FastANI/prepare_list.sh /input > /root/FastANI/query.list

/root/FastANI/prepare_list.sh /reference > /root/FastANI/ref.list

cd /root/FastANI

./fastANI -ql ./query.list --rl ./ref.list -o /output/fastANI.out

./expand_output.sh /output/fastANI.out > /output/fastANI.out.expanded