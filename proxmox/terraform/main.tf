module "ubuntu_template" {
  source         = "./modules/vm-images"
  vmid           = 9000
  name           = "ubuntu-2404-template"
  image_filename = "noble-server-cloudimg-amd64.qcow2"
}

module "debian_template" {
  source         = "./modules/vm-images"
  vmid           = 9001
  name           = "debian-12-template"
  image_filename = "noble-server-cloudimg-amd64.qcow2"
}

locals {
  vms = {
    "dns-01" = {
      vmid          = 1001,
      template_vmid = 9001,
      ip_address    = "10.10.10.11/24",
      gateway       = "10.10.10.1",
      vlan_id       = 10,
      username      = "proxima",
      cores         = 1,
      memory        = 1024,
    roles = ["dns"] }

    "ubuntu-02" = {
      vmid          = 1002,
      template_vmid = 9000,
      ip_address    = "10.10.10.10/24",
      gateway       = "10.10.10.1",
      vlan_id       = 10,
      username      = "proxima",
      cores         = 1,
      memory        = 2048,
    roles = [] }
  }
}

module "vm" {
  source         = "./modules/vm"
  for_each       = local.vms
  hostname       = each.key
  vmid           = each.value.vmid
  template_vmid  = each.value.template_vmid
  ip_address     = each.value.ip_address
  gateway        = each.value.gateway
  vlan_id        = each.value.vlan_id
  username       = each.value.username
  ssh_public_key = var.PUBLIC_SSH_KEY
}