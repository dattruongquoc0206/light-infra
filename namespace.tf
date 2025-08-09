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

resource "kubernetes_namespace" "cicd_namespace"{
  metadata {
    name = "cicd_namespace"
    labels = {
      purpose = "cicd"
    }
  }
}