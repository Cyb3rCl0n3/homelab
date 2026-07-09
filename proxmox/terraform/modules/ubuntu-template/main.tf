resource "proxmox_virtual_environment_vm" "ubuntu_template" {
  name      = "ubuntu-2604-template"
  vm_id     = var.vmid
  node_name = "pve"
  template  = true
  started   = false
  machine = "q35"

  cpu    {
		cores = 2
		type = "x86-64-v2-AES" 
	}

  memory { dedicated = 2048 }

  disk {
    datastore_id = "local-lvm"
    import_from  = var.image_downloaded ? "local:import/noble-server-cloudimg-amd64.qcow2" : proxmox_download_file.ubuntu_cloud_image[0].id
    interface    = "virtio0"
    size         = 20
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