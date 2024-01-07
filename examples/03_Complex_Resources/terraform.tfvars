hostname     = "192.168.255.215"
pan_username = "terraform"
pan_password = "paloalto#1"

address_objects = {
  aus_ads_01 = {
    name        = "aus-ads-01"
    value       = "192.168.21.2"
    description = "Secondary AD server"
    tags        = ["network", "windows"]
  }
  aus_dns_01 = {
    name        = "aus-dns-01"
    value       = "192.168.21.2"
    description = "Secondary DNS server"
    tags        = ["network", "linux"]
  }
  hou_ads_01 = {
    name        = "hou-ads-01"
    value       = "192.168.11.2"
    description = "Primary AD server"
    tags        = ["network", "windows"]
  }
  hou_dns_01 = {
    name        = "hou-dns-01"
    value       = "192.168.11.2"
    description = "Primary DNS server"
    tags        = ["network", "linux"]
  }
  hou_pve_01 = {
    name        = "hou-pve-01"
    value       = "10.20.10.1"
    description = "Primary Proxmox server"
    tags        = ["hypervisor"]
  }
  vcenter = {
    name        = "vcenter"
    value       = "10.60.10.1"
    description = "Redtail vCenter"
    tags        = ["hypervisor"]
  }
}

administrative_tags = {
  hypervisor = {
    name    = "hypervisor"
    color   = "color33"
    comment = "Virtualization hosts"
  }
  linux = {
    name    = "linux"
    color   = "color31"
    comment = "Linux hosts"
  }
  network = {
    name    = "network"
    color   = "color30"
    comment = "Network devices"
  }
  security = {
    name    = "security"
    color   = "color29"
    comment = "Security appliances"
  }
  windows = {
    name    = "windows"
    color   = "color32"
    comment = "Windows server hosts"
  }
}

interfaces = {
  wan = {
    name       = "ethernet1/1",
    static_ips = ["46.58.79.2/24"],
    comment    = "WAN IP address for internet connectivity"
  }
  lan = {
    name       = "ethernet1/2",
    static_ips = ["10.0.1.1/24"],
    comment    = "Local LAN for users"
  }
  dmz = {
    name       = "ethernet1/3",
    static_ips = ["192.168.1.1/24"],
    comment    = "Protected servers"
  }
}


security_policies = {
  dmz_to_wan = {
    name                  = "DMZ to WAN"
    audit_comment         = "Pushed by Terraform"
    source_zones          = ["DMZ"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = ["WAN"]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }
  lan_to_wan = {
    name                  = "LAN to WAN"
    audit_comment         = "Pushed by Terraform"
    source_zones          = ["LAN"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = ["WAN"]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }
  wan_to_lan = {
    name                  = "WAN to LAN"
    audit_comment         = "Pushed by Terraform"
    source_zones          = ["WAN"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = ["LAN"]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }
}
