#!/bin/bash

set -e

BASE_DIR=terraform/dev-agent

echo "Creating folder structure..."
mkdir -p $BASE_DIR/module
mkdir -p $BASE_DIR/parent

#############################
# MODULE FILES
#############################

cat <<EOF > $BASE_DIR/module/variables.tf
variable "resource_group_name" {}
variable "location" {}
variable "vm_name" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
EOF

cat <<EOF > $BASE_DIR/module/main.tf
resource "azurerm_virtual_network" "this" {
  name                = "\${var.vm_name}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "this" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "this" {
  name                = "\${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_DS2_v2"

  admin_username = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
EOF

cat <<EOF > $BASE_DIR/module/outputs.tf
output "vm_name" {
  value = azurerm_linux_virtual_machine.this.name
}
EOF

#############################
# PARENT FILES
#############################

cat <<EOF > $BASE_DIR/parent/providers.tf
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}
EOF

cat <<EOF > $BASE_DIR/parent/main.tf
resource "azurerm_resource_group" "this" {
  name     = "rg-devops-agent-dev"
  location = "East US"
}

module "devops_agent_vm" {
  source = "../module"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  vm_name             = "ado-agent-vm"
  admin_username      = "azureuser"
  admin_password      = "Password@1234!"
}
EOF

cat <<EOF > $BASE_DIR/parent/terraform.tfvars
# keep secrets here later
EOF

echo "✅ Terraform DevOps Agent structure created successfully"
