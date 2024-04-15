data "aws_vpcs" "existing_vpcs" {
  tags = {
    Name = "Dev-vpc"
  }
}

data "aws_availability_zones" "available" {}


resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpcs.existing_vpcs.ids[0]
  count                   = length(data.aws_availability_zones.available.names) >= 2 ? 2 : length(data.aws_availability_zones.available.names)
  cidr_block              = "${element(var.public_subnets_cidr,   count.index)}"
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-${element(data.aws_availability_zones.available.names, count.index)}-public-subnet"
    Environment = "${var.environment}"
  }
}





