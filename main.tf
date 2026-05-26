resource "aws_vpc" "development" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "development_vpc"
  }
}


resource "aws_subnet" "Public_Subnet_us_east_1a" {
  vpc_id            = aws_vpc.development.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "development_vpc_Public_Subnet-us-east-1a"
  }
}

resource "aws_subnet" "Public_Subnet_us_east_1b" {
  vpc_id            = aws_vpc.development.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "development_vpc_Public_Subnet-us-east-1b"
  }
}

resource "aws_subnet" "Private_Subnet_us_east_1a" {
  vpc_id            = aws_vpc.development.id
  cidr_block        = "10.0.40.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "development_vpc_Private_Subnet-us-east-1a"
  }
}

resource "aws_subnet" "Private_Subnet_us_east_1b" {
  vpc_id            = aws_vpc.development.id
  cidr_block        = "10.0.50.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "development_vpc_Private_Subnet-us-east-1b"
  }
}