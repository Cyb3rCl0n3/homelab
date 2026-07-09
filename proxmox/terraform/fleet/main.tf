module "ubuntu_vm" {
  source         = "../modules/vm"
  vmid           = 1001
  template_vmid  = 9000 # ubuntu-2404-template (see ../images/main.tf)
  hostname       = "ubuntu-01"
  ip_address     = "10.10.10.11/24"
  gateway        = "10.10.10.1"
  vlan_id        = 10
  ssh_public_key = var.PUBLIC_SSH_KEY
}

module "debian_vm" {
  source         = "../modules/vm"
  vmid           = 1002
  template_vmid  = 9001 # debian-12-template (see ../images/main.tf)
  hostname       = "debian-01"
  ip_address     = "10.10.10.10/24"
  gateway        = "10.10.10.1"
  vlan_id        = 10
  ssh_public_key = var.PUBLIC_SSH_KEY
}
