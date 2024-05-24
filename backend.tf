terraform {
  backend "s3" {
    bucket = "freelo-tfstate"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}