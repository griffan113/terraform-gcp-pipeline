terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.33.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "griffan"

    workspaces {
      name = "gcloud_app_github_pipeline"
    }
  }
}

# Configure GCP project
provider "google" {
  project      = var.project
  access_token = var.access_token
}

module "cloud-run" {
  source          = "./modules/cloud-run"
  container_image = var.container_image
  project         = var.project
  location        = var.location
}