# EKS cluster with eksctl

Not **quite** as IaC as I'd like, but works fairly well.

Usage:
```sh
eksctl create cluster -f basic-cluster.yaml
aws eks update-kubeconfig --name toolbox-eksctl
```

To destry

```sh
eksctl delete cluster -f basic-cluster.yaml
```