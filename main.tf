/**
 * # AWS EKS Metrics Server Terraform module
 *
 * A Terraform module to deploy the [metrics-server](https://github.com/kubernetes-sigs/metrics-server) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/pre-commit.yaml)
 */
locals {
  addon = {
    name      = "metrics-server"
    namespace = "kube-system"

    helm_chart_version = "3.12.2"
    helm_repo_url      = "https://kubernetes-sigs.github.io/metrics-server"
  }

  addon_values = yamlencode({})

  addon_depends_on = []
}
