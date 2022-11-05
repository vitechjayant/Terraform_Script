resource "aws_vpc" "My-Infra" {
  cidr_block       = var.cidr_block
  
  tags = {
    Name = "My-Infra"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.My-Infra.id
  tags = {
    Name = "AWS-VPC_GW"
  }
}
