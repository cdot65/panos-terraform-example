resource "panos_security_policy" "example" {
  rule {
    name                  = "LAN to WAN"
    audit_comment         = "Pushed by Terraform"
    source_zones          = [var.lan_zone]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [var.wan_zone]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }

  lifecycle {
    create_before_destroy = true
  }
}
