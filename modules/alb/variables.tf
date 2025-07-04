variable "name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
variable "instance_ids" {
  type = list(string)
}
