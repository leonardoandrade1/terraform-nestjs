/*
    ####### PUBLIC SUBNET #######
*/

# Create Public subnets for each AZ 
resource "aws_subnet" "public_subnets" {
  count                   = length(var.available_azs.names)
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone       = var.available_azs.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Create public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  # This block can remove "aws_route" resource
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
}

# Associate Route Table with Public subnets
resource "aws_route_table_association" "public_association" {
  count          = length(var.available_azs.names)
  subnet_id      = aws_subnet.public_subnets.*.id[count.index]
  route_table_id = aws_route_table.public_route_table.id
}

/*
    ####### PRIVATE SUBNET #######
*/

# Create Private subnets for each AZ
resource "aws_subnet" "private_subnets" {
  count                   = length(var.available_azs.names)
  vpc_id                  = var.vpc_id
  availability_zone       = var.available_azs.names[count.index]
  cidr_block              = cidrsubnet(var.cidr_block, 8, length(var.available_azs.names) + count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

# Note:
# Why we do not wave NAT Gateway, Elastic IP or route table configured for private subnets? 
# We don't have plans to resources on private subnet access internet