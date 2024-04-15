data "aws_vpcs" "existing_vpcs" {
  tags = {
    Name = "Dev-vpc"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpcs.existing_vpcs.ids[0]
  count                   = "${length(var.public_subnets_cidr)}"
  cidr_block              = "${element(var.public_subnets_cidr,   count.index)}"
  availability_zone       = "${element(var.availability_zones,   count.index)}"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-${element(var.availability_zones, count.index)}-      public-subnet"
    Environment = "${var.environment}"
  }
}
