# GCP Compute VM Instance Module

This Terraform module provisions a Google Compute Engine (GCE) Virtual Machine instance. It wraps the official `terraform-google-modules/compute-instance/google` module, providing a simplified interface for common VM configurations.

## Usage Example

To use this module, include it in your root Terraform configuration (`main.tf`) and provide the required input variables.

```terraform
# main.tf in your root configuration

# Configure the Google Cloud provider
provider "google" {
  project = var.gcp_project_id
}

module "my_web_server_vm" {
  source = "./modules/gcp-compute-vm" # Path to your local module

  project_id   = var.gcp_project_id
  zone         = var.gcp_zone
  instance_name = "web-server-01"
  machine_type = "e2-medium"

  boot_disk_image = "ubuntu-os-cloud/ubuntu-2204-lts"
  boot_disk_size_gb = 30

  network_name    = "my-custom-vpc"
  subnetwork_name = "my-custom-subnet-us-central1"
  assign_external_ip = true

  service_account_email = "my-app-sa@${var.gcp_project_id}.iam.gserviceaccount.com"
  service_account_scopes = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write"
  ]

  network_tags = ["http-server", "web-server"]

  labels = {
    environment = "dev"
    application = "web"
  }

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      sudo apt-get update
      sudo apt-get install -y nginx
      echo "Hello from $(hostname)!" | sudo tee /var/www/html/index.html
      sudo systemctl start nginx
    EOT
    ssh-keys       = "your_user:ssh-rsa AAAAB3NzaC... your_user@your_machine"
  }

  additional_disks = [
    {
      name        = "data-disk-web-01"
      type        = "pd-ssd"
      size_gb     = 50
      auto_delete = true
    }
  ]

  scheduling_config = {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

  can_ip_forward = false
}

# Example of how to access outputs from the module
output "web_server_external_ip" {
  description = "The external IP address of the deployed web server VM."
  value       = module.my_web_server_vm.instance_external_ip
}
