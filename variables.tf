variable "aws_region" {}
variable "aws_profile" {}
variable "vpc_cidr" {}
data "aws_availability_zones" "available" {}
variable "cidrs" {
  type = map(string)
}
variable "domain_name" {}
variable "db_instance_class" {}
variable "dbname" {}
variable "dbuser" {}
variable "dbpassword" {}
variable "dev_instance_type" {}
variable "dev_ami" {}
variable "key_name" {}
variable "public_key_path" {}
