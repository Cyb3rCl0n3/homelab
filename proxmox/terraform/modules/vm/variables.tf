variable "hostname" {
  type = string
}
variable "vmid" {
  description = "ID of the VM"
  type        = number
}
variable "template_vmid" {
  description = "VMID of the template to clone (e.g. 9000 = Ubuntu, 9001 = Debian; see images/main.tf)"
  type        = number
}
variable "ip_address" {
  description = "IP address (CIDR)"
  type        = string
}
variable "gateway" {
  type = string
}
variable "vlan_id" {
  type = number
}
variable "username" {
  type = string
}
variable "cores" {
  description = "Number of CPU cores"
  type        = number
}
variable "memory" {
  description = "Amount of RAM in MB"
  type        = number
}
variable "ssh_public_key" {
  description = "Public SSH key for the user account"
  type        = string
}
variable "disk_size" {
  description = "Root disk size in GB. Grows the cloned disk post-clone; leave unset to keep the template's size."
  type        = number
  default     = null
}