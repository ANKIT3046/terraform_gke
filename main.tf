provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Zonal GKE Cluster
resource "google_container_cluster" "zonal_cluster" {
  name               = var.cluster_name
  location           = var.zone
  initial_node_count = 1
  remove_default_node_pool = true  # Remove default node pool as we create custom ones
  network            = var.network
  subnetwork         = var.subnetwork

  ip_allocation_policy {}
}

# Primary Node Pool (Fixed Size)
resource "google_container_node_pool" "primary_node_pool" {
  cluster    = google_container_cluster.zonal_cluster.name
  location   = var.zone
  node_count = var.primary_node_pool_size

  node_config {
    machine_type = var.primary_machine_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# Autoscaling Node Pool
resource "google_container_node_pool" "autoscaling_node_pool" {
  cluster  = google_container_cluster.zonal_cluster.name
  location = var.zone

  autoscaling {
    min_node_count = var.autoscaling_min
    max_node_count = var.autoscaling_max
  }

  node_config {
    machine_type = var.autoscaling_machine_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}