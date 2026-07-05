module "test_vm" {
  source         = "./modules/ubuntu-vm"
  vmid           = 9101
  hostname       = "test-01"
  ip_address     = "10.10.10.11/24"
  gateway        = "10.10.10.1"
  vlan_id        = 10
  cores          = 2
  memory         = 3072
  username       = "proxima"
  ssh_public_key = file("~/.ssh/homelab_ansible.pub")
}