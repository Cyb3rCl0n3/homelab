output "hostname" {
  value = var.hostname
}

output "ip_address" {
  value = var.ip_address
}

output "vlan_id" {
  value = var.vlan_id
}

output "ip" {
  value = split("/", var.ip_address)[0]
}