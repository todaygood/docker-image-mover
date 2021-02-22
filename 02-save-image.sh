#!/bin/bash

while read line
do
    image_name=$(echo $line | awk -F: '{print $1}')

    if echo $image_name | grep -q "\." 
    then
	    str1=$(echo $image_name| awk -F"/" '{print $1}')
	    str2=$(echo $image_name| awk -F"$str1" '{print $2}')
	    image_name="pastack-registry.paic.com.cn"$str2
    else 
	    image_name="pastack-registry.paic.com.cn/"$image_name
    fi 
    
    short_name=$(echo $image_name| awk -F"/" '{print $NF}')

    image_version=$(echo $line | awk -F: '{print $2}')

    short_image_name_version=$short_name-$image_version

    echo $image_name:$image_version $short_image_name_version
    docker tag $line  $image_name:$image_version
    docker save $image_name:$image_version  > $short_image_name_version.tar

done < image-list.txt



