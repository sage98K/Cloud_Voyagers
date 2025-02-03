# 서울 NAT GW
resource "aws_eip" "nat_eip_seoul" {
  vpc = true
  tags = {
    Name = "CV_NAT_EIP_Seoul"
  }
}

resource "aws_nat_gateway" "nat_seoul" {
  allocation_id = aws_eip.nat_eip_seoul.id
  subnet_id     = aws_subnet.public_seoul.id
  tags = {
    Name = "CV_NAT_Seoul"
  }
}

# 버지니아 NAT GW
resource "aws_eip" "nat_eip_virginia" {
  provider = aws.virginia
  vpc      = true
  tags = {
    Name = "CV_NAT_EIP_Virginia"
  }
}

resource "aws_nat_gateway" "nat_virginia" {
  provider      = aws.virginia
  allocation_id = aws_eip.nat_eip_virginia.id
  subnet_id     = aws_subnet.public_virginia.id
  tags = {
    Name = "CV_NAT_Virginia"
  }
}
