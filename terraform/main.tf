terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1.0"
    }
  }
}

locals {
  host_domain     = "mailmentor.link"
  app_domain_name = "mailmentor.link"
  api_domain_name = "api-mailmentor.link"
}

provider "aws" {
  region = "ap-northeast-1"
}