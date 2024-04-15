data "aws_vpcs" "existing_vpcs" {
  tags = {
    Name = "Dev-vpc"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpcs.existing_vpcs.ids[0]
  tags = {
    Name        = "${var.environment}-igw"
    Environment = "${var.environment}"
  }
}
