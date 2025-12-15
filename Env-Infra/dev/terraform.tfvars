resource_group = {
  rg = {
    rg_name  = "az-3tire-rg"
    location = "East US2"
  }
}

virtual_network = {
  vnet = {
    vnet_name     = "az-3tire-vnet"
    address_space = ["10.0.0.0/16"]
    rg_name       = "az-3tire-rg"
    location      = "East US2"
  }
}

subnet = {
  subnet1 = {
    subnet_name      = "app-subnet"
    address_prefixes = ["10.0.1.0/24"]
    vnet_name        = "az-3tire-vnet"
    rg_name          = "az-3tire-rg"
  }

  bastion_subnet = {
    subnet_name      = "AzureBastionSubnet" # 🔥 REQUIRED
    address_prefixes = ["10.0.2.0/26"]
    vnet_name        = "az-3tire-vnet"
    rg_name          = "az-3tire-rg"
  }
}

storage_account = {
  sa1 = {
    name     = "az3tirestorage01"
    rg_name  = "az-3tire-rg"
    location = "East US2"
  }
}

storage_container = {
  container1 = {
    name            = "data"
    storage_account = "az3tirestorage01"
  }
}

virtual_machine = {
  vm1 = {
    vm_name        = "az-app-vm01"
    rg_name        = "az-3tire-rg"
    location       = "East US2"
    subnet_key     = "subnet1"
    admin_username = "azureuser"
    admin_password = "Password@123!"
  }
}

sql_server = {
  sql1 = {
    server_name    = "az-sql-server01"
    rg_name        = "az-3tire-rg"
    location       = "East US2"
    admin_username = "sqladmin"
    admin_password = "Password@123!"
  }
}

sql_database = {
  db1 = {
    db_name    = "appdb"
    server_key = "sql1"
  }
}

public_ip = {
  pip1 = {
    name     = "az-bastion-pip"
    rg_name  = "az-3tire-rg"
    location = "East US2"
  }
}

bastion = {
  bastion1 = {
    name       = "az-bastion"
    rg_name    = "az-3tire-rg"
    location   = "East US2"
    subnet_key = "bastion_subnet"
    pip_key    = "pip1"
  }
}

key_vault = {
  kv1 = {
    name     = "az-3tire-kv01"
    rg_name  = "az-3tire-rg"
    location = "East US2"
  }
}
