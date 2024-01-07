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
  hostname = "192.168.255.106"
  json_config_file = "./creds.json"
}
