module "ubuntu_template" {
  source         = "../modules/vm-images"
  vmid           = 9000
  name           = "ubuntu-2404-template"
  image_url      = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  image_filename = "noble-server-cloudimg-amd64.qcow2"
}

module "debian_template" {
  source         = "../modules/vm-images"
  vmid           = 9001
  name           = "debian-12-template"
  image_url      = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
  image_filename = "debian-12-genericcloud-amd64.qcow2"
}
