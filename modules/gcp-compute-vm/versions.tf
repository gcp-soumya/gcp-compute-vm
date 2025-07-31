# my-awesome-module/versions.tf

terraform {
  required_version = ">= 1.0.0" # Minimum Terraform CLI version

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0" # Minimum Google provider version
    }
  }
}
