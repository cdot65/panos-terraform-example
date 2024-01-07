# WAN interface
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

# DMZ interface
resource "panos_ethernet_interface" "dmz" {
  name       = "ethernet1/2"
  vsys       = "vsys1"
  mode       = "layer3"
  static_ips = ["192.168.31.1/24"]
  comment    = "Protected servers"

  lifecycle {
    create_before_destroy = true
  }
}


# LAN interface
resource "panos_ethernet_interface" "lan" {
  name       = "ethernet1/3"
  vsys       = "vsys1"
  mode       = "layer3"
  static_ips = ["10.0.31.1/24"]
  comment    = "Local LAN for users"

  lifecycle {
    create_before_destroy = true
  }
}

# Security Zone WAN
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

# Security Zone LAN
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

# Security Zone DMZ
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

# Virtual Router
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

# Hypervisor tag
resource "panos_administrative_tag" "hypervisor" {
  name    = "hypervisor"
  vsys    = "vsys1"
  color   = "color33"
  comment = "All virtualization hosts"

  lifecycle {
    create_before_destroy = true
  }
}

# Address object for proxmox
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

# create security policy
resource "panos_security_policy" "example" {
  rule {
    name                  = "LAN to WAN"
    audit_comment         = "Pushed by Terraform"
    source_zones          = [panos_zone.lan.name]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [panos_zone.wan.name]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }

  depends_on = [
    panos_zone.wan,
    panos_zone.lan,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
