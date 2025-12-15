variable "vm_name" {}
variable "rg_name" {}
variable "location" {}
variable "subnet_id" {}

variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
