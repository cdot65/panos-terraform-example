locals {
  vsys = "vsys1"
}

resource "panos_ethernet_interface" "wan" {
  name       = "ethernet1/1"
  vsys       = "vsys1"
  mode       = "layer3"
  static_ips = ["46.58.79.2/24"]
  comment    = "WAN IP address for internet connectivity"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_ethernet_interface" "lan" {
  name       = "ethernet1/2"
  vsys       = "vsys1"
  mode       = "layer3"
  static_ips = ["10.0.1.1/24"]
  comment    = "Local LAN for users"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_ethernet_interface" "dmz" {
  name       = "ethernet1/3"
  vsys       = "vsys1"
  mode       = "layer3"
  static_ips = ["192.168.1.1/24"]
  comment    = "Protected servers"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_zone" "wan" {
  name = "WAN"
  mode = "layer3"
  interfaces = [
    panos_ethernet_interface.wan.name,
  ]

  depends_on = [
    panos_ethernet_interface.wan
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_zone" "lan" {
  name = "LAN"
  mode = "layer3"
  interfaces = [
    panos_ethernet_interface.lan.name,
  ]

  depends_on = [
    panos_ethernet_interface.lan
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_zone" "dmz" {
  name = "DMZ"
  mode = "layer3"
  interfaces = [
    panos_ethernet_interface.dmz.name,
  ]

  depends_on = [
    panos_ethernet_interface.dmz
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_virtual_router" "default" {
  name = "default"
  interfaces = [
    panos_ethernet_interface.wan.name,
    panos_ethernet_interface.lan.name,
    panos_ethernet_interface.dmz.name,
  ]

  depends_on = [
    panos_ethernet_interface.dmz,
    panos_ethernet_interface.wan,
    panos_ethernet_interface.lan,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
