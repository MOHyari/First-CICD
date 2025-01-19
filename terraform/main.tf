variable "region" {
    default = "us-east-1"
}

variable "public_key" {
    description = "The public key for SSH access"
}

variable "private_key" {
    description = "The private key for SSH access"
}

variable "key_name" {
    description = "The name of the key pair"
}

variable "aws_access_key_id" {
    description = "AWS Access Key ID"
}

variable "aws_secret_access_key" {
    description = "AWS Secret Access Key"
}

terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~>4.0"
        }
    }
    backend "s3" {
        key = "aws/ec2-deploy/terraform.tfstate"
    }
}

provider "aws" {
    region     = var.region
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
}

resource "aws_instance" "server" {
    ami                    = "ami-0e2c8caa4b6378d8c"
    instance_type         = "t2.micro"
    key_name              = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.firstgroup.id]
    iam_instance_profile   = aws_iam_instance_profile.ec2-profile.name

    connection {
        type        = "ssh"
        host        = self.public_ip
        user        = "ubuntu"  # Corrected from "ubumtu"
        private_key = var.private_key
        timeout     = "4m"
    }

    tags = {
        "name" = "Deploy Virtual Machine"
    }
}

resource "aws_iam_instance_profile" "ec2-profile" {
    name = "ec2-profile"
    role = "EC2-ECR-AUTH"
}

resource "aws_security_group" "firstgroup" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            description = "Allow all outbound traffic"
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
        }
    ]

    ingress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            description = "Allow SSH"
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
        },
        {
            cidr_blocks = ["0.0.0.0/0"]
            description = "Allow HTTP"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
        }
    ]
}

resource "aws_key_pair" "deployer" {
    key_name   = var.key_name
    public_key = var.public_key
}

output "instance_public_ip" {
    value     = aws_instance.server.public_ip
    sensitive = true
}
