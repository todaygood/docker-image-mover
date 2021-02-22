#!/bin/bash

while read line
do

    echo $line
    docker pull $line 

done < image-list.txt



