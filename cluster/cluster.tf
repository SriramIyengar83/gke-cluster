resource "google_container_cluster" "primary" {
  depends_on = [
    module.vpc
  ]
  name             = var.cluster_name
  description      = var.cluster_description
  project          = var.project_id
  resource_labels  = var.cluster_resource_labels
  location         = var.cluster_location
  node_locations    = var.node_locations
  network           = module.vpc.network_id
  subnetwork        = module.vpc.subnet_name
  networking_mode = "VPC_NATIVE"

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

ip_allocation_policy {
  cluster_secondary_range_name = module.vpc.secondary[0]
  services_secondary_range_name = module.vpc.secondary[1]
}
  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }

  network_policy {
    enabled = true
  }

  private_cluster_config {
    enable_private_endpoint= true
    enable_private_nodes=true
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
    dynamic "master_global_access_config" {
      for_each = var.master_global_access_enabled ? [var.master_global_access_enabled] : []
      content{
        enabled = master_global_access_config.value
      }
    }
  }

  addons_config {
    http_load_balancing {
      disabled = var.enable_http_load_balancing
    }
    horizontal_pod_autoscaling {
      disabled=false
    }
    network_policy_config {
      disabled=false
    }
    
  }

  
  remove_default_node_pool = true
  lifecycle {
   ignore_changes = [node_pool, initial_node_count]

  }

  node_pool {
    name = "default-pool"
    initial_node_count = 1
    node_config {
      service_account = var.service_account
    }
  }
master_authorized_networks_config {
  cidr_blocks {
    cidr_block = var.ip_cidr_range
  }
  dynamic "cidr_blocks" {
    for_each = var.master_global_access_cidr
  content{
    cidr_block = cidr_blocks.value
    display_name = cidr_blocks.key
  }
}
  
}
}

 module "vpc" {
  source = "../vpc"
  vpc_network_name = var.vpc_network_name
  subnets = var.subnets
  secondary_ranges = var.secondary_ranges
  project_id = var.project_id
 }

