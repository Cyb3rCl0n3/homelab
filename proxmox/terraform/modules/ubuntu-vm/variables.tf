# modules/ubuntu-vm/variables.tf
variable "hostname"    {}
variable "vmid"        {}
variable "ip_address"  {}   # CIDR
variable "gateway"     {}
variable "vlan_id"     {}
variable "cores"       { default = 2 }
variable "memory"      { default = 2048 }
variable "ssh_public_key" {}

# modules/ubuntu-vm/main.tf
resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.hostname
  vm_id     = var.vmid
  node_name = "homelab-core-01"

  clone { vm_id = 9000 }

  agent { enabled = true }
  cpu    { cores = var.cores }
  memory { dedicated = var.memory }

  network_device {
    bridge  = "vmbr1"
    vlan_id = var.vlan_id
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }
    user_account {
      username = "ansible"
      keys     = [var.ssh_public_key]
    }
  }
}

output "ip" {
  value = split("/", var.ip_address)[0]
}