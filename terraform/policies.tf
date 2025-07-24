locals {
  policy_files = fileset("${path.module}/policies", "**/*.yaml")

  policies = {
    for file in local.policy_files : file => file("${path.module}/policies/${file}")
  }
}

resource "kubectl_manifest" "policies" {
  for_each  = local.policies
  yaml_body = each.value

  depends_on = [
    minikube_cluster.cluster,
    helm_release.kyverno
  ]
}
