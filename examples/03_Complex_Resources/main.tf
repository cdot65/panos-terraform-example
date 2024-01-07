# Main file for the Terraform project
# This file includes the three modules: network, object, and policy

module "network" {
  source       = "./modules/network"
  hostname     = var.hostname
  pan_username = var.pan_username
  pan_password = var.pan_password
  interfaces   = var.interfaces
}

module "object" {
  source              = "./modules/object"
  hostname            = var.hostname
  pan_username        = var.pan_username
  pan_password        = var.pan_password
  administrative_tags = var.administrative_tags
  address_objects     = var.address_objects
}

module "policy" {
  source              = "./modules/policy"
  hostname            = var.hostname
  pan_username        = var.pan_username
  pan_password        = var.pan_password
  security_policies   = var.security_policies
  administrative_tags = module.object.administrative_tags
  address_objects     = module.object.address_objects
  dmz_zone            = module.network.dmz_zone
  wan_zone            = module.network.wan_zone
  lan_zone            = module.network.lan_zone
}
