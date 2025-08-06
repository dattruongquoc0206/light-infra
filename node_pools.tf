resource "google_container_node_pool" "api_pool" {
  name       = "api-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"

    labels = {
      "namespace" = "api"
    }

    taint {
      key    = "namespace"
      value  = "api"
      effect = "NO_SCHEDULE"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
