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

resource "kubernetes_namespace" "monitor-namespace"{
  metadata {
    name = "monitor-namespace"
    labels = {
      purpose = "monitoring"
    }
  }
}


resource "kubernetes_namespace" "ingress-namespace-new"{
  metadata {
    name = "ingress-namespace-new"
    labels = {
      purpose = "ingress"
    }
  }
}