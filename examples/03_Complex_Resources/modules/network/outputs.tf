# Outputs for the network module

output "wan_zone" {
  value = panos_zone.zone["wan"].name
}

output "dmz_zone" {
  value = panos_zone.zone["dmz"].name
}

output "lan_zone" {
  value = panos_zone.zone["lan"].name
}

output "interfaces" {
  value = {
    for k, v in panos_ethernet_interface.interface : k => v.name
  }
}

output "zones" {
  value = {
    for k, v in panos_zone.zone : k => v.name
  }
}
