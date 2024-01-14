terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.api_url
  pm_api_token_id = var.api_token_id
  pm_api_token_secret = var.api_token_secret

  pm_tls_insecure = true
  pm_debug = true
}

resource "proxmox_vm_qemu" "cloudinit-test" {
  name = "${var.vm_name}-${count.index + 1}" 
  target_node = var.proxmox_target_node
  clone = var.template_name

  count = var.vm_count

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = var.vm_disk_size
    type = "scsi"
    storage = "data"
    iothread = 1
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=${var.vm_ip_prefix}${count.index + 1}/24,gw=${var.vm_ip_gw}"
  
  
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}