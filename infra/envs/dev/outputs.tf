output "cluster_name" {
  value = var.cluster_name
}

output "rds_endpoint" { value = module.rds.endpoint }
output "rds_port"     { value = module.rds.port }
output "rds_secret_arn" { value = module.rds.secret_arn }
