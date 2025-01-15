variable "region" {
    default = "us-east-1"
}
variable "public_key" {
  
}
variable "private_key" {
  
}
variable "key_name" {
  
}
variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
  default     = ""
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  default     = ""
}

variable "tf_state_bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default     = ""
}

variable "private_ssh_key" {
  description = "Private SSH key for accessing instances"
  type        = string
  default     = ""
}

variable "public_ssh_key" {
  description = "Public SSH key for accessing instances"
  type        = string
  default     = ""
}