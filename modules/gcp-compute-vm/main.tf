# my-awesome-module/main.tf

resource "google_compute_instance" "example_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.gcp_zone
  project      = var.gcp_project_id

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    network = var.network_name
  }
}
