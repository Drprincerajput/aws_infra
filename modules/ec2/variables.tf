variable "name" {}
variable "instance_count" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
variable "key_name" {}
