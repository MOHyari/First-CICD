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