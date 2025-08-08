provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "api" {
  metadata {
    name = "api"
    labels = {
      purpose = "api"
    }
  }
}
