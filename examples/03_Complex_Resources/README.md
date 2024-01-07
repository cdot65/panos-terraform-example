# Terraform PAN-OS Project 🌐

This Terraform project is designed to help you automate the configuration of your Palo Alto Networks Firewall. It includes modules for network interfaces, security zones, address objects, administrative tags, and security policies.

## Table of Contents 📚

- [Getting Started](#getting-started)
- [Project Files](#project-files)
- [Module Usage](#module-usage)
- [References](#references)

## Getting Started 🚀

1. Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) on your local machine.
2. Clone this repository and navigate to the project directory.
3. Modify the `terraform.tfvars` file with your specific configuration.
4. Run `terraform init` to initialize the project.
5. Run `terraform apply` to apply the Terraform configuration to your firewall.

## Project Files 📁

- `main.tf`: The main file that includes the three modules: network, object, and policy.
- `provider.tf`: Provider configuration for the PAN-OS provider.
- `variables.tf`: Variables for the Terraform project.
- `terraform.tfvars`: Example variable values for the Terraform project.
- `modules/`: Directory containing the modules for this project.

## Module Usage 🧩

### Network Module

This module configures Ethernet interfaces, security zones, and virtual routers.

#### Input Variables

- `hostname`: The hostname of the firewall.
- `pan_username`: The username for the firewall.
- `pan_password`: The password for the firewall.
- `interfaces`: A map of objects defining the interfaces.

### Object Module

This module configures administrative tags and address objects.

#### Input Variables

- `hostname`: The hostname of the firewall.
- `pan_username`: The username for the firewall.
- `pan_password`: The password for the firewall.
- `administrative_tags`: A map of objects defining the administrative tags.
- `address_objects`: A map of objects defining the address objects (optional).

### Policy Module

This module configures security policies.

#### Input Variables

- `hostname`: The hostname of the firewall.
- `pan_username`: The username for the firewall.
- `pan_password`: The password for the firewall.
- `security_policies`: A map of objects defining the security policies (optional).

## References 🔗

- [PAN-OS Terraform Provider](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
