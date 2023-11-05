# docker-image-mover

batch downloading  docker images from mirrored registry especially in China.

mirror image registry is from https://github.com/DaoCloud/public-image-mirror, thanks to DaoCloud.


##  Prerequisites

installed docker, skopeo ,python3 

## Quickstart 

1. new create file "image-list.txt", then input image list like:

```bash
busybox
ghcr.io/kube-vip/kube-vip:v0.6.3
docker.io/calico/csi:v3.26.3
```


2. run 00-mirror.sh, it will generate another file named "mirrored-image-list.txt".

3. run 01-pull.sh, it will pull images with `docker pull`.

4. run 02-save.sh, it will save images to `out` directory.

5. run 03-push.sh  new_registry, it will push images to a new registry.

6. run 04-clean.sh, it will clean local images if you want to. 


```bash
[root@pcentos docker-image-mover]# ./03-push.sh  registry.hujun.com
/usr/bin/skopeo
skopeo copy docker-archive:///root/docker-image-mover/out/cni-v3.26.3.tar  docker://registry.hujun.com/calico/cni:v3.26.3
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


