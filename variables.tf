variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
  sensitive   = true
}

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-1"
}

variable "vpc_id" {
  type        = string
  description = "vpc id created by fatichi"
  default     = "vpc-0a983bd000891c04a"
}

variable "public_subnet_id" {
  type        = string
  description = "public subnet"
  default     = "subnet-066e829067dcc48ce"
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instnace"
  default     = "t2.micro"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Concil"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
  default     = "Migracao stack v4"
}

variable "name" {
  type        = string
  description = "tag Name"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "concilmigracao"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "concilmigracao.pub"
}

