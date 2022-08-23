# Configure GCP project
provider "google" {
  project = var.project
}

module "cloud-run" {
  source = "../../modules/cloud-run"
}
