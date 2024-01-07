resource "panos_security_rule_group" "dmz_to_wan" {
  position_keyword = "top"

  rule {
    name                  = var.security_policies.dmz_to_wan.name
    audit_comment         = var.security_policies.dmz_to_wan.audit_comment
    source_zones          = var.security_policies.dmz_to_wan.source_zones
    source_addresses      = var.security_policies.dmz_to_wan.source_addresses
    source_users          = var.security_policies.dmz_to_wan.source_users
    destination_zones     = var.security_policies.dmz_to_wan.destination_zones
    destination_addresses = var.security_policies.dmz_to_wan.destination_addresses
    applications          = var.security_policies.dmz_to_wan.applications
    services              = var.security_policies.dmz_to_wan.services
    categories            = var.security_policies.dmz_to_wan.categories
    action                = var.security_policies.dmz_to_wan.action
  }

  depends_on = [
    var.address_objects, var.wan_zone, var.lan_zone,
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_rule_group" "wan_to_lan" {
  position_keyword   = "before"
  position_reference = panos_security_rule_group.lan_to_wan.rule.0.name
  rule {
    name                  = var.security_policies.wan_to_lan.name
    audit_comment         = var.security_policies.wan_to_lan.audit_comment
    source_zones          = var.security_policies.wan_to_lan.source_zones
    source_addresses      = var.security_policies.wan_to_lan.source_addresses
    source_users          = var.security_policies.wan_to_lan.source_users
    destination_zones     = var.security_policies.wan_to_lan.destination_zones
    destination_addresses = var.security_policies.wan_to_lan.destination_addresses
    applications          = var.security_policies.wan_to_lan.applications
    services              = var.security_policies.wan_to_lan.services
    categories            = var.security_policies.wan_to_lan.categories
    action                = var.security_policies.wan_to_lan.action
  }

  depends_on = [
    var.address_objects, var.wan_zone, var.lan_zone,
  ]

  lifecycle {
    create_before_destroy = true
  }

}
resource "panos_security_rule_group" "lan_to_wan" {
  position_keyword = "bottom"

  rule {
    name                  = var.security_policies.lan_to_wan.name
    audit_comment         = var.security_policies.lan_to_wan.audit_comment
    source_zones          = var.security_policies.lan_to_wan.source_zones
    source_addresses      = var.security_policies.lan_to_wan.source_addresses
    source_users          = var.security_policies.lan_to_wan.source_users
    destination_zones     = var.security_policies.lan_to_wan.destination_zones
    destination_addresses = var.security_policies.lan_to_wan.destination_addresses
    applications          = var.security_policies.lan_to_wan.applications
    services              = var.security_policies.lan_to_wan.services
    categories            = var.security_policies.lan_to_wan.categories
    action                = var.security_policies.lan_to_wan.action
  }

  depends_on = [
    var.address_objects, var.wan_zone, var.lan_zone,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
