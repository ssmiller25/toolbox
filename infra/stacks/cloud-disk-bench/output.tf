output "civo_kubeconfig" {
  value = civo_kubernetes_cluster.diskbench-cluster.kubeconfig
  sensitive = true
}