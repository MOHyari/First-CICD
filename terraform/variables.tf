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

