/**
 * # AWS EKS metrics server Terraform module
 *
 * A terraform module to deploy a [metrics-server](https://github.com/kubernetes-sigs/metrics-server) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/validate.yaml/badge.svg?branch=main)](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/pre-commit.yml/badge.svg?branch=main)](https://github.com/lablabs/terraform-aws-eks-metrics-server/actions/workflows/pre-commit.yml)
 */

locals {

  addon = {
    name      = "metrics-server"
    namespace = "kube-system"

    helm_chart_version = "3.12.2"
    helm_repo_url      = "https://kubernetes-sigs.github.io/metrics-server"
  }

  addon_values = yamlencode({
  })

  addon_depends_on = []
}
