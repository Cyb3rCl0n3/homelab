resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.hostname
  vm_id     = var.vmid
  node_name = "pve"

  clone {
    vm_id   = var.template_vmid
    retries = 3
  }

  agent { enabled = false }
  cpu { cores = var.cores }
  memory { dedicated = var.memory }

  dynamic "disk" {
    for_each = var.disk_size == null ? [] : [var.disk_size]
    content {
      datastore_id = "local-lvm"
      interface    = "virtio0"
      size         = disk.value
    }
  }

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
      username = var.username
      keys     = [var.ssh_public_key]
    }
  }
}
