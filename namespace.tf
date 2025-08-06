provider "kubernetes" {
  config_path = "kubeconfig.yaml"
}

resource "kubernetes_namespace" "api" {
  metadata {
    name = "api"
    labels = {
      purpose = "api"
    }
  }
}
