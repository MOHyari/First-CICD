variable "region" {
    default = "us-east-1"
}
variable "public_key" {
  
}
variable "private_key" {
  
}
variable "key_name" {
  
}
variable "aws-access-key" {
      type     = string
      sensitive = true
}

variable "aws-secret-key" {
      type     = string
      sensitive = true
}