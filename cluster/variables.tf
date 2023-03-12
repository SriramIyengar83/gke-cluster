variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster (required)"
}


variable "cluster_description" {
  type        = string
  description = "The description of the cluster"
  default     = ""
}

variable "regional" {
  type        = bool
  description = "Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!)"
  default     = true
}

variable "region" {
  type        = string
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)"
  default     = null
}

variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = []
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
}

variable "network_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
  default     = ""
}


variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
  default     = "latest"
}

variable "service_account" {
  type        = string
  description = "service account for k8s"
}

variable "ip_cidr_range" {
  type = string
  description = "cird range for the cluster"
  default = "10.1.0.0/24"
  
}

variable "display_name" {
  type = string
  description = "display name"
  default = "master cidr"
  
}

variable "subnetwork" {
  type = string
  description = "subnetwork to be used"
}

variable "master_ipv4_cidr_block" {
  type = string
  description = "Name of subnet for compute resources"
  
}

variable "enable_http_load_balancing" {
  type = bool
  description = "enable http load balancing"
  default = true
  
}

variable "disk_type" {
  type = string
  description = "disk type"  
}

variable "disk_size_gb" {
  type = string
  description = "disk size"  
}

variable "master_global_access_cidr" {
  type = map(string)
  default = {}
}

variable "master_global_access_enabled" {
  type = bool
  default = true
  
}

variable "cluster_resource_labels" {
type = map(string)  
default = {}
}

variable "tags" {
  type = list(string)
  default = ["test-vpc-cluster"]
  
}

variable "ip_range_pods" {
type = string
default = "subnet-01-secondary-01"
}

variable "ip_range_services" {
  type = string
  default = "subnet-01-secondary-02"

  
}

variable "machine_type" {
  type = string
  default = "e2-standard-2"
}

variable "node_pool_name" {
  type = string

}

variable "cluster_location" {
  type = string
}

variable "node_locations" {
type = list
  
}

variable "vpc_network_name" {
  type        = string
  description = "The name of vpc network"
}

variable "routing_mode" {
  type        = string
  description = ""
  default     = "GLOBAL"
}

variable "description" {
  type        = string
  description = "description of the VPC"
  default     = "Test VPC Network"
}

variable "mtu" {
  type        = number
  description = "mtu"
  default     = 1460
}

variable "delete_default_routes_on_create" {
  type        = bool
  description = "deleting default 0.0.0.0/0 on creation"
  default     = true
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "firewall_rules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    name                    = string
    description             = string
    direction               = string
    priority                = number
    ranges                  = list(string)
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    deny = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
}

