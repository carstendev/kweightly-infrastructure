# Use gcs as backend for tfsate files
terraform {
  backend "gcs" {
    bucket = "carstendev-de"
    prefix = "terraform-infra"
  }
}