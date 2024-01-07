# Network module for configuring Ethernet interfaces, security zones, and virtual router

locals {
  vsys = "vsys1"
}

resource "panos_ethernet_interface" "interface" {
  for_each = var.interfaces

  name       = each.value.name
  vsys       = local.vsys
  mode       = "layer3"
  static_ips = each.value.static_ips
  comment    = each.value.comment

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_zone" "zone" {
  for_each = var.interfaces

  name = upper(each.key)
  mode = "layer3"
  interfaces = [
    panos_ethernet_interface.interface[each.key].name,
  ]

  depends_on = [panos_ethernet_interface.interface]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_virtual_router" "default" {
  name       = "default"
  interfaces = values(panos_ethernet_interface.interface).*.name

  depends_on = [panos_ethernet_interface.interface]

  lifecycle {
    create_before_destroy = true
  }
}
