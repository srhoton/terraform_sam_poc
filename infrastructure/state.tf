terraform {
  backend "s3" {
    bucket = "srhoton-tfstate" 
    key = "sam/terraform.tfstate"
    region = "us-east-1"
  }
}
