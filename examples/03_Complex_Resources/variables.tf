# Variables for the Terraform project

variable "hostname" {
  type = string
}
variable "pan_username" {
  type = string
}
variable "pan_password" {
  type = string
}

variable "interfaces" {
  type = map(object({
    name       = string
    static_ips = list(string)
    comment    = string
  }))
}

variable "address_objects" {
  type = map(object({
    name        = string
    value       = string
    description = string
    tags        = list(string)
  }))
  default = {}
}

variable "administrative_tags" {
  type = map(object({
    name    = string
    color   = string
    comment = string
  }))
}

variable "security_policies" {
  type = map(object({
    name                  = string
    audit_comment         = string
    source_zones          = list(string)
    source_addresses      = list(string)
    source_users          = list(string)
    destination_zones     = list(string)
    destination_addresses = list(string)
    applications          = list(string)
    services              = list(string)
    categories            = list(string)
    action                = string
  }))
  default = {}
}
