# Create Internet Gateway
resource "aws_internet_gateway" "internet_gtw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "VPC-id-${var.vpc_id}-internet-gateway"
  }
}