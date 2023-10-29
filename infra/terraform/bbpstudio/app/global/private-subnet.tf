##############################################################################################################################
# private subnet 생성
##############################################################################################################################
resource "aws_subnet" "vpc_example_private_sub1" {
  vpc_id = aws_vpc.vpc_example.id
  cidr_block = "10.10.3.0/24"
  availability_zone = var.az_list[0]
  tags = {
    name = var.creator
    env = var.env
  }
}

resource "aws_subnet" "vpc_example_private_sub2" {
  vpc_id = aws_vpc.vpc_example.id
  cidr_block = "10.10.4.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az_list[1]
  tags = {
    name = var.creator
    env = var.env
  }
}

##############################################################################################################################
# private subnet 에서 internet access 를 위해 nat gateway 를 route table 에 추가합니다.
##############################################################################################################################
resource "aws_route_table" "vpc_example_private_route_table" {
  vpc_id = aws_vpc.vpc_example.id
  tags = {
    name = var.creator
    env = var.env
  }
}

resource "aws_route" "vpc_example_private_nat_access" {
  route_table_id         = aws_route_table.vpc_example_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vpc_example_nat_gateway.id
}

##############################################################################################################################
# route table 을 private subnet 에 연결합니다.
##############################################################################################################################
resource "aws_route_table_association" "vpc_example_private_subnet1_association" {
  subnet_id = aws_subnet.vpc_example_private_sub1.id
  route_table_id = aws_route_table.vpc_example_private_route_table.id
}

resource "aws_route_table_association" "vpc_example_private_subnet2_association" {
  subnet_id = aws_subnet.vpc_example_private_sub2.id
  route_table_id = aws_route_table.vpc_example_private_route_table.id
}