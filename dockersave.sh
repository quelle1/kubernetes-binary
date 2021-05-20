#!/bin/bash
# images pull
docker pull kubernetesui/metrics-scraper:v1.0.4
docker pull kubernetesui/dashboard:v2.0.1

docker pull quelle/pause:3.2
docker pull quelle/k8setcd:3.4.9-1
docker pull quelle/coredns:1.7.0
docker pull quelle/k8s-dns-kube-dns:1.15.10
docker pull quelle/k8s-dns-dnsmasq-nany:1.15.10
docker pull quelle/k8s-dns-sidecar:1.15.10

docker tag quelle/pause:3.2 k8s.gcr.io/pause:3.2
docker tag quelle/k8setcd:3.4.9-1 k8s.gcr.io/etcd:3.4.9-1
docker tag quelle/coredns:1.7.0 k8s.gcr.io/coredns:1.7.0
docker tag quelle/k8s-dns-kube-dns:1.15.10 k8s.gcr.io/k8s-dns-kube-dns:1.15.10
docker tag quelle/k8s-dns-dnsmasq-nany:1.15.10 k8s.gcr.io/k8s-dns-dnsmasq-nany:1.15.10
docker tag quelle/k8s-dns-sidecar:1.15.10 k8s.gcr.io/k8s-dns-sidecar:1.15.10

# images load
docker save k8s.gcr.io/k8s-dns-kube-dns:1.15.10 k8s.gcr.io/k8s-dns-dnsmasq-nany:1.15.10 k8s.gcr.io/k8s-dns-sidecar:1.15.10 > k8s-dns-1.15.10.tar
docker save kubernetesui/metrics-scraper:v1.0.4 kubernetesui/dashboard:v2.0.1 > k8s-dashboard-v1.19.4.tar
docker save k8s.gcr.io/coredns:1.7.0 k8s.gcr.io/etcd:3.4.9-1 k8s.gcr.io/pause:3.2 > k8s-pause-etcd-coredns-v1.19.4.tar

docker save k8s.gcr.io/kube-apiserver:v1.19.4   k8s.gcr.io/kube-controller-manager:v1.19.4 k8s.gcr.io/kube-scheduler:v1.19.4 k8s.gcr.io/kube-proxy:v1.19.4 k8s.gcr.io/pause:3.2 k8s.gcr.io/etcd:3.4.9-1 k8s.gcr.io/coredns:1.7.0 > k8s-pause-etcd-coredns-v1.19.4.tar
