module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.6.0"

  name               = "metrics-server-vpc"
  cidr               = "10.0.0.0/16"
  azs                = ["eu-central-1a", "eu-central-1b"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
}

module "eks_cluster" {
  source  = "cloudposse/eks-cluster/aws"
  version = "0.43.2"

  region     = "eu-central-1"
  subnet_ids = module.vpc.public_subnets
  vpc_id     = module.vpc.vpc_id
  name       = "metrics-server"
}

module "eks_node_group" {
  source  = "cloudposse/eks-node-group/aws"
  version = "0.25.0"

  cluster_name   = "metrics-server"
  instance_types = ["t3.medium"]
  subnet_ids     = module.vpc.public_subnets
  min_size       = 1
  desired_size   = 1
  max_size       = 2
  depends_on     = [module.eks_cluster.kubernetes_config_map_id]
}

module "metrics_server_disabled" {
  source = "../../"

  enabled = false
}

module "metrics_server" {
  source = "../../"

  enabled           = true
  argo_enabled      = false
  argo_helm_enabled = false

  helm_release_name = "metrics-server"
  namespace         = "kube-system"

  values = yamlencode({
    "podLabels" : {
      "app" : "test-metrics-server"
    }
  })

  helm_timeout = 240
  helm_wait    = true
}

module "metrics_server_argo_kubernetes" {
  source = "../../"

  enabled           = true
  argo_enabled      = true
  argo_helm_enabled = false

  helm_release_name = "metrics-server"
  namespace         = "kube-system"

  argo_sync_policy = {
    "automated" : {}
    "syncOptions" = ["CreateNamespace=true"]
  }
}

module "metrics_server_argo_helm" {
  source = "../../"

  enabled           = true
  argo_enabled      = true
  argo_helm_enabled = true

  helm_release_name = "metrics-server"
  namespace         = "kube-system"

  argo_namespace = "argo"
  argo_sync_policy = {
    "automated" : {}
    "syncOptions" = ["CreateNamespace=true"]
  }
}
