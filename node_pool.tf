resource "google_container_node_pool" "api_pool" {
  name       = "api-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region


  initial_node_count = 1
  node_locations = ["asia-southeast1-b"]

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 10

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
    disk_size_gb = 20

    labels = {
      "namepsace" = "cicd"
    }

    taint {
      key = "namespace"
      value = "cicd"
      effect = "NO_SCHEDULE"  
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "ingress_nodepool_new" {
  name       = "ingress-nodepool-new"
  cluster    = google_container_cluster.primary.name    
  location   = var.region  

  node_count = 1
  
  node_locations = ["asia-southeast1-b"]
  
  node_config { 
    machine_type = "e2-medium"
    disk_size_gb = 20

    labels = {
      "namespace" = "ingress-new"
    }

    taint {
      key = "ingress_nodepool"
      value = "new"
      effect = "NO_SCHEDULE"  
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "cicd_nodepool_new" {
  name       = "cicd-nodepool-new"
  cluster    = google_container_cluster.primary.name    
  location   = var.region  

  node_count = 1
  
  node_locations = ["asia-southeast1-a"]
  
  node_config { 
    machine_type = "e2-medium"
    disk_size_gb = 20

    labels = {
      "namespace" = "cicd-new"
    }

    taint {
      key = "cicd_nodepool"
      value = "new"
      effect = "NO_SCHEDULE"  
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}