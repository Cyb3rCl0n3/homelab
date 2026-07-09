output "vms" {
  value = {
    for name, m in module.vm : name => {
      hostname = m.hostname
      ip       = m.ip
      vlan_id  = m.vlan_id
    }
  }
}
