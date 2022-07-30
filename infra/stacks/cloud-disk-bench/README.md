# Disk benchmark work

See [docs/k8s-cloud-bench.md](/docs/k8s-cloud-bench.md) for more details

Deployment disk benchmarks across a few cloud providers in a consistent manner.

Can get sensitive values by using `civo output -json`  For example, to get the kubeconfig for the civo cluster

```sh
terraform output -json | jq -r .civo_kubeconfig.value
```

To login to eks cluster after apply

```sh
aws eks update-kubeconfig --name diskbench-aws
```

