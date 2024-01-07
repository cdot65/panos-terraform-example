variable "hostname" {
  type = string
}

variable "pan_username" {
  type = string
}

variable "pan_password" {
  type = string
}

variable "dmz_zone" {
  type = string
}

variable "lan_zone" {
  type = string
}

variable "wan_zone" {
  type = string
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

variable "administrative_tags" {
  type = map(string)
}

variable "address_objects" {
  type = map(string)
}

