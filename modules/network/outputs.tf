output "vpc" {
  value = module.network_vpc.vpc
}

output "public_subnetss" {
  value = module.network_subnets.public_subnets
}

output "private_subnets" {
  value = module.network_subnets.private_subnets
}

output "public_route_table_associations" {
  value = module.network_subnets.public_route_table_associations
}

output "public_route_table" {
  value = module.network_subnets.public_route_table
}

output "internet_gateway" {
  value = module.network_internet_gateway.internet_gateway
}