variable "region" {
    default = "us-east-1"
}
variable "public_key" {
    type = string
    value = ${{ secrets.AWS_SSH_KEY_PUBLIC }}
    sensitive = true
}
variable "private_key" {
    type = string
    value = ${{ secrets.AWS_SSH_KEY_PRIVATE }}
    sensitive = true
}
variable "key_name" {
  
}
variable "aws-access-key" {
      type = string         
      value =  ${{ secrets.AWS_ACCESS_KEY_ID }}
      sensitive = true
}

variable "aws-secret-key" {
      type = string
      value = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      sensitive = true
}