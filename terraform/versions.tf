terraform {
  required_version = ">= 1.0.10"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      pj    = "ecs"
      env   = "metrics"
      owner = "mori"
    }
  }
}