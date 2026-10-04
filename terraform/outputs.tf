output "vm_ips" {
  description = "IP addresses of the created VMs"

  value = {
    for name, vm in proxmox_virtual_environment_vm.server :
    name => vm.ipv4_addresses
  }
}