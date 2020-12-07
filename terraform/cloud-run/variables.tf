variable "project_id" {
  description = "GCP project ID"
}

variable "region" {
  description = "name of specific region to deploy services into, e.g. eu-west1"
  default = "europe-west1"
}
