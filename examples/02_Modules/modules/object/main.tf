locals {
  vsys = "vsys1"
}

resource "panos_administrative_tag" "hypervisor" {
  name    = "hypervisor"
  vsys    = "vsys1"
  color   = "color33"
  comment = "All virtualization hosts"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_address_object" "hou_pve_01" {
  name        = "hou-pve-01"
  value       = "10.20.10.1"
  description = "Primary Proxmox server"
  tags = [
    panos_administrative_tag.hypervisor.name
  ]

  depends_on = [
    panos_administrative_tag.hypervisor
  ]

  lifecycle {
    create_before_destroy = true
  }
}
