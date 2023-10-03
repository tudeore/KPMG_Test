variable "vm_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "connection_type" {
  type = string
  default = "winrm"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}