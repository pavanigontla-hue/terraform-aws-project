
terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "pavanigontla-hue-tfstate-2026-583921"
    key          = "terraform/state/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
