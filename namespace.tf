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

resource "kubernetes_namespace" "cicd-namespace"{
  metadata {
    name = "cicd-namespace"
    labels = {
      purpose = "cicd"
    }
  }
}