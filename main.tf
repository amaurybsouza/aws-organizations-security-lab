terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_organizations_organization" "this" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "securityhub.amazonaws.com"
  ]

  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure"
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "production" {
  name      = "Production"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_organizational_unit" "nonproduction" {
  name      = "NonProduction"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_account" "log_archive" {
  name      = "log-archive"
  email     = var.log_archive_email
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_account" "security_tooling" {
  name      = "security-tooling"
  email     = var.security_tooling_email
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_account" "shared_services" {
  name      = "shared-services"
  email     = var.shared_services_email
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}

resource "aws_organizations_account" "dev_app" {
  name      = "dev-app"
  email     = var.dev_app_email
  parent_id = aws_organizations_organizational_unit.nonproduction.id
}

resource "aws_organizations_account" "prod_app" {
  name      = "prod-app"
  email     = var.prod_app_email
  parent_id = aws_organizations_organizational_unit.production.id
}

resource "aws_organizations_policy" "deny_leave_org" {
  name        = "deny-leave-organization"
  description = "Prevents member accounts from leaving the organization"
  content     = file("${path.module}/policies/deny-leaving-org.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "deny_leave_org_root" {
  policy_id = aws_organizations_policy.deny_leave_org.id
  target_id = aws_organizations_organization.this.roots[0].id
}