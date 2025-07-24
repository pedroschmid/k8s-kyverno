provider "minikube" {
  kubernetes_version = var.cluster_version
}

provider "helm" {
  kubernetes = {
    host = minikube_cluster.cluster.host

    client_certificate     = minikube_cluster.cluster.client_certificate
    client_key             = minikube_cluster.cluster.client_key
    cluster_ca_certificate = minikube_cluster.cluster.cluster_ca_certificate
  }
}

provider "kubectl" {
  host = minikube_cluster.cluster.host

  client_certificate     = minikube_cluster.cluster.client_certificate
  client_key             = minikube_cluster.cluster.client_key
  cluster_ca_certificate = minikube_cluster.cluster.cluster_ca_certificate

  load_config_file = false
}
