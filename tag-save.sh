#!/bin/bash
set -x
out_dir=$(pwd)/out
mkdir -p $out_dir

cp mirrored-image-list.txt $out_dir

new_registry=$1
# new_registry=${1:"registry.hujun.com"}

while read line  || [[ -n ${line} ]]
do
    image_name=$(echo $line | awk -F: '{print $1}')

    if echo $image_name | grep -q "\." 
    then
            str1=$(echo $image_name| awk -F"/" '{print $1}')
            str2=$(echo $image_name| awk -F"$str1" '{print $2}')
            image_name="${new_registry}"$str2
    else 
            image_name="${new_registry}/"$image_name
    fi 
    
    image_version=$(echo $line | awk -F: '{print $2}')

    docker tag ${line}  $image_name:$image_version 

done < mirrored-image-list.txt


