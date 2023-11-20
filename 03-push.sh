#!/bin/bash

out_dir=$(pwd)/out
mkdir -p $out_dir

function copy-image() {
    local image1="${1:-}"
    local image2="${2:-}"

    ${SKOPEO} copy --retry-times "${RETRY}" --all --dest-tls-verify=false "docker://${image1}" "docker://${image2}"
}

which skopeo 
if [ $? != 0 ]; then 
    echo "Error, skopeo is not existed."
    exit 2 
fi 

if [ $# != 1 ]; then 
    echo "USAGE: $0 dest_registry"
    exit 1
fi 

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
    short_name=$(echo $image_name| awk -F"/" '{print $NF}')
    short_image_name_version=$short_name-$image_version	

    echo "skopeo copy docker-archive://${out_dir}/${short_image_name_version}.tar  docker://$image_name:$image_version" 
    skopeo copy docker-archive://${out_dir}/${short_image_name_version}.tar  docker://$image_name:$image_version 

done < mirrored-image-list.txt



