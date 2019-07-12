下载kubernetes二进制文件

docker pull quelle/k8setcd:3.3.10
docker pull quelle/coredns:1.3.1
docker pull quelle/pause:3.1

docker tag quelle/k8setcd:3.3.10 k8s.gcr.io/etcd:3.3.10
docker tag quelle/coredns:1.3.1 k8s.gcr.io/coredns:1.3.1
docker tag quelle/pause:3.1 k8s.gcr.io/pause:3.1

docker save k8s.gcr.io/etcd:3.3.10 k8s.gcr.io/coredns:1.3.1 k8s.gcr.io/pause:3.1 > k8s-etcd-coredns-pause.tar