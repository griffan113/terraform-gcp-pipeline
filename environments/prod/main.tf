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
  project = var.project
}

module "cloud-run" {
  source = "../../modules/cloud-run"
}
