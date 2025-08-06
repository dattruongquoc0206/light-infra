provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file(var.credentials_file)
}
/*


resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count       = 1
  remove_default_node_pool = true


  network    = "default"
  subnetwork = "default"
  node_config {
  disk_size_gb = 70

   
    machine_type = "e2-medium"
*    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    }
}
*/ 