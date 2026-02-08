provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "bank-analytics-platform"
      Environment = var.environment
      ManagedBy   = "terraform"
      Owner       = var.owner
    }
  }
}
