locals {
  vms = {
    developer = {
        vm_id= 130
        name = "developer"
        ip = "192.168.1.130/24"
        cores = 2
        memory = 4096
        disk_size = 40
    }

    media = {
        vm_id= 120
        name = "media"
        ip = "192.168.1.120/24"
        cores = 2
        memory = 4096
        disk_size = 40
    }

    monitoring = {
        vm_id= 150
        name = "monitoring"
        ip = "192.168.1.150/24"
        cores = 2
        memory = 4096
        disk_size = 40
    }
  }
}