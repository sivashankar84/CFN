variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type = string
}

variable "environment" {
  description = "Env"
  type = string
}

variable "public_subnet_cidr" {
  description = "Public Subnet  CIDR Range"
  type = list(string)
}
