output "service_url" {
  value = google_cloud_run_service.cloud_run.status[0].url
}