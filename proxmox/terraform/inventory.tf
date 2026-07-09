locals {
  vlan_groups = {
    10 = "infra"
    20 = "lab"
    30 = "internal"
    40 = "dmz"
  }

  vms = {
    ubuntu01 = {
      hostname = module.ubuntu_vm.hostname
      ip       = module.ubuntu_vm.ip
      vlan_id  = module.ubuntu_vm.vlan_id
    }
    debian01 = {
      hostname = module.debian_vm.hostname
      ip       = module.debian_vm.ip
      vlan_id  = module.debian_vm.vlan_id
    }
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../../ansible/inventory/generated.ini"

  content = <<EOT
${templatefile("${path.module}/templates/inventory.tftpl", {
  vms         = local.vms
  vlan_groups = local.vlan_groups
})}
EOT
}
