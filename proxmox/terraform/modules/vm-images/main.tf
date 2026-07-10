resource "proxmox_virtual_environment_vm" "template" {
  name      = var.name
  vm_id     = var.vmid
  node_name = "pve"
  template  = true
  started   = false
  machine   = "q35"

  cpu {
    cores = var.cores
    type  = "x86-64-v2-AES"
  }

  memory { dedicated = var.memory }

  disk {
    datastore_id = "local-lvm"
    import_from  = "local:import/${var.image_filename}"
    #import_from  = var.image_downloaded ? "local:import/${var.image_filename}" : proxmox_download_file.cloud_image[0].id
    interface = "virtio0"
    size      = var.disk_size
  }

  network_device { bridge = "vmbr0" }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
