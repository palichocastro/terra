terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "t1"

  instance_type          = "t3.micro"
  key_name               = "ami-pc"
  monitoring             = true
  vpc_security_group_ids = ["sg-0015e3892d8532ec8"]
  subnet_id              = "subnet-07c39d590a9189c7e"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
