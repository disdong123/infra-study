# public subnet
resource "aws_subnet" "vpc_template_public_subnet" {
  vpc_id = aws_vpc.vpc_template.id
  count = length(var.vpc_public_subnet_list)
  cidr_block = var.vpc_public_subnet_list[count.index].cidr_block
  map_public_ip_on_launch = var.vpc_public_subnet_list[count.index].map_public_ip_on_launch
  availability_zone = var.vpc_public_subnet_list[count.index].availability_zone
  tags = {
    name = var.tags.creator
    env = var.tags.env
  }
}


# internet gateway
resource "aws_internet_gateway" "vpc_template_igw" {
  count = length(var.vpc_public_subnet_list) > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc_template.id
  tags = {
    name = var.tags.creator
    env = var.tags.env
  }
}


# aws_route 는 route table 에 라우팅 규칙을 추가하는 리소스입니다.
resource "aws_route" "vpc_template_public_internet_access" {
  count = length(var.vpc_public_subnet_list) > 0 ? 1 : 0
  route_table_id = aws_default_route_table.vpc_template.id  # route_table_id = aws_vpc.vpc_template.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc_template_igw[0].id
}


# private subnet 에서 internet access 를 위해 nat gateway 의 ip 를 생성합니다.
resource "aws_eip" "vpc_template_nat_eip" {
  count = var.nat_enabled && length(var.vpc_public_subnet_list) > 0 ? 1 : 0
  domain = "vpc"
  depends_on = [aws_internet_gateway.vpc_template_igw]
  tags = {
    name = var.tags.creator
    env = var.tags.env
  }
}


# private subnet 에서 internet access 를 위해 nat gateway 를 public subnet 에 생성합니다.
resource "aws_nat_gateway" "vpc_template_nat_gateway" {
  count = var.nat_enabled && length(var.vpc_public_subnet_list) > 0 ? 1 : 0
  allocation_id = aws_eip.vpc_template_nat_eip[0].id
  subnet_id = aws_subnet.vpc_template_public_subnet[0].id # 서브넷 1에 생성됩니다.
  depends_on = [aws_internet_gateway.vpc_template_igw]
  tags = {
    name = var.tags.creator
    env = var.tags.env
  }
}


# route table 을 public subnet 에 연결합니다.
resource "aws_route_table_association" "vpc_template_public_subnet_association" {
  count = length(var.vpc_public_subnet_list)
  subnet_id = aws_subnet.vpc_template_public_subnet[count.index].id
  route_table_id = aws_default_route_table.vpc_template.id
}