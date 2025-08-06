resource "kubernetes_namespace" "api" {
  metadata {
    name = "api"
    labels = {
      purpose = "api"
    }
  }
}
