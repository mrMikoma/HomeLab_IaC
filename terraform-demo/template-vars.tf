# Proxmox host configuration
variable "api_url" {
    default = "https://<host-ip>/api2/json"
}

variable "proxmox_target_node" {
    default = "<node-name>"
}

variable "template_name" {
    default = "ubuntu-2204-cloudinit-template"
}

variable "vm_name" {
    default = "test-vm"
}

# API credentials
variable "api_token_id" {
    default = "<token-id>"
}

variable "api_token_secret" {
    default = "<token-secret>"
}

# VM configuration
variable "vm_count" {
    default = "1"
}

variable "vm_ip_prefix" {
    default = "<ip-prefix>"
}

variable "vm_ip_gw" {
    default = "<ip-getaway>"
}

variable "vm_disk_size" {
    default = "10G"
}

variable "ssh_key" {
    default = "<ssh-public-key>"
}