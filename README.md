# Cloud Native Toolbox

A Toolbox of utilities that can be used in a cloud-native environment.  Mostly focused on the Devops Toolchain and how
various CNCF projects can be leveraged to address potential solutions at each step (or across steps)

## Quickstart

- **Opt:** Clone Repo
- Click <a href="https://gitpod.io/from-referrer/">
    <img src="https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod" alt="Gitpod ready-to-code" />
  </a>


## User Story:

- As a DevOps Engineer, quickly bring up a Kubernetes CLI/GUI app that can be run from anywhere (vscode-server with a kubectl/kustomize/helm baked in)
- As a DevOps Engineer, I need a quick "reference" for common configurations.  Should be installed relatively quickly - leveraging either the operator framework, Helm Charts, or kustomize/kubectl as necessary.
  - Quick debugging
    - Spin up a variety of debugging pods (network tools, eBPL based toosl, etc)
  - Common references for essential utilities in most K8S clusters (like [BKPR](https://github.com/vmware-archive/kube-prod-runtime), but...modern-ish) (or also like [Digital Ocean's Starter Kit](https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers)
    - [Operator Lifecycle Manager](https://olm.operatorframework.io/) - only selectivily for complex reosureces
    - Monitoring Stack
      - Promtheus Operator (Metrics) (include alerts)
      - Loki (Plain YAML or Helm?)
      - Grafana (Metrics/Logs) 
      - Pixie Operator (Tracing/Network)
    - Ingress Stack
      - Nginx Ingress Controller
      - Cert-Manager
      - Oauth2 Proxy
      - External DNS
    - Security Stack
      - [Sealed Secretes](https://github.com/bitnami-labs/sealed-secrets) - Feels the most native k8s way to do secrets without being tied to a specific backend (such as with the External Secrets operator)
      - Runtime Security: Falco
      - Configuration: Kubebench, kubehunter, 
      - Live Container Scanning: [Kube-scan](https://github.com/octarinesec/kube-scan)
    - Scaling (HPA, VPA, Cluster Auto-Scaler)
    - GitOps - FluxCD.  Prefer Flux's handing of Helm charts versus ArgoCD (the other major competitor).  Although Argo might make doing kustomize patches after a helm chart application a bit easier...
      - Although honestly, if a Helm chart isn't htat flexible, just leverage `helm template` to render the raw yaml, and massage with kustomize.   
    - Backup/Restore
      - Should MOSTLY be in the gitops repo, but a nice second layer in some circumstances
      - Useful for Sealed Secrets, as well as anything in PVs
      - Velero for the most part
- As a DevOps Engineer, need a platform to quickly test out new configuration changes:
  - Spin up clusters easily on a variety of platform (Managed K8S or k3s on IaaS )

## Overall Thoughts/Notes

- Bootstrap Methods (**Note:** ways to "bootstrap" a cluster that has a web interface for management)
  - local machine (vscode devcontainer optimized) - leverages k3d/k3s locally
  - GitHub actions directly - Initialize 
  - GitHub actions through [act](https://github.com/nektos/act)
  - Initial cluster: fairly minimal:
    - Web Interface
    - External Secrets 
    - Flux?
    - tf-controller that can spin up additional resources
    - Cluster-API?
    - 
- Pathways
  - kubectl direct application
    - GitPod environment
  - k8s cluster for primary bootstrap
    - TODO: Terraform for Civo bootstrap for "bootstrap" cluster    
    - https://github.com/garutilorenzo/k3s-aws-terraform-cluster to bootstrap on AWS
  - FluxCD for bootstrap deployment
  - clusterapi for k8s cluster deployemnts (either manually applied, or via FluxCD)
  - terraform controller https://github.com/weaveworks/tf-controller  - For other 
  - **opt:** local git repo for flux for air-gapped - gitea.  Or maybe I assume GitHub itself is available
- Targets
  - k8s debugging
  - k8s basics ... Something like bitnami production runtime, but lighter weight
  - k8s example apps.  Apps in separate repos, but implementation here

## Directory Layout

- .github: Workflows to build/test all below
- docker: Useful Docker containers and templates
- packer: For any custom image buildes necessary
- terraform: Primary IaC tool
- k8s:
    - manifests: Individual k8s "applications.  Should be "kustomize" applicable applicatons.  Helm charts should be exploded with "helm template", but with a Makefile that can be used to regenerate if necessary
      - **Might** allow use of [FluxCD Helm Controller](https://fluxcd.io/docs/components/helm/) to speed deployment of more complex packages.
    - clusters: Example "clusters".  Kustomize of apps above
- scripts: Collection of random scripts 

## Tools

- [Github Starter Workflows](https://github.com/actions/starter-workflows): Good starting point in most cases
- [act](https://github.com/nektos/act): Run github actions locally.

## Central Components

- [Docker](https://www.docker.com/) - Allow for easily bundling and extracting resources to single use containers
- [12 Factor App](https://12factor.net/) - Try to ensure all toolbox components are designed with a 12 factor mentality in mind.  Sometimes difficult in deep debugging situation, btu still an admirable goal.
- [Kubernetes Patterns EBook (PDF)](https://www.redhat.com/cms/managed-files/cm-oreilly-kubernetes-patterns-ebook-f19824-201910-en.pdf) - Great overview of Kubernetes primatives and how to apply then to a variety of problems.

## Kubernetes Core Components/Tools

- [cert-manager](https://cert-manager.io/) - SSL certificates - with Cloudflare DNS challenge
- [external-dns](https://github.com/kubernetes-sigs/external-dns)
- [prometheus-operator](https://prometheus-operator.dev/) - Metrics/Alerts
- [grafana-operator](https://github.com/grafana-operator/grafana-operator) - Graphing
- [loki](https://grafana.com/docs/loki/latest/installation/helm/) - Logging
- [echo-server](https://github.com/Ealenn/Echo-Server) - REST Server Tests (Echo-Server) API (useful for debugging HTTP issues)
- [hajimari](https://github.com/toboshii/hajimari) - start page with ingress discovery
- [reflector](https://github.com/emberstack/kubernetes-reflector) - mirror `configmap`s or `secret`s to other Kubernetes namespaces
- [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets)
- [Wireguard-Go-Docker](https://github.com/masipcat/wireguard-go-docker) - Pre-built wireguard with easy k8s deployment.  [Article here](https://blog.jamesclonk.io/posts/wireguard-on-kubernetes/)

## Debugging Tools

- [Netshoot](https://github.com/nicolaka/netshoot): General purpose docker container useful for a variety of network and system debugging
- [kubectl debug](https://github.com/aylei/kubectl-debug): Plugin to allow debug containers to be spun up in same namespace as pod you wish to debug.

## Practice Environments

Always good to have an example "app" to practice deployments and debugging.

- [Java Based: Java Shopping](https://github.com/danielbryantuk/oreilly-docker-java-shopping)
- [Python/Java Based: Bank of Anthos](https://github.com/GoogleCloudPlatform/bank-of-anthos) - also against a PostgreSQL database.  Primarily REST based called between services.
- [Polygot: Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo) - True Polygot Application, with Microservices written in Python, Go, C#, Java and Node.  Primarily gRPC calls between services.
- [Tilt: Avatars](https://github.com/tilt-dev/tilt-avatars): For testing with Tilt - Python backend/SPA frontend
