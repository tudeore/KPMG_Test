resource "azurerm_windows_virtual_machine" "VM" {
  name = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  size = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_passsword
  network_interface_ids = [ 
        azurerm_network_interface.test-nic.id
   ]
   os_disk {
     caching = var.os_disk_caching
     storage_account_type = var.storage_account_type
   }

    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = var.image_sku
      version = var.image_version
    }
    
}