output "cluster_name" {
  description = "Name of the Kubernetes cluster."
  value       = google_container_cluster.zonal_cluster.name
}

output "primary_node_pool_name" {
  description = "Name of the primary node pool."
  value       = google_container_node_pool.primary_node_pool.name
}

output "autoscaling_node_pool_name" {
  description = "Name of the autoscaling node pool."
  value       = google_container_node_pool.autoscaling_node_pool.name
}

output "cluster_endpoint" {
  description = "The endpoint of the Kubernetes cluster."
  value       = google_container_cluster.zonal_cluster.endpoint
}

output "cluster_master_version" {
  description = "The Kubernetes master version."
  value       = google_container_cluster.zonal_cluster.master_version
}