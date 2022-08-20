# Steve Miller's Toolbox

A variety of tools and configurations that I find useful.  Most follow a Unix phylosophy of small, relatively independent tools that can be applied quickly.

## Directory Layout

- .github: Workflows to build/test all below
- docker: Useful Docker containers and templates
- packer: For any custom image buildes necessary
- terraform: Primary IaC tool
- k8s:
  - manifests: Individual k8s "applications.  Should be "kustomize" applicable applicatons.  Helm charts should be exploded with "helm template", but with a Makefile that can be used to regenerate if necessary
  - clusters: Example "clusters".  Kustomize of apps above
- scripts: Collection of random scripts 

## Tools

- [Github Starter Workflows](https://github.com/actions/starter-workflows): Good starting point in most cases
- [act](https://github.com/nektos/act): Run github actions locally.

## Central Components

- [Docker](https://www.docker.com/) - Allow for easily bundling and extracting resources to single use containers
- [12 Factor App](https://12factor.net/) - Try to ensure all toolbox components are designed with a 12 factor mentality in mind.  Sometimes difficult in deep debugging situation, btu still an admirable goal.
- [Kubernetes Patterns EBook (PDF)](https://www.redhat.com/cms/managed-files/cm-oreilly-kubernetes-patterns-ebook-f19824-201910-en.pdf) - Great overview of Kubernetes primatives and how to apply then to a variety of problems.

## Debugging Tools

- [Netshoot](https://github.com/nicolaka/netshoot): General purpose docker container useful for a variety of network and system debugging
- [kubectl debug](https://github.com/aylei/kubectl-debug): Plugin to allow debug containers to be spun up in same namespace as pod you wish to debug.

## Practice Environments

Always good to have an example "app" to practice deployments and debugging.

- [Java Based: Java Shopping](https://github.com/danielbryantuk/oreilly-docker-java-shopping)
- [Python/Java Based: Bank of Anthos](https://github.com/GoogleCloudPlatform/bank-of-anthos) - also against a PostgreSQL database.  Primarily REST based called between services.
- [Polygot: Online Boutique](https://github.com/ssmiller25/cloudnativeapp) - True Polygot Application, with Microservices written in Python, Go, C#, Java and Node.  Primarily gRPC calls between services.  My hard fork of [Google's MicroService Demo](https://github.com/GoogleCloudPlatform/microservices-demo)
