resource "google_container_node_pool" "api_pool" {
  name       = "api-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50

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

resource "google_container_node_pool" "cicd_nodepool" {
  name       = "cicd-nodepool"
  cluster    = google_container_cluster.primary.name    
  location   = var.region  

  node_count = 1

  node_locations = ["asia-southeast1-a"]

  node_config { 
    machine_type = "e2-medium"
    disk_size_gb = 50

    labels = {
      role = "cicd"
    }
    taint {
      key    = "namespace"
      value  = "cicd_namespace"
      effect = "NO_SCHEDULE"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}