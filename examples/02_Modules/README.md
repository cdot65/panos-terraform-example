# Managing PAN-OS Firewall Configuration with Terraform

## Step 1 - Setting Up the Terraform Project

1. Create a new directory for your Terraform project and navigate to it:

    ```bash
    mkdir panos-terraform
    cd panos-terraform
    ```

2. Initialize your Terraform project with the `terraform init` command:

    ```bash
    terraform init
    ```

3. Create a `provider.tf` file to define the PAN-OS provider:

    ```hcl
    provider "panos" {
        hostname     = var.hostname
        username     = var.pan_username
        password     = var.pan_password
    }
    ```

4. Install the PAN-OS provider by running `terraform init` again:

    ```bash
    terraform init
    ```

    The PAN-OS provider should be successfully installed, as indicated in the Prerequisites section.

5. Define input variables: Create a `variables.tf` file to define the input variables for the PAN-OS firewall hostname, username, and password:

    ```hcl
    variable "hostname" {
      type = string
    }
    variable "pan_username" {
      type = string
    }
    variable "pan_password" {
      type = string
    }
    ```

6. Define variable values: Create a `terraform.tfvars` file to specify the values for the input variables:

    ```terraform
    hostname     = "192.168.1.1"
    pan_username = "admin"
    pan_password = "password123"
    ```

7. Save your changes and run `terraform init` again to ensure the provider configuration is properly loaded.

Now your initial project is set up and ready for further configuration.

## Step 2 - Defining the Firewall Configuration

Now, let's define the PAN-OS firewall configuration using the `panos` Terraform provider. In your `main.tf` file, add the necessary configuration blocks for your firewall:

1. Configure the PAN-OS provider: The provider configuration is already defined in the `provider.tf` file.

2. Import the modules: In your `main.tf` file, call the modules for network, policy, and object configurations:

    ```terraform
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
    ```

3. Configure the necessary resources for your firewall, such as interfaces, zones, and policies. The resource configurations are defined in the respective module directories (`modules/network`, `modules/object`, and `modules/policy`).

By defining the firewall configuration using Terraform, you can manage and automate the configuration of your PAN-OS firewall in a declarative and version-controlled manner.

## Step 3 - Creating modules

To better manage your PAN-OS firewall configuration, you can organize your code into modules, such as "network", "policy", and "object". Modules make it easier to maintain and reuse code.

Create separate directories for each module within your project, such as `modules/network`, `modules/policy`, and `modules/object`.

Within each module directory, create Terraform configuration files (e.g., `main.tf`, `variables.tf`, `outputs.tf`) to define the resources, variables, and outputs for that module.

## Step 4 - Planning and Applying the Configuration

After defining your firewall configuration, you can use Terraform commands to plan and apply the changes to your PAN-OS firewall.

1. Run the following command to review the changes Terraform will make to your PAN-OS firewall:

    ```bash
    terraform plan
    ```

    The plan command will output a detailed list of the resources Terraform will create, modify, or delete. Carefully review the plan to ensure it aligns with your desired configuration.

2. If you're satisfied with the plan, apply your configuration by running the terraform apply command:

    ```bash
    terraform apply
    ```

    Terraform will prompt you to confirm that you want to apply the changes. Type yes and press Enter to proceed. Terraform will create, modify, or delete resources as specified in your plan.

    Remember to store the Terraform state file securely, as it contains sensitive information about your infrastructure.

## Step 5 - Organizing Modules

To better organize your Terraform project, you can create separate modules for different aspects of your PAN-OS firewall configuration. In this project, we have created three modules: "network," "object," and "policy."

### Network Module

The network module is located in the modules/network directory and contains the configuration for Ethernet interfaces, zones, and virtual routers. The main.tf file in this module defines resources such as panos_ethernet_interface, panos_zone, and panos_virtual_router.

The outputs.tf file in the network module defines outputs for the WAN and LAN zones, which are used as input variables in the policy module.

### Object Module

The object module is located in the modules/object directory and contains the configuration for administrative tags and address objects. The main.tf file in this module defines resources such as panos_administrative_tag and panos_address_object.

The outputs.tf file in the object module defines an output for the hypervisor tag.

### Policy Module

The policy module is located in the modules/policy directory and contains the configuration for security policies. The main.tf file in this module defines resources such as panos_security_policy.

Each module has its own provider.tf file to specify the required providers and their configurations. The variables.tf file in each module defines input variables specific to that module.

## Conclusion

In this README, we've explored how to manage the configuration of PAN-OS firewalls using the "panos" Terraform provider from Palo Alto Networks. We covered the setup of a Terraform project, the creation of modules for network, policy, and object configurations, and the process of planning and applying the configuration using Terraform.

By leveraging the power of Terraform and the "panos" provider, you can automate and simplify the management of your PAN-OS firewall configurations, enabling you to maintain consistency and reduce the potential for human error.

