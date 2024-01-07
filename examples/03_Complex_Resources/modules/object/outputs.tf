# Outputs for the object module

output "administrative_tags" {
  value = {
    for k, v in panos_administrative_tag.tags : k => v.name
  }
}

output "address_objects" {
  value = {
    for k, v in panos_address_object.address_objects : k => v.name
  }
}
