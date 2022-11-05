resource "aws_vpc" "My-Infra" {
  cidr_block       = var.cidr_block
  
  tags = {
    Name = "My-Infra"
  }
}