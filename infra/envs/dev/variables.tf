variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "owner" {
  type        = string
  description = "Owner/Team tag"
  default     = "Dennis"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "bank-eks-dev"
}

# Vamos usar no Passo B (remote state)
variable "tf_state_bucket" {
  type        = string
  description = "S3 bucket name for terraform remote state"
  default     = ""
}

variable "tf_state_dynamodb_table" {
  type        = string
  description = "DynamoDB table name for terraform state locking"
  default     = ""
}
