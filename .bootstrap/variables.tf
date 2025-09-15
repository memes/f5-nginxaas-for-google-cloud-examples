variable "name" {
  type = string
}

variable "labels" {
  type = map(string)
}

variable "project_id" {
  type = string
}

variable "iac_impersonators" {
  type    = list(string)
  default = []
}

variable "collaborators" {
  type    = set(string)
  default = []
}

variable "github_options" {
  type = object({
    private_repo = bool
    name         = string
    description  = string
    template     = string
  })
  nullable = false
  default = {
    private_repo = false
    name         = "f5-nginxaas-for-google-cloud-examples"
    description  = "Some deployment examples for F5 NGINXaaS for Google Cloud"
    template     = "memes/terraform-google-f5-demo-bootstrap-template"
  }
}

variable "nginx_jwt" {
  type        = string
  nullable    = true
  default     = null
  description = <<-EOD
  If not null or empty a Secret Manager secret containing the value of this string will be created, with access granted
  to Artifact Registry service account.
  EOD
}
