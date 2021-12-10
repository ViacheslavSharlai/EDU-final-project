terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }

  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

provider "cloudflare" {
  email   = "viacheslav.sharlai@dev.pro"
  api_key = "22297607cf3c46092d838037fc1ec412501f7"
}
