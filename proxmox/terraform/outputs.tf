resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/generated.ini"
  content  = <<-EOT
  [test]
  ${module.test_vm.ip} ansible_user=ansible ansible_ssh_private_key_file=~/.ssh/homelab_ansible
  EOT
}