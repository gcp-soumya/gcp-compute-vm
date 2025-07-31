# my-awesome-module/variables.tf

variable "gcp_project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
}

variable "instance_name" {
  description = "Name for the compute instance."
  type        = string
}

variable "machine_type" {
  description = "Machine type for the compute instance."
  type        = string
  default     = "e2-micro"
}

variable "gcp_zone" {
  description = "GCP zone for the compute instance."
  type        = string
}

variable "boot_disk_image" {
  description = "Image for the boot disk."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network_name" {
  description = "Name of the VPC network to attach the instance to."
  type        = string
  default     = "default"
}
