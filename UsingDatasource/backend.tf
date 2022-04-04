terraform {
  backend "s3" {
    bucket = "tf-state-akku"
    key = "development/terraform"
    region = "us-east-1"

  }
}