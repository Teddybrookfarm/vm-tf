module "vm-module" {
  source = "./vm-module"
# Global vars
  resource_group_name  = "vm-rg"
  location             = "East US"
# Vnet vars
  virtual_network_name = "vnet-name"
  subnet_name          = "default"
  address_space = "10.0.0.0/16"
  subnet_prefixes = ["10.0.0.0/24"]
# VM vars
  virtual_machine_name = "vm-name01"

  #  To enable diagnostics and storage for diagnostics 
  # boot_diagnostics_enabled      = false
  # diag_storage_account_name     = "csb100320004a1499a8"
  # storage_rg                    = "cloud-shell-storage-westeurope"

  # Image details
  # Windows OS
  os_provider                = "windows"
  windows_distribution_name    = "windows2019dc"
  virtual_machine_size       = "Standard_A2_v2"
  admin_password             = "Hollywood#2020"
  instances_count            = 1
# Inbound rules for windows
  nsg_inbound_rules = [
    {
      name                   = "rdp"
      destination_port_range = "3389"
      source_address_prefix  = "*"
    },

    {
      name                   = "http"
      destination_port_range = "80"
      source_address_prefix  = "*"
    },

## In case you have image already in place  
  # source_image_id 
  # custom_image = {
  #       publisher = string
  #     offer     = string
  #     sku       = string
  #     version   = string
  # }

## To deploy linux VM
  # Linux OS
  #   os_provider                = "linux"
  #   linux_distribution_name    = "ubuntu1804"
  #   virtual_machine_size       = "Standard_A2_v2"
  #   generate_admin_ssh_key     = false
  #   admin_ssh_key_data         = "~/.ssh/id_rsa.pub"
  #   instances_count            = 1

    # Network Seurity group port allow definitions for each Virtual Machine
    # Inbound rules for linux 
  #   nsg_inbound_rules = [
  #     {
  #       name                   = "ssh"
  #       destination_port_range = "22"
  #       source_address_prefix  = "*"
  #     },

  #     {
  #       name                   = "http"
  #       destination_port_range = "80"
  #       source_address_prefix  = "*"
  #     },
  #   ]

  ]

  # Adding TAG's to your Azure resources 
  tags = {
    ProjectName  = "demo-module"
    Env          = "development"
    Owner        = "user@example.com"
    Department   = "IT"
  }
}