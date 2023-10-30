# private subnet
resource "aws_subnet" "vpc_template_private_subnet" {
  count = length(var.vpc_private_subnet_list)

  vpc_id = aws_vpc.vpc_template.id
  cidr_block = var.vpc_private_subnet_list[count.index].cidr_block
  availability_zone = var.vpc_private_subnet_list[count.index].availability_zone
  tags = {
    name = var.tags.creator
    env = var.tags.env
  }
}


# private subnet 에서 internet access 를 위해 nat gateway 를 route table 에 추가합니다.
resource "aws_route_table" "vpc_template_private_route_table" {
  count = length(var.vpc_private_subnet_list) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc_template.id
  tags = {
    creator = var.tags.creator
    env = var.tags.env
  }
}


# nat 으로 향하는 route 를 추가합니다.
resource "aws_route" "vpc_template_private_nat_access" {
  count = var.nat_enabled && length(var.vpc_private_subnet_list) > 0 ? 1 : 0
  route_table_id         = aws_route_table.vpc_template_private_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vpc_template_nat_gateway[0].id
}


# route table 을 private subnet 에 연결합니다.
resource "aws_route_table_association" "vpc_template_private_subnet_association" {
  count = length(var.vpc_private_subnet_list)
  subnet_id = aws_subnet.vpc_template_private_subnet[count.index].id
  route_table_id = aws_route_table.vpc_template_private_route_table[0].id
}