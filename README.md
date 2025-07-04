# AWS Infra Automation with Terraform, Ansible & GitHub Actions

    End-to-end infrastructure deployment using Terraform modules, Ansible for configuration, and GitHub Actions CI/CD — all built from scratch and production-style.

🚀 Project Overview

This project provisions a fully functional cloud environment on AWS using Infrastructure as Code (IaC) tools. It includes:

    ✅ Custom VPC with public subnets

    ✅ Multi-EC2 instance setup

    ✅ Application Load Balancer (ALB)

    ✅ Terraform modules for clean reusability

    ✅ Ansible automation to install Nginx and deploy a basic web page

    ✅ GitHub Actions CI/CD for auto-deploy on push and destroy on demand

🧱 Architecture

+-------------+ +-----------------+
| GitHub Repo | <-----> | GitHub Actions |
+------+------+ +--------+--------+
| |
v v
terraform init/plan/apply terraform destroy (manual)
| |
v v
AWS Infra Clean teardown via
GitHub Actions + Terraform
|
v
+------------------+
| VPC + ALB + EC2 |
| (2 instances) |
+------------------+
|
v
Ansible connects via SSH  
→ Installs Nginx  
→ Deploys HTML page

🛠️ Tools Used
Tool Purpose
Terraform Infrastructure provisioning (IaC)
Ansible Remote configuration of EC2 (Nginx)
GitHub Actions CI/CD pipelines for deploy/destroy
AWS EC2 Hosts web servers
AWS ALB Load balances traffic across EC2s
AWS VPC Isolated networking with public subnets
📁 Project Structure

aws-infra/
├── .github/workflows/ # CI/CD pipelines
│ ├── deploy.yml # Auto apply on push
│ └── destroy.yml # Manual destroy workflow
├── modules/ # Terraform modules
│ ├── vpc/
│ ├── ec2/
│ └── alb/
├── ansible/
│ ├── inventory.ini
│ └── nginx_setup.yml # Installs Nginx + deploys HTML
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
└── .gitignore

🧪 How to Use
✅ Deploy Infra (Auto-Triggered)

    Push code to the main branch

    GitHub Actions will automatically run:

    terraform init
    terraform plan
    terraform apply

🔧 Configure EC2 with Ansible

After infrastructure is live, run:

cd ansible
ansible-playbook -i inventory.ini nginx_setup.yml

This will:

    Install Nginx

    Replace /usr/share/nginx/html/index.html with a custom HTML page

🧨 Destroy Infra (Manual)

    Go to GitHub → Actions → "Destroy AWS Infra"

    Click "Run workflow"

🌐 Final Output

Once deployment is complete, open the ALB DNS name (from Terraform output alb_dns) in your browser to view the deployed page:

Hello from Terraform + Ansible 🚀
