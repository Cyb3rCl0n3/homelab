module "test_vm" {
  source         = "./modules/ubuntu-vm"
  hostname       = "test-01"
  vmid           = 9101
  ip_address     = "10.10.10.11/24"
  gateway        = "10.10.10.1"
  vlan_id        = 10
  ssh_public_key = file("~/.ssh/ansible_ed25519.pub")
}