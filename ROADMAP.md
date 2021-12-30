# RoadMap

Approxmate version and targets


## [0.0.1]

- Integration with [gitpod-k8s](https://github.com/ssmiller25/gitpod-k8s) for Development Ease

## [0.0.5]

- Terraform buildout/task in style of [tn-free](https://github.com/gruberdev/tf-free) for Civo Cloud

## [0.1.0]

- Testing framework of some type for docker and infra code
- CI/CD pipelines for container builds

## [0.2.0]

- Managed K8S Clusters on AWS/Azure/GCP [tn-free](https://github.com/gruberdev/tf-free) 

## [0.3.0]

- K8S Cluster on Oracle Cloud

## [1.0.0]

These may probably be broken into sub-release versions


- Leverage [tn-free](https://github.com/gruberdev/tf-free) where possible (although we are concentrating more on k8s/serverless)
- K8S Clusters and sample apps across multiple platforms
- Serverless example apps, across mutliple platforms
- KubeMonkey for chaos testing
- Prometheus/grafana stack, ready to deploy
- ArgoCD, ready to deploy
- Trivy for container image scanning
- Checkov for IaC code security scanning
- Kubescape for k8s configuration security scanning
- k8sup for backup (https://github.com/k8up-io/k8up)