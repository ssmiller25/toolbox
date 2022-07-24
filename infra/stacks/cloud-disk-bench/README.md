# Disk benchmark work

Deployment disk benchmarks across a few cloud providers in a consistent manner.

Can get sensitive values by using `civo output -json`  For example, to get the kubeconfig for the civo cluster

```sh
terraform output -json | jq -r .civo_kubeconfig.value
```