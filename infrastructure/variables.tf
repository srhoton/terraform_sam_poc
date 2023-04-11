variable "base_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "192.168.0.0/16"
}

variable "env_name" {
  description = "The name of the environment."
  default     = "sam-terraform-poc"
}

variable "token_issuer" {
  description = "The issuer of the JWT token."
  default     = "https://dw-tst.auth0.com/"
}

variable "jwks_uri" {
  description = "The JWKS URI."
  default     = "https://dw-tst.auth0.com/.well-known/jwks.json"
}
  
variable "audience" {
  description = "The audience of the JWT token."
  default     = "https://dw-tst.auth0.com/api/v2/"
}
