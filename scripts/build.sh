#!/bin/bash

cwd=$CWD

cd ../files

docker build . -t fastANI:latest

docker build . -f One2Many -t fastANI_One2Many:latest

docker build . -f Many2Many -t fastANI_Many2Many:latest

cd $CWD
