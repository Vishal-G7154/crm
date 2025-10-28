#!/bin/bash
set -e

ENVIRONMENT=${1:-dev}

echo "Deploying to $ENVIRONMENT environment..."

# Build and push Docker image
docker build -t crm:$ENVIRONMENT .
docker tag crm:$ENVIRONMENT ghcr.io/your-org/crm:$ENVIRONMENT
docker push ghcr.io/your-org/crm:$ENVIRONMENT

# Deploy with Ansible
cd infra/ansible
ansible-playbook -i inventories/$ENVIRONMENT/hosts.ini playbooks/site.yml

echo "Deployment completed!"
