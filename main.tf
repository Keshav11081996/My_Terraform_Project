provider "aws" {
    region = "us-east-1"
}

provider "tls" {
  version = "3.0.0"
}


resource "aws_instance" "ec2" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  vpc_security_group_ids = module.security_groups.security_group_id
  subnet_id = module.vpc.public_subnet_id
}


resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


module "security_groups" {
  source = "./Terraform/security_groups"
}


module "vpc" {
  source = "./Terraform/vpc"
}