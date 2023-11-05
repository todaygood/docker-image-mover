#!/bin/bash

mv image-list.txt  bak/image-list.txt-`date '+%Y%m%d%H%M%S'`
mv mirrored-image-list.txt   bak/mirrored-image-list.txt-`date '+%Y%m%d%H%M%S'`


python3 mirror-image.py 

