# my-awesome-module/outputs.tf

output "instance_id" {
  description = "The ID of the created compute instance."
  value       = google_compute_instance.example_vm.id
}

output "instance_name" {
  description = "The name of the created compute instance."
  value       = google_compute_instance.example_vm.name
}

output "instance_ip_address" {
  description = "The internal IP address of the created compute instance."
  value       = google_compute_instance.example_vm.network_interface[0].network_ip
}
