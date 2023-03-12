output "network_id" {
  value       = google_compute_network.vpc_network.id
  description = "The ID of the VPC being created"
}

output "subnet_name" {
  value = values(google_compute_subnetwork.subnetwork)[0].name
}

output "secondary" {
    value = flatten(values(google_compute_subnetwork.subnetwork)[*].secondary_ip_range[*].range_name[*])

}



