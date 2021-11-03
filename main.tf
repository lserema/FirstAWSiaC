terraform {
  required_providers {
    aws = {
      source  = "aws"
    }
  }
 backend "s3" {
  bucket = "xchange-terraform-state-bucket"
  key    = "state/terraform_state.tfstate"
  region = "us-east-1"
  }
}