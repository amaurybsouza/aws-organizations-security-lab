variable "aws_region" {
  description = "AWS region for provider operations"
  type        = string
  default     = "us-east-1"
}

variable "log_archive_email" {
  type        = string
  description = "Email for log archive account"
}

variable "security_tooling_email" {
  type        = string
  description = "Email for security tooling account"
}

variable "shared_services_email" {
  type        = string
  description = "Email for shared services account"
}

variable "dev_app_email" {
  type        = string
  description = "Email for development application account"
}

variable "prod_app_email" {
  type        = string
  description = "Email for production application account"
}