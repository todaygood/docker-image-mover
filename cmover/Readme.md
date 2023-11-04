
[root@pcentos cmover]# ./01-pull.sh
[root@pcentos cmover]# ./02-save.sh
[root@pcentos cmover]# ls
01-pull.sh  02-save.sh  03-push.sh  image-list.txt  out  Readme.md
[root@pcentos cmover]# ls out/
alpine-3.14.tar  alpine-3.15.0.tar  image-list.txt

[root@pcentos cmover]# ./03-push.sh
skopeo copy docker-archive:///root/docker-image-mover/cmover/out/alpine-3.14.tar  docker://pastack-registry.paic.com.cn/library/alpine:3.14
Getting image source signatures
Copying blob 1a058d5342cc skipped: already exists
Copying config 0a97eee804 done
Writing manifest to image destination
Storing signatures
skopeo copy docker-archive:///root/docker-image-mover/cmover/out/alpine-3.15.0.tar  docker://pastack-registry.paic.com.cn/alpine:3.15.0
Getting image source signatures
Copying blob 8d3ac3489996 skipped: already exists
Copying config c059bfaa84 done
Writing manifest to image destination
Storing signatures
