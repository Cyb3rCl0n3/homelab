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
  # LXC containers are built straight from vztmpl
  # https://bpg.sh/docs/resources/virtual_environment_file/?h=vztmpl#container-template-vztmpl
  ubuntu_lxc_template = "local:vztmpl/ubuntu-26.04-standard_26.04-1_amd64.tar.zst"

  vms = {
    "dns-01" = {
      vmid          = 1011,
      template_vmid = 9001,
      ip_address    = "10.10.10.11/24",
      gateway       = "10.10.10.1",
      vlan_id       = 10,
      username      = "proxima",
      cores         = 1,
      memory        = 1024,
    roles = ["dns"] }

    "ubuntu-02" = {
      vmid          = 1010,
      template_vmid = 9000,
      ip_address    = "10.10.10.10/24",
      gateway       = "10.10.10.1",
      vlan_id       = 10,
      username      = "proxima",
      cores         = 1,
      memory        = 2048,
    roles = [] }

    "docker-01" = {
      vmid          = 3010,
      template_vmid = 9000,
      ip_address    = "10.10.30.10/24",
      gateway       = "10.10.30.1",
      vlan_id       = 30,
      username      = "proxima",
      cores         = 2,
      memory        = 2048,
    roles = ["docker"] }

    "kasm-01" = {
      vmid          = 4010,
      template_vmid = 9000,
      ip_address    = "10.10.40.10/24",
      gateway       = "10.10.40.1",
      vlan_id       = 40,
      username      = "proxima",
      cores         = 2,
      memory        = 4096,
      disk_size     = 60,
    roles = ["kasm"] }
  }

  lxc = {
    "tunnel-01" = {
      vmid             = 4002,
      template_file_id = local.ubuntu_lxc_template,
      ip_address       = "10.10.40.2/24",
      gateway          = "10.10.40.1",
      vlan_id          = 40,
      cores            = 1,
      memory           = 512,
      disk_size        = 8,
    roles = ["tunnel"] }
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
  cores          = each.value.cores
  memory         = each.value.memory
  disk_size      = try(each.value.disk_size, null)
  ssh_public_key = var.PUBLIC_SSH_KEY

  depends_on = [module.ubuntu_template, module.debian_template]
}

module "lxc" {
  source           = "./modules/lxc"
  for_each         = local.lxc
  hostname         = each.key
  vmid             = each.value.vmid
  template_file_id = each.value.template_file_id
  ip_address       = each.value.ip_address
  gateway          = each.value.gateway
  vlan_id          = each.value.vlan_id
  cores            = each.value.cores
  memory           = each.value.memory
  disk_size        = each.value.disk_size
  ssh_public_key   = var.PUBLIC_SSH_KEY
}