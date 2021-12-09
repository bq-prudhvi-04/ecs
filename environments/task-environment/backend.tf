terraform {
  backend "s3" {
    profile = "default"
    bucket  = "terraformstatecode2"
    key     = "task/terraform.tfstate"
    region  = "us-east-1"

  }
}