resource "google_cloud_run_service" "cloud_run" {
  name     = "hello"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"

      }
    }
  }
}

data "google_iam_policy" "all_users_policy" {
  binding {
    role    = "roles/run.invoker"
    members = [ "allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "all_users_iam_policy" {
  location = google_cloud_run_service.cloud_run.location
  service  = google_cloud_run_service.cloud_run.name

  policy_data = data.google_iam_policy.all_users_policy.policy_data
}