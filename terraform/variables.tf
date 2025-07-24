variable "cluster_name" {
  type        = string
  description = "The name of the Kubernetes cluster where Kyverno will be deployed."
}

variable "cluster_driver" {
  type        = string
  description = "The infrastructure or cloud provider driver used for the Kubernetes cluster (e.g., EKS, GKE, AKS, kind, minikube)."
}

variable "cluster_version" {
  type        = string
  description = "The version of the Kubernetes cluster to ensure compatibility with Kyverno."
}

variable "cluster_addons" {
  type        = list(string)
  description = "A list of additional cluster add-ons or components to be deployed along with Kyverno (e.g., metrics-server, ingress controllers)."
}

variable "helm_name" {
  type        = string
  description = "The Helm release name for deploying the Kyverno chart."
}

variable "helm_namespace" {
  type        = string
  description = "The Kubernetes namespace where Kyverno will be installed using Helm."
}

variable "helm_repository" {
  type        = string
  description = "The URL of the Helm repository containing the Kyverno chart."
}

variable "helm_chart" {
  type        = string
  description = "The name of the Kyverno Helm chart to be installed."
}

variable "helm_version" {
  type        = string
  description = "The specific version of the Kyverno Helm chart to deploy."
}
