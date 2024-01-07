module "network" {
  source       = "./modules/network"
  hostname     = var.hostname
  pan_username = var.pan_username
  pan_password = var.pan_password
}

module "object" {
  source       = "./modules/object"
  hostname     = var.hostname
  pan_username = var.pan_username
  pan_password = var.pan_password
}

module "policy" {
  source       = "./modules/policy"
  hostname     = var.hostname
  pan_username = var.pan_username
  pan_password = var.pan_password

  wan_zone = module.network.wan_zone
  lan_zone = module.network.lan_zone
}
