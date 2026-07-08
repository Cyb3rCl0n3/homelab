locals {
  vlan_groups = {
    10 = "infra"
    20 = "lab"
    30 = "internal"
    40 = "dmz"
  }

  vms = {
    test01 = {
      hostname = module.test_vm.hostname
      ip       = split("/", module.test_vm.ip_address)[0]  # strips the /24
      vlan_id  = module.test_vm.vlan_id
    }
    # test02 = {
    #   hostname = module.test_vm_2.hostname
    #   ip       = split("/", module.test_vm_2.ip_address)[0]
    #   vlan_id  = module.test_vm_2.vlan_id
    # }
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/generated.ini"

  content = <<EOT
${templatefile("${path.module}/templates/inventory.tftpl", {
  vms         = local.vms
  vlan_groups = local.vlan_groups
})}
EOT
}