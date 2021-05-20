resource "azurerm_resource_group" "tpot-RG" {
  name     = var.resource_group_name_tpot
  location = var.location
}

resource "azurerm_virtual_network" "tpot-net" {
  name                = "tpot-network"
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.tpot-RG.location
  resource_group_name = azurerm_resource_group.tpot-RG.name
}

resource "azurerm_subnet" "tpot-subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.tpot-RG.name
  virtual_network_name = azurerm_virtual_network.tpot-net.name
  address_prefixes     = ["10.0.0.0/25"]
}

resource "azurerm_public_ip" "tpot-public" {
  name                = "t-potPublicIP"
  resource_group_name = azurerm_resource_group.tpot-RG.name
  location            = azurerm_resource_group.tpot-RG.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "tpot-NIC" {
  name                = "tpot-nic"
  location            = azurerm_resource_group.tpot-RG.location
  resource_group_name = azurerm_resource_group.tpot-RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tpot-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tpot-public.id
  }
}

resource "azurerm_linux_virtual_machine" "tpot-vm" {
  name                = "Honeypot"
  resource_group_name = azurerm_resource_group.tpot-RG.name
  location            = azurerm_resource_group.tpot-RG.location
  size                = var.tpot-machinesize
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.tpot-NIC.id,
  ]
  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh-public
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-10"
    sku       = "10-cloudinit"
    version   = "0.0.1015"
  }
}