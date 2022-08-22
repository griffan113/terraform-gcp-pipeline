# Create the Cloud Run service
resource "google_cloud_run_service" "default" {
  name = "app"
  location = "us-east1"

  autogenerate_revision_name = true

  template {
    spec {
      containers {
        image = "us-east1-docker.pkg.dev/geral-tests-359900/gcloud-app/gcloud-app:1.0"
        ports {
          container_port = 3000
        }
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

# Display the service URL
output "service_url" {
  value = google_cloud_run_service.default.status[0].url
}