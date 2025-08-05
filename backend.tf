terraform {
  backend "gcs" {
    bucket = "light-terraform-state-bucket"
    prefix = "terraform/state/gke-cluster"
  }
}
