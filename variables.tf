variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The region where resources will be deployed."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone where the cluster will be deployed."
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "zonal-k8s-cluster"
}

variable "network" {
  description = "The name of the VPC network."
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork."
  type        = string
}

# Primary node pool variables
variable "primary_node_pool_size" {
  description = "Number of nodes in the primary node pool."
  type        = number
  default     = 1
}

variable "primary_machine_type" {
  description = "Machine type for primary node pool."
  type        = string
  default     = "e2-medium"
}

# Autoscaling node pool variables
variable "autoscaling_min" {
  description = "Minimum number of nodes for the autoscaling node pool."
  type        = number
  default     = 1
}

variable "autoscaling_max" {
  description = "Maximum number of nodes for the autoscaling node pool."
  type        = number
  default     = 5
}

variable "autoscaling_machine_type" {
  description = "Machine type for autoscaling node pool."
  type        = string
  default     = "e2-standard-4"
}