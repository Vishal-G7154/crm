terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Data sources
data "aws_availability_zones" "available" {
  state = "available"
}

# VPC Module
module "network" {
  source = "./modules/network"
  
  vpc_cidr_block           = var.vpc_cidr_block
  availability_zones       = data.aws_availability_zones.available.names
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_subnet_cidrs     = var.private_subnet_cidrs
  enable_nat_gateway       = true
  enable_dns_hostnames     = true
  enable_dns_support       = true
}

# Security Groups
module "security" {
  source = "./modules/security"
  
  vpc_id = module.network.vpc_id
}

# S3 Module
module "storage" {
  source = "./modules/storage"
  
  bucket_name = var.bucket_name
  environment = var.environment
}

# ECR Module
module "ecr" {
  source = "./modules/ecr"
  
  repository_name = var.repository_name
  environment     = var.environment
}

# Compute Module
module "compute" {
  source = "./modules/compute"
  
  vpc_id                    = module.network.vpc_id
  public_subnet_ids         = module.network.public_subnet_ids
  private_subnet_ids        = module.network.private_subnet_ids
  security_group_ids        = [module.security.web_sg_id, module.security.db_sg_id]
  instance_type             = var.instance_type
  key_name                  = var.key_name
  environment               = var.environment
  ecr_repository_url        = module.ecr.repository_url
}
