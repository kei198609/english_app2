####################################################
# VPC
####################################################
resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "myapp-prod-vpc"
  }
}
####################################################
# Subnet
####################################################
resource "aws_subnet" "prod_front_subnet_public_1a" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    "Name" = "myapp-prod-front-subnet-public-1a"
  }
}

resource "aws_subnet" "prod_front_subnet_public_1c" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    "Name" = "myapp-prod-front-subnet-public-1c"
  }
}

resource "aws_subnet" "prod_back_subnet_public_1a" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    "Name" = "myapp-prod-back-subnet-public-1a"
  }
}

resource "aws_subnet" "prod_back_subnet_public_1c" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    "Name" = "myapp-prod-back-subnet-public-1c"
  }
}

resource "aws_subnet" "prod_rds_subnet_private_1a" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    "Name" = "myapp-prod-rds-subnet-private-1a"
  }
}

resource "aws_subnet" "prod_rds_subnet_private_1c" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    "Name" = "myapp-prod-rds-subnet-private-1c"
  }
}

####################################################
# Internet Gateway
####################################################
resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id
  tags = {
    "Name" = "myapp-prod-igw"
  }
}

####################################################
# Route Table
####################################################
resource "aws_route_table" "prod-front-public-rtb" {
  vpc_id = aws_vpc.prod_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }
  tags = {
    "Name" = "myapp-prod-front-public-rtb"
  }
}

resource "aws_route_table" "prod-back-public-rtb" {
  vpc_id = aws_vpc.prod_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }
  tags = {
    "Name" = "myapp-prod-back-public-rtb"
  }
}

resource "aws_route_table" "prod-rds-public-rtb" {
  vpc_id = aws_vpc.prod_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }
  tags = {
    "Name" = "myapp-prod-rds-public-rtb"
  }
}