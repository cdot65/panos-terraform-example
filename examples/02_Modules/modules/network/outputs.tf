output "wan_zone" {
  value = panos_zone.wan.name
}

output "lan_zone" {
  value = panos_zone.lan.name
}
