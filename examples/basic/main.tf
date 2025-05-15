module "addon_installation_disabled" {
  source = "../../"

  enabled = false
}

module "addon_installation_helm" {
  source = "../../"

  enabled           = true
  argo_enabled      = false
  argo_helm_enabled = false

  values = yamlencode({
    # insert sample values here
  })
}

# Please, see README.md and Argo Kubernetes deployment method for implications of using Kubernetes installation method
module "addon_installation_argo_kubernetes" {
  source = "../../"

  enabled           = true
  argo_enabled      = true
  argo_helm_enabled = false

  values = yamlencode({
    # insert sample values here
  })

  argo_sync_policy = {
    automated   = {}
    syncOptions = ["CreateNamespace=true"]
  }
}

module "addon_installation_argo_helm" {
  source = "../../"

  enabled           = true
  argo_enabled      = true
  argo_helm_enabled = true

  argo_sync_policy = {
    automated   = {}
    syncOptions = ["CreateNamespace=true"]
  }
}
