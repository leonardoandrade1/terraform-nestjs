# Create VPC
module "network_vpc" {
  source = "./vpc"
}

# Create Internet Gateway
module "network_internet_gateway" {
  source = "./internet_gateway"
  vpc_id = module.network_vpc.vpc.id

  depends_on = [module.network_vpc]
}

# Create public and private subnets
module "network_subnets" {
  source              = "./subnets"
  vpc_id              = module.network_vpc.vpc.id
  cidr_block          = module.network_vpc.vpc.cidr_block
  internet_gateway_id = module.network_internet_gateway.internet_gateway.id
  available_azs       = data.aws_availability_zones.available

  depends_on = [module.network_internet_gateway]
}