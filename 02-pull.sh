#!/bin/bash

while read line  || [[ -n ${line} ]]
do

    echo $line
    docker pull $line 

done < mirrored-image-list.txt



