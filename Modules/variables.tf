#resource group
variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

#Vnet
variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

#subnet
variable "subnet_name" {
  type = string
}

variable "subnet_address_prefix" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}

variable "nic_name" {
  type = string
}

#virtual machine
variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
  default = "Standard_DS2_V2"
}

variable "admin_username" {
  type = string
  sensitive = true
}

variable "admin_passsword" {
  type = string
  sensitive = true
}

variable "os_disk_caching" {
  type = string
  default = "ReadWrite"
}

variable "storage_account_type" {
  type = string
  default = "Standard_LRS"
}

variable "image_sku" {
  type = string
  default = "2019-Datacenter"
}

variable "image_version" {
  type = string
  default = "latest"
}

#sql server
variable "sqlserver_name" {
  type = string
}

variable "sql_username" {
  type = string
  sensitive = true
}

variable "sql_password" {
  type = string
  sensitive = true
}

variable "sqldb_name" {
    type = string  
}

variable "sql_skuname" {
  type = string
}

variable "firewall_name" {
  type = string
}

variable "mssql_version" {
  type = string
}

variable "firewall_startIp" {
  type = string
}

variable "firewall_endIp" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "vm-ip" {
  type = string
}