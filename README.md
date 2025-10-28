# CRM - Customer Relationship Management System

A modern, scalable CRM system built with Flask, PostgreSQL, and deployed on AWS.

## 🚀 Quick Start

### Local Development
```bash
# Setup development environment
./scripts/setup-dev.sh

# Start the application
make dev
```

Visit: http://localhost:8000

## 🏗️ Architecture

### Backend
- **Flask** - Web framework
- **SQLAlchemy** - ORM
- **Flask-Login** - Authentication
- **Flask-Mail** - Email service
- **PostgreSQL** - Database

### Frontend
- **Bootstrap 5** - UI framework
- **HTML/CSS/JavaScript** - Frontend

### Infrastructure
- **AWS** - Cloud provider
- **Terraform** - Infrastructure as Code
- **Ansible** - Configuration management
- **Docker** - Containerization

### Monitoring
- **Prometheus** - Metrics collection

## 📁 Project Structure

```
CRM/
├── app/                    # Flask application
│   ├── api/               # API endpoints
│   ├── auth/              # Authentication
│   ├── models/            # Database models
│   ├── services/          # Business logic
│   ├── templates/         # HTML templates
│   └── static/            # Static assets
├── config/                # Configuration
├── infra/                 # Infrastructure
│   ├── terraform/         # Terraform modules
│   └── ansible/           # Ansible playbooks
├── monitoring/            # Monitoring stack
├── tests/                 # Test suite
├── scripts/               # Deployment scripts
└── docs/                  # Documentation
```

## 🛠️ Available Commands

```bash
make dev          # Start development environment
make up           # Start production environment
make down         # Stop all services
make logs         # View application logs
make test         # Run tests
```

## 🔧 Configuration

Copy `.env.example` to `.env` and configure:

```env
SECRET_KEY=your-secret-key
DATABASE_URL=postgresql+psycopg2://user:pass@host:port/db
MAIL_SERVER=smtp.gmail.com
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-app-password
```

## 📊 Monitoring

Access monitoring:
- **Prometheus**: http://localhost:9090

## 🚀 Deployment

### AWS Services Used
- **EC2** - Compute instances
- **VPC** - Virtual private cloud
- **S3** - Object storage
- **ECR** - Container registry
- **Security Groups** - Network security

### CI/CD Pipeline
- **GitHub Actions** - Automated testing and deployment
- **Docker** - Containerization
- **Terraform** - Infrastructure provisioning
- **Ansible** - Configuration management
# crm
