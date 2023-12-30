#!/bin/bash

mkdir -p bak/
cp image-list.txt  bak/image-list.txt-`date '+%Y%m%d%H%M%S'`
cp mirrored-image-list.txt   bak/mirrored-image-list.txt-`date '+%Y%m%d%H%M%S'`

chmod a+x *.py 

./replace-with-mirror.py

