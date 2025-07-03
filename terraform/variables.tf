variable "cluster_name" {
  type = string
}

variable "cluster_driver" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "cluster_addons" {
  type = list(string)
}

variable "helm_name" {
  type = string
}

variable "helm_namespace" {
  type = string
}

variable "helm_repository" {
  type = string
}

variable "helm_chart" {
  type = string
}

variable "helm_version" {
  type = string
}
