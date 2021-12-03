#!/bin/bash

cwd=$CWD

cd ../files

docker build . --no-cache -t fastani:latest $1

docker build . -f One2Many -t fastani_one2many:latest $1

docker build . -f Many2Many -t fastani_many2many:latest $1

cd $CWD
