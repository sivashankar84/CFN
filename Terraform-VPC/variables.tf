variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type = string
}

variable "subnet_cidr" {
  description = "Subnet CIDRS"
  type = list(string)
}

variable "environment" {
  description = "Environment"
  type = list(string)
}
