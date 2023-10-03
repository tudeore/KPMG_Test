resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.rg.name
    address_prefixes = var.address_space
    virtual_network_name = azurerm_virtual_network.VNet.name
}

resource "azurerm_network_interface" "test-nic" {
  name = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.name.id
  }
}

resource "azurerm_network_security_group" "nsg" {
   name = var.nsg_name
   location = azurerm_resource_group.rg.location
   resource_group_name = azurerm_resource_group.rg.name
   security_rule {
    name = "RDP"
    priority = 1000
    direction = "Inbound"
    access = "Allow"
    protocol = "*"
    source_port_range = "*"
    destination_port_range = "3389"
    source_address_prefix = "*"
    destination_address_prefix = "*"
   }
}

resource "azurerm_network_interface_security_group_association" "VM-NSG" {
  network_interface_id = azurerm_network_interface.test-nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "name" {
  name = var.vm-ip
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Dynamic"
}