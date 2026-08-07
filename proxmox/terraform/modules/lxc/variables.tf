variable "hostname" {
  type = string
}
variable "vmid" {
  description = "ID of the VM"
  type        = number
}
variable "template_file_id" {
  description = "Volume ID of the container template, e.g. local:vztmpl/ubuntu-26.04-standard_26.04-1_amd64.tar.zst"
  type        = string
}
variable "os_type" {
  description = "OS type reported to Proxmox"
  type        = string
  default     = "ubuntu"
}
variable "disk_size" {
  description = "Root disk size in GB"
  type        = number
  default     = 8
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