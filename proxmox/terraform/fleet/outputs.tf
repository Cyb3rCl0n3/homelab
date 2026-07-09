output "ubuntu_vm" {
  value = {
    hostname = module.ubuntu_vm.hostname
    ip       = module.ubuntu_vm.ip
    vlan_id  = module.ubuntu_vm.vlan_id
  }
}

output "debian_vm" {
  value = {
    hostname = module.debian_vm.hostname
    ip       = module.debian_vm.ip
    vlan_id  = module.debian_vm.vlan_id
  }
}
