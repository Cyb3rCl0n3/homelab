locals {
  vlan_groups = {
    10 = "infra"
    20 = "lab"
    30 = "internal"
    40 = "dmz"
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/generated.ini"
  content = templatefile("${path.module}/templates/inventory.tftpl", {
    vlan_groups = local.vlan_groups
    vms = {
      for name, vm in local.vms : name => {
        hostname = name
        username = vm.username
        ip       = split("/", vm.ip_address)[0]
        vlan_id  = vm.vlan_id
        roles    = vm.roles
      }
    }
  })
}
