resource "proxmox_download_file" "cloud_image" {
  count        = var.image_downloaded ? 0 : 1
  content_type = "import"
  datastore_id = "local"
  node_name    = "pve"
  url          = var.image_url
  file_name    = var.image_filename
}
