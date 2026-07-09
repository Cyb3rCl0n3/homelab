resource "proxmox_download_file" "ubuntu_cloud_image" {
  count       = var.image_downloaded ? 0 : 1
  content_type = "import"
  datastore_id = "local"
  node_name    = "pve"
  url          = "https://cloud-images.ubuntu.com/resolute/current/resolute-server-cloudimg-amd64.img"
  file_name    = "resolute-server-cloudimg-amd64.qcow2"
}