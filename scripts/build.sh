#!/bin/bash

cwd=$CWD

cd ../files

docker build . -t fastani:latest

docker build . -f One2Many -t fastani_one2many:latest

docker build . -f Many2Many -t fastani_many2many:latest

cd $CWD
