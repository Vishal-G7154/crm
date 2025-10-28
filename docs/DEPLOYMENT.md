# Deployment Guide

## Local Development
```bash
cp .env.example .env
make dev
```

## Production Deployment

### 1. Infrastructure Setup
```bash
cd infra/terraform/envs/prod
terraform init
terraform plan
terraform apply
```

### 2. Application Deployment
```bash
cd infra/ansible
ansible-playbook -i inventories/prod/hosts.ini playbooks/site.yml
```

### 3. Monitoring Setup
```bash
cd monitoring
docker-compose -f docker-compose.monitoring.yml up -d
```
