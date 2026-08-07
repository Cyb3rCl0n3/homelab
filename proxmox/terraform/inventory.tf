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
    vms = merge(
      { for name, vm in local.vms : name => {
        hostname = name
        username = vm.username
        ip       = split("/", vm.ip_address)[0]
        vlan_id  = vm.vlan_id
        roles    = vm.roles
      } },
      # LXC containers are built from a vztmpl (no cloud-init), so
      # Proxmox only ever configures SSH keys for the root user.
      { for name, ct in local.lxc : name => {
        hostname = name
        username = "root"
        ip       = split("/", ct.ip_address)[0]
        vlan_id  = ct.vlan_id
        roles    = ct.roles
      } }
    )
  })
}
