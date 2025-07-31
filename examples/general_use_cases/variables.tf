# modules/gcp-compute-vm/variables.tf

variable "project_id" {
  description = "The GCP project ID where the VM will be created."
  type        = string
}

variable "gcp_project_id" {
  description = "The GCP project ID where the VM will be created."
  type        = string
}

variable "zone" {
  description = "The GCP zone where the VM will be created (e.g., us-central1-a)."
  type        = string
}

variable "gcp_zone" {
  description = "The GCP zone where the VM will be created (e.g., us-central1-a)."
  type        = string
}


variable "instance_name" {
  description = "The name of the VM instance."
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM (e.g., e2-medium, n1-standard-1)."
  type        = string
  default     = "e2-medium"
}

variable "boot_disk_image" {
  description = "The boot disk image (e.g., debian-cloud/debian-11, ubuntu-os-cloud/ubuntu-2204-lts)."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "boot_disk_size_gb" {
  description = "The size of the boot disk in GB."
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "The type of the boot disk (e.g., pd-standard, pd-ssd)."
  type        = string
  default     = "pd-standard"
}

variable "boot_disk_auto_delete" {
  description = "Whether the boot disk should be auto-deleted when the instance is deleted."
  type        = bool
  default     = true
}

variable "network_name" {
  description = "The name of the VPC network to attach the VM to."
  type        = string
  default     = "default"
}

variable "subnetwork_name" {
  description = "The name of the subnetwork to attach the VM to. If not specified, a default subnetwork in the zone is used."
  type        = string
  default     = null # Allows the upstream module to pick a default if network_name is 'default'
}

variable "assign_external_ip" {
  description = "Whether to assign an ephemeral external IP address to the VM."
  type        = bool
  default     = true
}

variable "service_account_email" {
  description = "The email of the service account to attach to the VM. Leave empty to use the default compute service account."
  type        = string
  default     = "" # Empty string means default compute service account will be used
}

variable "service_account_scopes" {
  description = "List of OAuth2 scopes for the service account."
  type        = list(string)
  default     = ["cloud-platform"] # Broad scope for simplicity, narrow down in production
}

variable "network_tags" {
  description = "List of network tags applied to the VM, used for firewall rules."
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "A map of key/value labels to assign to the VM instance."
  type        = map(string)
  default     = {}
}

variable "metadata" {
  description = "A map of key/value metadata to set on the VM instance (e.g., for startup-script, ssh-keys)."
  type        = map(string)
  default     = {}
}

variable "additional_disks" {
  description = "List of additional data disks to attach to the VM."
  type = list(object({
    name        = string
    type        = string
    size_gb     = number
    auto_delete = bool
  }))
  default = []
}

variable "scheduling_config" {
  description = "Map of scheduling options for the VM (e.g., on_host_maintenance, automatic_restart, preemptible)."
  type        = map(any) # Using any to allow flexible scheduling options
  default = {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }
}

variable "can_ip_forward" {
  description = "Whether the VM can forward IP packets (e.g., for NAT or routing)."
  type        = bool
  default     = false
}
