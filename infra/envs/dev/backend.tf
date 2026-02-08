terraform {
  backend "s3" {
    bucket         = "REPLACE_ME_STATE_BUCKET"
    key            = "bank-analytics/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "REPLACE_ME_LOCK_TABLE"
    encrypt        = true
  }
}
