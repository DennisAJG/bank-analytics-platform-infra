locals {
  project      = "bank-analytics-plataform"
  environment  = "dev"
  cluster_name = "bank-eks-dev"

  tags = {
    Project     = local.project
    Environment = local.environment
    ManagedBy   = "terraform"
  }
}
