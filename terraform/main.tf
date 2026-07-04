terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.70"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://<proxmox-ip>:8006/"
  api_token = "terraform@pve!tf=<your-secret>"
  insecure  = true
}

resource "proxmox_virtual_environment_container" "test" {
  node_name = "core-01"
  vm_id     = 900

  initialization {
    hostname = "tf-test-01"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  operating_system {
    template_file_id = "local:vztmpl/alpine-3.20-default_20240808_amd64.tar.xz"
    type              = "alpine"
  }
}