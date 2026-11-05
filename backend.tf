terraform {
  backend "s3" {
    bucket       = "pavani-terraform-state-2026"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}