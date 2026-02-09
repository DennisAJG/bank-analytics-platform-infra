locals {
  name_prefix = "bank-analytics-${var.environment}"
}

module "networking" {
  source      = "../../modules/networking"
  environment = var.environment
  name_prefix = local.name_prefix
  aws_region  = var.aws_region
}

module "iam" {
  source       = "../../modules/iam"
  project      = local.name_prefix
  environment  = local.environment
  cluster_name = local.cluster_name
}

module "ecr" {
  source = "../../modules/ecr"
  #  environment = var.environment
  #  name_prefix = local.name_prefix
}

module "eks" {
  source = "../../modules/eks"
  #  environment  = var.environment
  #  name_prefix  = local.name_prefix
  #  cluster_name = var.cluster_name

  #  vpc_id             = module.networking.vpc_id
  #  private_subnet_ids = module.networking.private_app_subnet_ids
  #  public_subnet_ids  = module.networking.public_subnet_ids

  # prepara pro próximo passo
  #  nodes_security_group_id = module.networking.eks_nodes_sg_id
}


module "rds" {
  source = "../../modules/rds"

  environment = var.environment
  name_prefix = local.name_prefix

  vpc_id = module.networking.vpc_id

  db_subnet_ids        = module.networking.private_db_subnet_ids
  db_security_group_id = module.networking.db_sg_id

  db_name        = "bank"
  engine_version = "15.8"

  instance_class    = "db.t4g.small"
  allocated_storage = 40

  backup_retention_period = 30
  multi_az                = false

  deletion_protection = false
  skip_final_snapshot = true
}
