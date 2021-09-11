# kubernetes二进制文件下载及镜像仓库下载

kubernetes v1.20.10的镜像

```bash
# kubeadm config images list
I0910 17:23:49.162118   27015 version.go:254] remote version is much newer: v1.22.1; falling back to: stable-1.20
k8s.gcr.io/kube-apiserver:v1.20.10
k8s.gcr.io/kube-controller-manager:v1.20.10
k8s.gcr.io/kube-scheduler:v1.20.10
k8s.gcr.io/kube-proxy:v1.20.10
k8s.gcr.io/pause:3.2
k8s.gcr.io/etcd:3.4.13-0
k8s.gcr.io/coredns:1.7.0

```

kubernetes二进制文件下载及镜像仓库下载；

kubernetes v1.20.10的镜像，在下载容器`docker pull quelle/kubenetes-download:v1.20.10`时，前面四个都在server里面包含了，只需要下载后面的pause,etcd,coredns，dashboard四个就可以了。

```bash
k8s.gcr.io/kube-apiserver:v1.20.10
k8s.gcr.io/kube-controller-manager:v1.20.10
k8s.gcr.io/kube-scheduler:v1.20.10
k8s.gcr.io/kube-proxy:v1.20.10
k8s.gcr.io/pause:3.2
k8s.gcr.io/etcd:3.4.13-0
k8s.gcr.io/coredns:1.7.0
k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
kubernetesui/metrics-scraper:v1.0.4
kubernetesui/dashboard:v2.0.1
```

后面四个利用docker pull 对应的镜像就可以下载，然后利用docker tag 命令打标签。

```bash
docker pull kubernetesui/metrics-scraper:v1.0.4
docker pull kubernetesui/dashboard:v2.0.1

docker pull quelle/pause:3.2
docker pull quelle/k8setcd:3.4.13-0
docker pull quelle/coredns:1.7.0
docker pull quelle/k8s-dns-kube-dns:1.15.10
docker pull quelle/k8s-dns-dnsmasq-nany:1.15.10
docker pull quelle/k8s-dns-sidecar:1.15.10

docker tag quelle/pause:3.2 k8s.gcr.io/pause:3.2
docker tag quelle/k8setcd:3.4.13-0 k8s.gcr.io/etcd:3.4.13-0
docker tag quelle/coredns:1.7.0 k8s.gcr.io/coredns:1.7.0
docker tag quelle/k8s-dns-kube-dns:1.15.10 k8s.gcr.io/k8s-dns-kube-dns:1.15.10
docker tag quelle/k8s-dns-dnsmasq-nany:1.15.10 k8s.gcr.io/k8s-dns-dnsmasq-nany:1.15.10
docker tag quelle/k8s-dns-sidecar:1.15.10 k8s.gcr.io/k8s-dns-sidecar:1.15.10

docker save kubernetesui/metrics-scraper:v1.0.4 kubernetesui/dashboard:v2.0.1 k8s.gcr.io/k8s-dns-sidecar:1.15.10 k8s.gcr.io/k8s-dns-dnsmasq-nany:1.15.10 k8s.gcr.io/k8s-dns-kube-dns:1.15.10 k8s.gcr.io/coredns:1.7.0 k8s.gcr.io/etcd:3.4.13-0 k8s.gcr.io/pause:3.2 > k8s-images-v1.20.10-addons.tar

docker save k8s.gcr.io/k8s-dns-kube-dns:1.15.10 k8s.gcr.io/k8s-dns-dnsmasq-nany:1.15.10 k8s.gcr.io/k8s-dns-sidecar:1.15.10 > k8s-dns-1.15.10.tar
docker save kubernetesui/metrics-scraper:v1.0.4 kubernetesui/dashboard:v2.0.1 > k8s-dashboard-v1.20.10.tar
docker save k8s.gcr.io/coredns:1.7.0 k8s.gcr.io/etcd:3.4.13-0 k8s.gcr.io/pause:3.2 > k8s-pause-etcd-coredns-v1.20.10.tar

docker pull quelle/projectcalico-org-cni:v3.3.1
docker pull quelle/cpvpa-amd64:v0.6.0
docker pull quelle/projectcalico-org-node:v3.3.1
docker pull quelle/nvidia-gpu-device-plugin:d18b678437fedc4ec4211c20b3e5469a137a44f989da43dc275e4f2678170db4

docker tag quelle/kubernetes-dashboard-amd64:v1.10.1 k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
docker tag quelle/projectcalico-org-cni:v3.3.1  gcr.io/projectcalico-org/cni:v3.3.1
docker tag quelle/cpvpa-amd64:v0.6.0 k8s.gcr.io/cpvpa-amd64:v0.6.0
docker tag quelle/projectcalico-org-node:v3.3.1 gcr.io/projectcalico-org/node:v3.3.1
docker tag quelle/nvidia-gpu-device-plugin:d18b678437fedc4ec4211c20b3e5469a137a44f989da43dc275e4f2678170db4 k8s.gcr.io/nvidia-gpu-device-plugin@sha256:d18b678437fedc4ec4211c20b3e5469a137a44f989da43dc275e4f2678170db4





gcr.io/projectcalico-org/node:v3.3.1
gcr.io/projectcalico-org/cni:v3.3.1
k8s.gcr.io/cpvpa-amd64:v0.6.0
k8s.gcr.io/nvidia-gpu-device-plugin@sha256:d18b678437fedc4ec4211c20b3e5469a137a44f989da43dc275e4f2678170db4
```
