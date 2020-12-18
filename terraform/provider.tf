provider "aws" {
  region = "sa-east-1"
}

terraform {
  backend "s3" {
    bucket = "meu-bucket-terraform"
    key    = "k3s-terraform"
    region = "sa-east-1"
  }
}
