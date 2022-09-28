terraform {
    backend "s3" {
        bucket = "backend-terraform-concil"
        region = "us-east-1"
        encrypt = "true"
        key = "bastion/terraform.tfstate"
    }
}
