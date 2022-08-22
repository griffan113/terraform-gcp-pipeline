resource "google_artifact_registry_repository" "artifact_registry" {
  location      = "us-east1"
  repository_id = "gcloud-app"
  format        = "DOCKER"
}