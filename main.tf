# my-root-project/main.tf

# Define provider configuration
provider "google" {
  project = var.gcp_project_id
}

# Call your custom module
module "my_new_vm" {
  source = "./modules/gcp-compute-vm" # Path to your module directory

  gcp_project_id    = var.gcp_project_id
  instance_name = var.instance_name
  machine_type  = "e2-medium"
  gcp_zone = var.gcp_zone
  # boot_disk_image and network_name will use their defaults from the module
}

# Access outputs from the module
output "app_server_ip" {
  description = "Internal IP of the new app server."
  value       = module.my_new_vm.instance_ip_address
}

