output "test_vm" {
  value = {
    hostname = module.test_vm.hostname
    ip       = module.test_vm.ip_address
    vlan_id  = module.test_vm.vlan_id
  }
}

output "test_vm_2" {
  value = {
    hostname = module.test_vm_2.hostname
    ip       = module.test_vm_2.ip_address
    vlan_id  = module.test_vm_2.vlan_id
  }
}
