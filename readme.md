下载kubernetes二进制文件

kubernetes二进制文件下载及镜像仓库下载；

kubernetes v1.15.0的镜像，在下载容器`docker pull quelle/kubenetes-download:v1.15.0`时，前面四个都在server里面包含了，只需要下载后面的pause,etcd,coredns，dashboard四个就可以了。
后面四个利用docker pull 对应的镜像就可以下载，然后利用docker tag 命令打标签。

```bash
docker pull quelle/kubernetes-dashboard-amd64:v1.10.1
docker pull quelle/pause:3.1
docker pull quelle/k8setcd:3.3.10
docker pull quelle/coredns:1.3.1
docker tag quelle/kubernetes-dashboard-amd64:v1.10.1 k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
docker tag quelle/pause:3.1 k8s.gcr.io/pause:3.1
docker tag quelle/k8setcd:3.3.10 k8s.gcr.io/etcd:3.3.10
docker tag quelle/coredns:1.3.1 k8s.gcr.io/coredns:1.3.1
```

```bash
k8s.gcr.io/kube-apiserver:v1.15.0
k8s.gcr.io/kube-controller-manager:v1.15.0
k8s.gcr.io/kube-scheduler:v1.15.0
k8s.gcr.io/kube-proxy:v1.15.0
k8s.gcr.io/pause:3.1
k8s.gcr.io/etcd:3.3.10
k8s.gcr.io/coredns:1.3.1
k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
```
