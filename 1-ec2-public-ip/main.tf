module "network" {
  source = "./modules/network"
}

module "ec2" {
  source         = "./modules/compute"
  vpc            = module.network.vpc
  public_subnets = module.network.public_subnetss

  depends_on = [module.network]
}