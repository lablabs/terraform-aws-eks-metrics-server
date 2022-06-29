# Basic example

The code in this example shows how to use the module with basic configuration and minimal set of other resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | cloudposse/eks-cluster/aws | 0.43.2 |
| <a name="module_eks_node_group"></a> [eks\_node\_group](#module\_eks\_node\_group) | cloudposse/eks-node-group/aws | 0.25.0 |
| <a name="module_metrics_server"></a> [metrics\_server](#module\_metrics\_server) | ../../ | n/a |
| <a name="module_metrics_server_argo_helm"></a> [metrics\_server\_argo\_helm](#module\_metrics\_server\_argo\_helm) | ../../ | n/a |
| <a name="module_metrics_server_argo_kubernetes"></a> [metrics\_server\_argo\_kubernetes](#module\_metrics\_server\_argo\_kubernetes) | ../../ | n/a |
| <a name="module_metrics_server_disabled"></a> [metrics\_server\_disabled](#module\_metrics\_server\_disabled) | ../../ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
