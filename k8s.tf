resource "kubernetes_namespace" "metrics_server" {
  # Create a kubernetes_namespace resource so Helm can deploy resource to
  # the specified namespace

  depends_on = [var.mod_dependency]
  count      = (var.enabled && var.k8s_namespace != "kube-system") ? 1 : 0

  metadata {
    name = var.k8s_namespace
  }
}
