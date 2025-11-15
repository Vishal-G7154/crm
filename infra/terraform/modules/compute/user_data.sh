#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello from Terraform EC2" > /var/www/html/index.html
