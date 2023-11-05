# docker-image-mover

批量转移image,从一个库转移到另外一个库中，batch-move-image-between-registry

mirror image 是从 https://github.com/DaoCloud/public-image-mirror 获得，[参见registry site替换](./domain_mirror.txt)


##  Prerequisites

installed docker, skopeo ,python3 

## Quickstart 

1. edit image-list.txt 

2. 00-mirror.sh 

3. 01-pull.sh

4. 02-save.sh

5. 03-push.sh  new_registry


```bash
[root@pcentos docker-image-mover]# ./03-push.sh  pastack-registry.paic.com.cn
/usr/bin/skopeo
skopeo copy docker-archive:///root/docker-image-mover/out/cni-v3.26.3.tar  docker://pastack-registry.paic.com.cn/calico/cni:v3.26.3
Getting image source signatures
Copying blob a6c32b08bf2b done
Copying blob 12c4bbe57ef6 done
Copying blob 2d5ea3644a46 done
Copying blob ba2f9db4970a done
Copying blob 12655f7f7839 done
Copying blob c0223a8035c1 done
Copying blob 2a200d399ae4 done
Copying blob 8df6bd1ca1ee done
Copying blob db2f02c7410e done
Copying blob c320177a6d03 done


```


