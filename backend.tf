terraform {
  backend "s3" {
    bucket = "concil-terraform-stack-28092022"
    key    = "remote.tfstate"
    region = "us-east-1"
  }
}
