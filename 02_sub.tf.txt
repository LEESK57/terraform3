# 가용 영역 a의 public subnet
resource "aws_subnet" "sdkim_puba" {
  vpc_id            = aws_vpc.sdkim_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "sdkim-puba"
  }
}

# 가용 영역 c의 public subnet
resource "aws_subnet" "sdkim_pubc" {
  vpc_id            = aws_vpc.sdkim_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "sdkim-pubc"
  }
}

# 가용 영역 a의 private subnet
resource "aws_subnet" "sdkim_pria" {
  vpc_id            = aws_vpc.sdkim_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "sdkim-pria"
  }
}

# 가용 영역 c의 private subnet
resource "aws_subnet" "sdkim_pric" {
  vpc_id            = aws_vpc.sdkim_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "sdkim-pric"
  }
}

# 가용 영역 a의 private db subnet
resource "aws_subnet" "sdkim_pridba" {
  vpc_id            = aws_vpc.sdkim_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "sdkim-pridba"
  }
}

# 가용 영역 c의 private db subnet
resource "aws_subnet" "sdkim_pridbc" {
  vpc_id            = aws_vpc.sdkim_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "sdkim-pridbc"
  }
}