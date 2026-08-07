output "vms" {
  value = {
    for name, m in module.vm : name => {
      hostname = m.hostname
      ip       = m.ip
      vlan_id  = m.vlan_id
    }
  }
}

output "lxc" {
  value = {
    for name, m in module.lxc : name => {
      hostname = m.hostname
      ip       = m.ip
      vlan_id  = m.vlan_id
    }
  }
}
