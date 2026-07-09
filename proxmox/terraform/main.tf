module "ubuntu-template" {
  source = "./modules/ubuntu-template"
  vmid   = 666
}

module "test_vm" {
  source         = "./modules/ubuntu-vm"
  vmid           = 9101
  hostname       = "test-01"
  ip_address     = "10.10.10.11/24"
  gateway        = "10.10.10.1"
  vlan_id        = 10
  cores          = 2
  memory         = 2048
  ssh_public_key = var.PUBLIC_SSH_KEY
}

module "test_vm_2" {
  source         = "./modules/ubuntu-vm"
  vmid           = 9102
  hostname       = "test-02"
  ip_address     = "10.10.10.12/24"
  gateway        = "10.10.10.1"
  vlan_id        = 10
  cores          = 2
  memory         = 2048
  ssh_public_key = var.PUBLIC_SSH_KEY
}