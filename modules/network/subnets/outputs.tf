output "public_subnets" {
  value = aws_subnet.public_subnets
}

output "private_subnets" {
  value = aws_subnet.private_subnets
}

output "public_route_table_associations" {
  value = aws_route_table_association.public_association
}

output "public_route_table" {
  value = aws_route_table.public_route_table
}