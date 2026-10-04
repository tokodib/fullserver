provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true
}

resource "proxmox_virtual_environment_vm" "server" {
  for_each  = local.vms
  vm_id     = each.value.vm_id
  name      = each.value.name
  node_name = "axion-pve"

  on_boot = true

  clone {
    vm_id = 9000
    full  = true
  }

  cpu {
    cores = each.value.cores
  }

  memory {
    dedicated = each.value.memory
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = each.value.disk_size
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    user_account {
      username = "automation"

      keys = [
        var.ssh_public_key
      ]
    }

    ip_config {
      ipv4 {
        address = each.value.ip
        gateway = "192.168.1.1"
      }
    }
  }
}