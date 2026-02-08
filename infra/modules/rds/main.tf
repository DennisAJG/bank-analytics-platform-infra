locals {
  tags = {
    Environment = var.environment
    Project     = var.name_prefix
    ManagedBy   = "terraform"
  }

  identifier = "${var.name_prefix}-rds"
  secret_name = "${var.name_prefix}/rds/master"
}

resource "random_password" "master" {
  length  = 32
  special = true
}

resource "aws_secretsmanager_secret" "rds_master" {
  name = local.secret_name

  tags = merge(local.tags, {
    Name = local.secret_name
  })
}

resource "aws_secretsmanager_secret_version" "rds_master" {
  secret_id = aws_secretsmanager_secret.rds_master.id

  secret_string = jsonencode({
    username = var.master_username
    password = random_password.master.result
    engine   = "postgres"
    port     = var.port
    dbname   = var.db_name
  })
}

resource "aws_db_subnet_group" "this" {
  name       = "${local.identifier}-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = merge(local.tags, {
    Name = "${local.identifier}-subnet-group"
  })
}

resource "aws_db_parameter_group" "this" {
  name   = "${local.identifier}-pg"
  family = "postgres15"

  # Exemplos úteis (ajustamos depois se quiser)
  parameter {
    name  = "log_min_duration_statement"
    value = "500" # ms
  }

  tags = merge(local.tags, {
    Name = "${local.identifier}-pg"
  })
}

resource "aws_db_instance" "this" {
  identifier = local.identifier

  engine         = "postgres"
  engine_version = var.engine_version
  port           = var.port

  db_name  = var.db_name
  username = var.master_username
  password = random_password.master.result

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = "gp3"

  multi_az = var.multi_az

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.db_security_group_id]
  parameter_group_name   = aws_db_parameter_group.this.name

  backup_retention_period = var.backup_retention_period
  copy_tags_to_snapshot   = true

  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot

  # Segurança (a gente evolui com KMS custom depois)
  storage_encrypted = true

  # Evita downtime desnecessário em dev
  apply_immediately = true

  tags = merge(local.tags, {
    Name = local.identifier
  })

  depends_on = [aws_secretsmanager_secret_version.rds_master]
}
