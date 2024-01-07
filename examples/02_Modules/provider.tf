terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "1.11.1"
    }
  }
}

# Configure the panos provider
provider "panos" {
  hostname = var.hostname
  username = var.pan_username
  password = var.pan_password
}
