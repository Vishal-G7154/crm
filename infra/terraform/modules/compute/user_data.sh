#!/bin/bash
set -e

# Update system
apt-get update
apt-get upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker ubuntu

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# Configure ECR login
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ecr_repository_url}

# Create application directory
mkdir -p /opt/crm
cd /opt/crm

# Create docker-compose.yml for production
cat > docker-compose.yml << EOF
version: "3.8"
services:
  web:
    image: ${ecr_repository_url}:latest
    ports:
      - "80:8000"
    environment:
      - DATABASE_URL=postgresql+psycopg2://crm:crm@db:5432/crm
      - FLASK_ENV=production
    depends_on:
      - db
  db:
    image: postgres:15
    environment:
      - POSTGRES_USER=crm
      - POSTGRES_PASSWORD=crm
      - POSTGRES_DB=crm
    volumes:
      - pgdata:/var/lib/postgresql/data
volumes:
  pgdata:
EOF

# Start the application
docker-compose up -d
