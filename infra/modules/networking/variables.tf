variable "environment" { type = string }
variable "name_prefix" { type = string }
variable "aws_region"   { type = string }

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Dev: 2 AZs já é bom; 3 se quiser evoluir depois
variable "az_count" {
  type    = number
  default = 2
}

# Subnet CIDRs (ajustáveis)
variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/20", "10.0.16.0/20"]
}

variable "private_app_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.32.0/20", "10.0.48.0/20"]
}

variable "private_db_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.64.0/20", "10.0.80.0/20"]
}

# Dev com 1 NAT (barato)
variable "single_nat_gateway" {
  type    = bool
  default = true
}
