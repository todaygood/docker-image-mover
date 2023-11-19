#!/bin/bash



while read line  || [[ -n ${line} ]]
do
    image_name=$(echo $line | awk -F: '{print $1}')

    short_name=$(echo $image_name| awk -F"/" '{print $NF}')

    image_version=$(echo $line | awk -F: '{print $2}')

    short_image_name_version=$short_name-$image_version

    echo $image_name:$image_version $short_image_name_version
    docker rmi $image_name:$image_version  

done < mirrored-image-list.txt



