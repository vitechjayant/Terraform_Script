resource "aws_subnet" "subnets" {
  count = length(var.subnet_name_tags)
  vpc_id     = aws_vpc.My-Infra.id
  cidr_block = cidrsubnet(var.cidr_block, 8,count.index)
  availability_zone = format("${var.region}%s", count.index%2==0?"a":"b")

  tags = {
    Name = var.subnet_name_tags[count.index]
  }
}