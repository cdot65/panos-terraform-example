# Variables for the network module

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
