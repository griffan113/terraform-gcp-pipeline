# Configure GCP project
provider "google" {
  project = var.project
}

module "artifact-registry" {
  source = "./terraform/artifact-registry"
}

module "cloud-run" {
  source = "./terraform/cloud-run"
}
