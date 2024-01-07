# Variables for the object module

variable "hostname" {
  type = string
}

variable "pan_username" {
  type = string
}

variable "pan_password" {
  type = string
}

variable "administrative_tags" {
  type = map(object({
    name    = string
    color   = string
    comment = string
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
