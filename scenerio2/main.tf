data "azurerm_virtual_machine" "windows-vm" {
  name = var.vm_name
  resource_group_name = var.rg_name
}

resource "null_resource" "metadata_query" {
  triggers = {
    instance_id = data.azurerm_virtual_machine.windows-vm.id
  }

  provisioner "remote-exec" {
    connection {
      type = var.connection_type
      user = var.username
      password = var.password
      host = data.azurerm_virtual_machine.windows-vm.public_ip_address
    }

    inline = [ 
      "curl -H Metadata:true --noproxy '*' -s --connect-timeout 5 http://169.254.169.254/metadata/instance?api-version=2021-02-01 > C:/Users/devopsuser/instance_metadata.json"
     ]
  }
}