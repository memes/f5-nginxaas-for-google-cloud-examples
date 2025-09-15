terraform {
  required_version = ">= 1.5"
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.6"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 7.1"
    }
  }
  backend "gcs" {
    bucket = "emes-stuff"
    prefix = "bootstrap/f5-nginxaas-for-google-cloud-examples"
  }
}


# This assumes the provider is configured via environment variables GITHUB_TOKEN and GITHUB_OWNER; change as necessary.
# See https://registry.terraform.io/providers/integrations/github/latest/docs
provider "github" {}

# This assumes the provider is configured via ADC credentials and/or environment variables; change as necessary.
# See https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
provider "google" {}



module "bootstrap" {
  source     = "registry.terraform.io/memes/f5-demo-bootstrap/google"
  version    = "0.3.2"
  project_id = var.project_id
  name       = var.name
  labels     = var.labels
  # spell-checker: disable
  bootstrap_apis = [
    "compute.googleapis.com",
    "config.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "iap.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "cloudtrace.googleapis.com",
  ]
  iac_roles = [
    "roles/compute.instanceAdmin",
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin",
    "roles/config.agent",
    "roles/container.admin",
    "roles/dns.admin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountTokenCreator",
    "roles/iap.admin",
    "roles/logging.logWriter",
  ]
  # spell-checker: enable
  iac_impersonators = var.iac_impersonators
  collaborators     = var.collaborators
  github_options    = var.github_options
  nginx_jwt         = var.nginx_jwt
}
