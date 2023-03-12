locals {
  subnets = {
    for x in var.subnets :
    "${x.region}/${x.name}" => x
  }
  
  firewall_rules = {
    for x in var.firewall_rules :
    "${x.name}" => x
  }

}