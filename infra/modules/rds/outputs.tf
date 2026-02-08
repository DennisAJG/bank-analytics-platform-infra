output "db_instance_id" {
  value = aws_db_instance.this.id
}

output "endpoint" {
  value = aws_db_instance.this.address
}

output "port" {
  value = aws_db_instance.this.port
}

output "secret_arn" {
  value = aws_secretsmanager_secret.rds_master.arn
}

output "db_name" {
  value = var.db_name
}
