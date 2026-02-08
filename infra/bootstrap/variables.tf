variable "region" {
  type    = string
  default = "us-east-1"
}

variable "tfstate_bucket" {
  type = string
}

variable "tflock_table" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
