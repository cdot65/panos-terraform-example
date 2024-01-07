# Terraform PAN-OS Configuration Examples

This repository contains a collection of examples to help you get started with using Terraform to automate the configuration management of Palo Alto Networks firewalls. These examples assume no prior experience with Terraform, making it friendly for beginners who are new to automation.

## Table of Contents

- [Terraform PAN-OS Configuration Examples](#terraform-pan-os-configuration-examples)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Directory Structure](#directory-structure)
  - [Getting Started](#getting-started)
  - [Example 1: Simple](#example-1-simple)
  - [Example 2: Modules](#example-2-modules)
  - [Example 3: Complex Resources](#example-3-complex-resources)
  - [Conclusion](#conclusion)

## Introduction

Terraform is an open-source Infrastructure as Code (IaC) tool that enables you to automate and manage infrastructure using declarative configuration files. This repository demonstrates the usage of Terraform with the "panos" provider from Palo Alto Networks, allowing you to manage your PAN-OS configuration.

## Prerequisites

Before you get started, ensure you have the following prerequisites in place:

1. Install [Terraform](https://www.terraform.io/downloads.html) on your local machine.
2. Install [Git](https://git-scm.com/downloads) to clone this repository.
3. Familiarity with Palo Alto Networks firewalls and PAN-OS.

## Directory Structure

Here's a high-level overview of the directory structure:

```bash
.
├── README.md (This file)
├── blog.md
└── examples
├── 01_Simple
├── 02_Modules
└── 03_Complex_Resources
```

The `examples` directory contains three examples that demonstrate how to use Terraform with PAN-OS:

1. `01_Simple`: A basic example to get you started with Terraform and PAN-OS.
2. `02_Modules`: This example introduces the concept of Terraform modules, which help you organize and reuse your code.
3. `03_Complex_Resources`: A more advanced example that includes complex data structures and resource configurations.

## Getting Started

To get started, clone this repository to your local machine:

```bash
git clone https://github.com/cdot65/pan-terraform-configure.git
```

After cloning the repository, navigate to the desired example directory:

```bash
cd pan-terraform-configure/examples/01_Simple
```

## Example 1: Simple

In this example, you will learn how to set up a basic Terraform configuration for PAN-OS. The following files are included:

- [main.tf](examples/01_Simple/main.tf): The main Terraform configuration file that defines your resources.
- [provider.tf](examples/01_Simple/provider.tf): Configures the "panos" provider.
- [terraform.tfvars](examples/01_Simple/terraform.tfvars): Contains variable values that are specific to your environment.
- [variables.tf](examples/01_Simple/variables.tf): Defines input variables for your Terraform configuration.

To initialize your Terraform workspace, run the following command:

```bash
terraform init
```

This command downloads the required provider plugins and sets up the backend for storing your Terraform state.

Next, create a plan to see the changes that will be made to your PAN-OS configuration:

```bash
terraform plan
```

If you're satisfied with the plan, apply the changes by running:

```bash
terraform apply
```

Once your configuration has been successfully applied, you can destroy the resources you've created by running:

## Example 2: Modules

In this example, you will learn how to use Terraform modules to better organize and reuse your code. The following files are included:

- [main.tf](examples/02_Modules/main.tf): The main Terraform configuration file that calls the defined modules.
- [modules](examples/02_Modules/modules): A directory containing the following submodules:
- [network](examples/02_Modules/network): A module for managing network resources.
- [object](examples/02_Modules/object): A module for managing object resources.
- [policy](examples/02_Modules/policy): A module for managing policy resources.
- [provider.tf](examples/02_Modules/provider.tf): Configures the "panos" provider.
- [terraform.tfvars](examples/02_Modules/terraform.tfvars): Contains variable values that are specific to your environment.
- [variables.tf](examples/02_Modules/variables.tf): Defines input variables for your Terraform configuration.

Navigate to the 02_Modules directory:

```bash
cd ../02_Modules
```

Follow the same steps as in Example 1 to initialize your Terraform workspace, create a plan, apply the changes, and destroy the resources when you're finished.

## Example 3: Complex Resources

In this example, you will work with complex data structures and resource configurations. The following files are included:

- [main.tf](examples/03_Complex_Resources/main.tf): The main Terraform configuration file that calls the defined modules.
- [modules](examples/03_Complex_Resources/modules): A directory containing the following submodules:
- [network](examples/03_Complex_Resources/network): A module for managing network resources.
- [object](examples/03_Complex_Resources/object): A module for managing object resources.
- [policy](examples/03_Complex_Resources/policy): A module for managing policy resources.
- [provider.tf](examples/03_Complex_Resources/provider.tf): Configures the "panos" provider.
- [terraform.tfvars](examples/03_Complex_Resources/terraform.tfvars): Contains variable values that are specific to your environment.
- [variables.tf](examples/03_Complex_Resources/variables.tf): Defines input variables for your Terraform configuration.

Navigate to the 03_Complex_Resources directory:

```bash
cd ../03_Complex_Resources
```

Follow the same steps as in Example 1 to initialize your Terraform workspace, create a plan, apply the changes, and destroy the resources when you're finished.

## Conclusion

Congratulations! 🎉 You've now learned how to use Terraform with the "panos" provider to manage your Palo Alto Networks firewall configurations. These examples should help you get started with your own Terraform projects and provide a foundation for automating your PAN-OS configuration.

Don't forget to check out the official Terraform documentation and the PAN-OS provider documentation for more information and examples.
