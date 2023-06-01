output "admin_ssh_key_public" {
  description = "The generated public key data in PEM format"
  value       = var.generate_admin_ssh_key == true && var.os_provider == "linux" ? tls_private_key.rsa[0].public_key_openssh : null
}

output "admin_ssh_key_private" {
  description = "The generated private key data in PEM format"
  sensitive   = true
  value       = var.generate_admin_ssh_key == true && var.os_provider == "linux" ? tls_private_key.rsa[0].private_key_pem : null
}

output "windows_vm_password" {
  description = "Password for the windows VM"
  sensitive   = true
  value       = var.os_provider == "windows" ? element(concat(random_password.passwd.*.result, [""]), 0) : null
}

output "linux_virtual_machine_ids" {
  description = "The resource id's of all Linux Virtual Machine."
  value       = var.os_provider == "linux" ? concat(azurerm_virtual_machine.linux_vm.*.id, [""]) : null
}

output "windows_virtual_machine_ids" {
  description = "The resource id's of all Windows Virtual Machine."
  value       = var.os_provider == "windows" ? concat(azurerm_virtual_machine.win_vm.*.id, [""]) : null
}

output "network_security_group_ids" {
  description = "List of Network security groups and ids"
  value       = azurerm_network_security_group.nsg.id
}