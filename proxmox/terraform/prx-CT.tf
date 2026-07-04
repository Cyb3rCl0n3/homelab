resource "proxmox_virtual_environment_container" "test" {
  node_name = "pve"
  vm_id     = 900

  disk {
    datastore_id = "local-lvm"
  }

  initialization {
    hostname = "tf-test-01"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  operating_system {
    template_file_id = "local:vztmpl/alpine-3.23-default_20260116_amd64.tar.xz"
    type              = "alpine"
  }
}