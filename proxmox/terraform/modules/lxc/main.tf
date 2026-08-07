resource "proxmox_virtual_environment_container" "lxc" {
  vm_id     = var.vmid
  node_name = "pve"

  # Created directly from the vztmpl rather than cloned from a template
  # container: the PVE clone endpoint has no ssh-public-keys parameter, so
  # initialization.user_account only works on the create path.
  operating_system {
    template_file_id = var.template_file_id
    type             = var.os_type
  }

  unprivileged = true
  features {
    nesting = true
  }

  cpu { cores = var.cores }
  memory { dedicated = var.memory }

  disk {
    datastore_id = "local-lvm"
    size         = var.disk_size
  }

  network_interface {
    name    = "eth0"
    bridge  = "vmbr1"
    vlan_id = var.vlan_id
  }

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    user_account {
      keys = [var.ssh_public_key]
    }
  }
}
