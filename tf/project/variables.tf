# GCP variables
variable "region" {
  default     = "europe-west3"
  description = "Region of resources"
}

variable "project_name" {
  default = {
    prod = "kweightly-prod"
    dev  = "kweightly-dev"
  }

  description = "The NAME of the Google Cloud project"
}

variable "billing_account" {
  description = "Billing account STRING."
}

variable "org_id" {
  type = number
  description = "Organization id NUMERIC."
}
