resource "aws_subnet" "vpc_example_public_sub1" {
  vpc_id = aws_vpc.vpc_example.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az_list[0]
  tags = {
    name = var.creator
    env = var.env
  }
}

resource "aws_subnet" "vpc_example_public_sub2" {
  vpc_id = aws_vpc.vpc_example.id
  cidr_block = "10.10.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az_list[1]
  tags = {
    name = var.creator
    env = var.env
  }
}

# aws_default_route_table 는 vpc 를 생성하면 생기는 기본 route table 을 terraform 이 관리할 수 있게 해줍니다.
# aws_route 로 설정을 적용할 수 있습니다.
resource "aws_default_route_table" "vpc_example" {
  default_route_table_id = aws_vpc.vpc_example.default_route_table_id
  tags = {
    name = var.creator
    env = var.env
  }
}

### internet gateway
resource "aws_internet_gateway" "vpc_example_igw" {
  vpc_id = aws_vpc.vpc_example.id
  tags = {
    name = var.creator
    env = var.env
  }
}

# aws_route 는 route table 에 라우팅 규칙을 추가하는 리소스입니다.
resource "aws_route" "vpc_example_public_internet_access" {
  #  route_table_id = aws_vpc.vpc_example.main_route_table_id
  route_table_id = aws_default_route_table.vpc_example.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc_example_igw.id
}

# private subnet 에서 internet access 를 위해 nat gateway 의 ip 를 생성합니다.
resource "aws_eip" "vpc_example_nat_eip" {
  domain = "vpc"
  depends_on = [aws_internet_gateway.vpc_example_igw]
  tags = {
    name = var.creator
    env = var.env
  }
}

# private subnet 에서 internet access 를 위해 nat gateway 를 public subnet 에 생성합니다.
resource "aws_nat_gateway" "vpc_example_nat_gateway" {
  allocation_id = aws_eip.vpc_example_nat_eip.id
  subnet_id = aws_subnet.vpc_example_public_sub1.id
  depends_on = [aws_internet_gateway.vpc_example_igw]
  tags = {
    name = var.creator
    env = var.env
  }
}


##############################################################################################################################
# route table 을 public subnet 에 연결합니다.
##############################################################################################################################
resource "aws_route_table_association" "vpc_example_public_subnet1_association" {
  subnet_id = aws_subnet.vpc_example_public_sub1.id
  route_table_id = aws_default_route_table.vpc_example.id
}

resource "aws_route_table_association" "vpc_example_public_subnet2_association" {
  subnet_id = aws_subnet.vpc_example_public_sub2.id
  route_table_id = aws_default_route_table.vpc_example.id
}