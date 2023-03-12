variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
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

variable "region" {
  type        = string
  description = "region for vpc network"
  default     = "asia-east1"
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



