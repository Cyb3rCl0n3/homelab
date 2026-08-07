resource "proxmox_virtual_environment_container" "template" {
  vm_id     = var.vmid
  node_name = "pve"
  template  = true
  started   = false

  unprivileged = true
  features {
    nesting = true
  }

  cpu {cores = var.cores}
  memory { dedicated = var.memory }

  operating_system {
    template_file_id = "local:vztmpl/${var.image_filename}"
  }

  disk {
    datastore_id = "local-lvm"
    size      = var.disk_size
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  initialization {
    hostname = var.name
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
