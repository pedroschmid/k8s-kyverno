resource "minikube_cluster" "docker" {
  cluster_name = var.cluster_name
  driver       = var.cluster_driver
  addons       = var.cluster_addons
}
