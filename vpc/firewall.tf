resource "google_compute_firewall" "firewall_rules" {
  for_each              = local.firewall_rules  
  name                  = each.value.name
  network               = google_compute_network.vpc_network.id
  description           = each.value.description
  direction             = each.value.direction
   source_ranges        = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges    = each.value.direction == "EGRESS" ? each.value.ranges : null
 priority               =  each.value.priority

    dynamic "allow" {
    for_each = lookup(each.value, "allow", [])
    content {
      protocol = allow.value.protocol
      ports    = lookup(allow.value, "ports", null)
    }
  }

  dynamic "deny" {
    for_each = lookup(each.value, "deny", [])
    content {
      protocol = deny.value.protocol
      ports    =  lookup(deny.value, "ports", null)
    } 
  }


}