#!/usr/bin/env python3

def replace_registry(imageUrl):
    with open("domain_mirror.txt",'r',encoding='utf-8')  as fh:
        mirror_lists=fh.readlines()
        fh.close()

    registry_mirror_dict={}

    for line in mirror_lists:
        line = line.rstrip()
        pos= line.find("=")
        if pos < 0: 
            print("error: line must be like 'a=b'")
            return 
        
        src_registry = line[0:pos]
        dest_registry = line[pos+1:len(line)].rstrip()
        registry_mirror_dict[src_registry] = dest_registry    

     
    str_list= imageUrl.split(":")

    # handle: docker.m.daocloud.io/calico/cni
    if len(str_list) == 1 :
        imageUrl +=":latest"

    name = str_list[0].split("/")
    pos2 = name[0].find('.')

    # handle: alpine:3.0
    if pos2 < 0:
        new_imageUrl = "m.daocloud.io/"+ imageUrl     
    else:  
        for src_registry,dest_registry in registry_mirror_dict.items():
            if name[0] == src_registry:
                new_imageUrl= imageUrl.replace(src_registry,dest_registry)
                continue

    return new_imageUrl


with open("image-list.txt",'r',encoding='utf-8') as fh:
    lines = fh.readlines()
    
    mirrored_image_list =[]

    for image in lines:
        image = image.rstrip()
        mirrored_image = replace_registry(image) 
        mirrored_image_list.append(mirrored_image)

    fh.close()


with open("mirrored-image-list.txt",'w+',encoding='utf-8') as mfh:
    for i, image in enumerate(mirrored_image_list):
        if i != len(mirrored_image_list)-1:
            mfh.write(image+"\n")
        else:
            mfh.write(image)
    
    mfh.close()





