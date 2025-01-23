module "security_groups" {
  source = "./security_group"
  vpc    = var.vpc
}

module "nestjs_launch_template" {
  source         = "./launch_template"
  security_group = module.security_groups.sg

  depends_on = [module.security_groups]
}

module "auto_scaling_group" {
  source          = "./auto_scaling_group"
  public_subnets  = var.public_subnets
  launch_template = module.nestjs_launch_template.launch_template

  depends_on = [module.nestjs_launch_template]
}