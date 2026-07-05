# terraform/template.tf
resource "proxmox_download_file" "ubuntu_cloud_image" {
  content_type = "import"
  datastore_id = "local"
  node_name    = "pve"
  url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  file_name    = "noble-server-cloudimg-amd64.qcow2"
}

resource "proxmox_virtual_environment_vm" "ubuntu_template" {
  name      = "ubuntu-2404-template"
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
    import_from  = proxmox_download_file.ubuntu_cloud_image.id
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