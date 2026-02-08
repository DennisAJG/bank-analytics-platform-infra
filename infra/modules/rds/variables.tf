variable "environment" { type = string }
variable "name_prefix" { type = string }

variable "db_name" {
  type    = string
  default = "bank"
}

variable "engine_version" {
  type    = string
  default = "15.8"
}

variable "instance_class" {
  type    = string
  default = "db.t4g.small"
}

variable "allocated_storage" {
  type    = number
  default = 40
}

variable "backup_retention_period" {
  type    = number
  default = 30
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "vpc_id" { type = string }

variable "db_subnet_ids" {
  type = list(string)
}

variable "db_security_group_id" {
  type = string
}

variable "port" {
  type    = number
  default = 5432
}

# username fixo (senha vai pro Secrets Manager)
variable "master_username" {
  type    = string
  default = "postgres"
}

# Para deletar dev sem dor
variable "deletion_protection" {
  type    = bool
  default = false
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}
