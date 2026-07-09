variable "hostname" {}
variable "vmid" {}
variable "template_vmid" {
  description = "VMID of the template to clone (e.g. 9000 = Ubuntu, 9001 = Debian; see images/main.tf)"
  type        = number
}
variable "ip_address" {} # CIDR
variable "gateway" {}
variable "vlan_id" {}
variable "cores" { default = 2 }
variable "memory" { default = 2048 }
variable "ssh_public_key" {}
variable "username" {
  description = "Cloud-init user created on the VM"
  type        = string
  default     = "proxima"
}
