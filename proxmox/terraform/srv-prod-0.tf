resource "proxmox_vm_qemu" "srv-prod-1" {
    name = "srv-prod-1"
    desc = "Server Production 1, Main Application Server, Ubuntu LTS"
    agent = 1
    target_node = "pve"
    qemu_os = "Linux"  # default other
    bios = "seabios"  # default=ovmf

    define_connection_info = false
    full_clone = false

    # -- boot process
    onboot = true
    startup = ""
    automatic_reboot = false  # refuse auto-reboot when changing a setting

    cores = 2
    sockets = 1
    cpu = "x86-64-v2-AES"
    memory = 2048

    network {
        bridge = "vmbr1"
        model  = "virtio"
        tag    = 10
    }

    scsihw = "virtio-scsi-pci"  # default virtio-scsi-pci

    disk {
        storage = "pv1"
        type = "virtio"
        size = "16G"
        iothread = 1
    }

    # -- lifecycle
    lifecycle {
        ignore_changes = [
            disk,
            vm_state,
            sshkeys
        ]
    }
    
    # Cloud Init Settings 
    ipconfig0 = "ip=10.10.10.2/24,gw=10.10.10.1"
    nameserver = "10.10.10.1"
    ciuser = "proxima"
    sshkeys = var.PUBLIC_SSH_KEY
}