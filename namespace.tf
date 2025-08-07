provider "kubernetes" {
  config_path = "${path.module}/kubeconfig.yaml"
}

resource "kubernetes_namespace" "api" {
  metadata {
    name = "api"
    labels = {
      purpose = "api"
    }
  }
}
