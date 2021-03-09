# metrics-server

variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled"
}

# Helm

variable "helm_chart_name" {
  type        = string
  default     = "metrics-server"
  description = "Helm chart name to be installed"
}

variable "helm_chart_version" {
  type        = string
  default     = "5.7.2"
  description = "Version of the Helm chart"
}

variable "helm_release_name" {
  type        = string
  default     = "metrics-server"
  description = "Helm release name"
}

variable "helm_repo_url" {
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
  description = "Helm repository"
}

# K8s

variable "k8s_namespace" {
  type        = string
  default     = "kube-system"
  description = "The K8s namespace in which the metrics-server service account has been created"
}

variable "mod_dependency" {
  type        = bool
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable"
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://hub.helm.sh/charts/stable/metrics-server"
}
