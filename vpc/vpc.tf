resource "google_compute_network" "vpc_network" {
  name                            = var.vpc_network_name
  auto_create_subnetworks         = false
  routing_mode                    = var.routing_mode
  project                         = var.project_id
  description                     = var.description
  mtu                             = var.mtu
delete_default_routes_on_create = var.delete_default_routes_on_create
}

module "dns_zones"{
  source = "../dns"
  project_id = "project-id"
  network_id = google_compute_network.vpc_network.id
}

