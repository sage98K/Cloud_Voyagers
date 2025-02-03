# 서울 라우팅 테이블
resource "aws_route_table" "public_rt_seoul" {
  vpc_id = aws_vpc.seoul.id
  tags = {
    Name = "CV_Public_RT_Seoul"
  }
}

resource "aws_route" "public_route_seoul" {
  route_table_id         = aws_route_table.public_rt_seoul.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_seoul.id
}

resource "aws_route_table_association" "public_rt_assoc_seoul" {
  subnet_id      = aws_subnet.public_seoul.id
  route_table_id = aws_route_table.public_rt_seoul.id
}

# 버지니아 라우팅 테이블
resource "aws_route_table" "public_rt_virginia" {
  provider = aws.virginia
  vpc_id   = aws_vpc.virginia.id
  tags = {
    Name = "CV_Public_RT_Virginia"
  }
}

resource "aws_route" "public_route_virginia" {
  provider              = aws.virginia
  route_table_id         = aws_route_table.public_rt_virginiae.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_virginia.id
}

resource "aws_route_table_association" "public_rt_assoc_virginia" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.public_virginia.id
  route_table_id = aws_route_table.public_rt_virginia.id
}
