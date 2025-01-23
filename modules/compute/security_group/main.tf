resource "aws_security_group" "ec2_sg" {
  name        = "nestjs-ec2-sg"
  description = "Allow traffic to NestJS EC2 instances"
  vpc_id      = var.vpc.id

  ingress {
    from_port   = 3000
    to_port     = 3000 ## define NESTJS port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from any IP address
  }

  ingress {
    from_port   = 443
    to_port     = 443 ## define NESTJS port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTPS traffic from any IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NestJS-EC2-SG"
  }
}