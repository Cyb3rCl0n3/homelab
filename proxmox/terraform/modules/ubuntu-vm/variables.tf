# modules/ubuntu-vm/variables.tf
variable "hostname"    {}
variable "vmid"        {}
variable "ip_address"  {}   # CIDR
variable "gateway"     {}
variable "vlan_id"     {}
variable "cores"       { default = 2 }
variable "memory"      { default = 2048 }
variable "ssh_public_key" {}
