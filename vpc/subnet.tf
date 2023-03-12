

resource "google_compute_subnetwork" "subnetwork" {
  for_each      = local.subnets
  name          = each.value.name
  description   = each.value.description
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  private_ip_google_access = true
  network       = google_compute_network.vpc_network.id
    secondary_ip_range = [
    for i in range(
      length(
        contains(
        keys(var.secondary_ranges), each.value.name) == true
        ? var.secondary_ranges[each.value.name]
        : []
    )) :
    var.secondary_ranges[each.value.name][i]
    
  ]
}