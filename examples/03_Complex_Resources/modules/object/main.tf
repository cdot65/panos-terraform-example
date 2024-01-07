# Object module for configuring administrative tags and address objects

locals {
  vsys = "vsys1"
}

resource "panos_administrative_tag" "tags" {
  for_each = var.administrative_tags

  name    = each.value.name
  vsys    = local.vsys
  color   = each.value.color
  comment = each.value.comment

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_address_object" "address_objects" {
  for_each = var.address_objects

  name        = each.value.name
  value       = each.value.value
  description = each.value.description
  tags        = each.value.tags

  depends_on = [panos_administrative_tag.tags]

  lifecycle {
    create_before_destroy = true
  }
}
