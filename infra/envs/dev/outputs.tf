output "cluster_name" {
  value = var.cluster_name
}

output "rds_endpoint" { value = module.rds.endpoint }
output "rds_port"     { value = module.rds.port }
output "rds_secret_arn" { value = module.rds.secret_arn }

output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_app_subnet_ids" {
  value = module.networking.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  value = module.networking.private_db_subnet_ids
}

output "alb_sg_id" {
  value = module.networking.alb_sg_id
}

output "eks_nodes_sg_id" {
  value = module.networking.eks_nodes_sg_id
}

output "db_sg_id" {
  value = module.networking.db_sg_id
}

output "nat_gateway_id" {
  value = module.networking.nat_gateway_id
}
