resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.hostname
  vm_id     = var.vmid
  node_name = "pve"

  clone { vm_id = 9000 }

  agent { enabled = false }
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
    user_account {
      username = var.username
    }
  }
}

output "ip" {
  value = split("/", var.ip_address)[0]
}