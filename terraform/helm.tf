resource "helm_release" "kyverno" {
  name       = var.helm_name
  namespace  = var.helm_namespace
  chart      = var.helm_chart
  repository = var.helm_repository
  version    = var.helm_version

  create_namespace = true

  depends_on = [
    minikube_cluster.cluster
  ]
}