locals {
  name_prefix = "bank-analytics-${var.environment}"
}

# (1) Networking (VPC, subnets, NAT, endpoints... no Passo C)
module "networking" {
  source      = "../../modules/networking"
  environment = var.environment
  name_prefix = local.name_prefix
}

# (2) IAM base (inclui role do GitHub Actions OIDC no Passo B)
module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
  name_prefix = local.name_prefix
}

# (3) ECR privado (imagens do Kubernetes virão daqui)
module "ecr" {
  source      = "../../modules/ecr"
  environment = var.environment
  name_prefix = local.name_prefix
}

# (4) EKS (cluster bank-eks-dev)
module "eks" {
  source      = "../../modules/eks"
  environment = var.environment
  name_prefix = local.name_prefix
  cluster_name = var.cluster_name

  # no Passo C vamos passar VPC/Subnets e IAM certinho
  # vpc_id     = module.networking.vpc_id
  # subnet_ids = module.networking.private_subnet_ids
}
