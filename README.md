# Terraform Azure K3s

Provision a lightweight Kubernetes cluster on Microsoft Azure using Terraform and automate K3s installation with Ansible.

## Project Highlights

✅ Terraform Cloud backend

✅ Azure Infrastructure as Code

✅ Dynamic Ansible Inventory Generation

✅ Automated K3s Server Installation

✅ Automated Worker Node Join

✅ Traefik Ingress Controller

✅ CoreDNS

✅ Metrics Server

✅ Local Path Provisioner

✅ NGINX Application Deployment

✅ End-to-End Cluster Validation

---

## Architecture

```text
                 Internet
                     |
                     |
              +--------------+
              |   master01   |
              |  Public IP   |
              | K3s Server   |
              +--------------+
                     |
                     |
              Azure Virtual Network
                     |
                     |
              +--------------+
              |   worker01   |
              | Private IP   |
              | K3s Agent    |
              +--------------+

K3s Components:
- CoreDNS
- Metrics Server
- Traefik Ingress Controller
- Local Path Provisioner
```

---

## Repository Structure

```text
terraform-azure-k3s/

├── terraform/
│   ├── resource-group.tf
│   ├── network.tf
│   ├── compute.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini.template
│   ├── generate-inventory.sh
│   └── install-k3s.yml
│
└── README.md
```

---

## Components

### Terraform

Creates:

- Azure Resource Group
- Virtual Network
- Subnet
- Public IP
- Network Security Group
- Ubuntu 24.04 Master VM
- Ubuntu 24.04 Worker VM

### Ansible

Automates:

- K3s Server Installation
- K3s Worker Join
- Dynamic Inventory Usage

### Kubernetes

Installs:

- K3s
- CoreDNS
- Metrics Server
- Traefik
- Local Path Provisioner

---

## Prerequisites

### Azure

- Azure Subscription
- Terraform Cloud Workspace
- Azure Service Principal

### Tools

```bash
terraform
ansible
az
git
```

### SSH Key

Generate an SSH key:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/k3s_azure
```

---

## Deploy Infrastructure

```bash
cd terraform

terraform init

terraform apply
```

Terraform outputs:

```text
master_public_ip
master_private_ip
worker_private_ip
```

---

## Generate Ansible Inventory

```bash
cd ../ansible

chmod +x generate-inventory.sh

./generate-inventory.sh
```

This generates:

```text
inventory.ini
```

using Terraform outputs dynamically.

---

## Validate Connectivity

```bash
ansible master -m ping
```

Expected:

```text
SUCCESS
```

```bash
ansible workers -m ping
```

Expected:

```text
SUCCESS
```

---

## Install K3s

```bash
ansible-playbook install-k3s.yml
```

Automation performs:

1. Install K3s server on master01
2. Retrieve cluster token
3. Join worker01 to cluster

---

## Verify Cluster

SSH to master:

```bash
ssh -i ~/.ssh/k3s_azure azureuser@<MASTER_PUBLIC_IP>
```

Check nodes:

```bash
sudo kubectl get nodes -o wide
```

Example:

```text
NAME       STATUS   ROLES           VERSION
master01   Ready    control-plane   v1.37.x
worker01   Ready    <none>          v1.37.x
```

---

## Deploy Sample Application

Create deployment:

```bash
kubectl create deployment nginx --image=nginx
```

Expose service:

```bash
kubectl expose deployment nginx \
  --port=80 \
  --type=ClusterIP
```

Create ingress and verify:

```bash
kubectl get ingress
```

---

## Validation Results

Successfully validated:

✅ Terraform apply

✅ Dynamic Inventory Generation

✅ Ansible Connectivity

✅ Automated K3s Installation

✅ Automated Worker Join

✅ kubectl get nodes

✅ CoreDNS

✅ Metrics Server

✅ Local Path Provisioner

✅ Traefik Ingress Controller

✅ NGINX Deployment

✅ Service Creation

✅ Ingress Routing

---

## Sample Validation Output

### Cluster

```bash
sudo kubectl get nodes -o wide
```

```text
NAME       STATUS   ROLES           INTERNAL-IP
master01   Ready    control-plane   10.0.1.5
worker01   Ready    <none>          10.0.1.4
```

### Pods

```bash
sudo kubectl get pods -A
```

```text
coredns
metrics-server
traefik
local-path-provisioner
```

### Ansible

```bash
ansible-playbook install-k3s.yml
```

```text
PLAY RECAP

master01 : ok=5 changed=1
worker01 : ok=2 changed=1
```

---

## Cleanup

Destroy infrastructure:

```bash
cd terraform

terraform destroy
```

---

## Future Enhancements

- Multiple worker nodes using Terraform for_each
- Dynamic worker discovery
- Azure Bastion integration
- Microsoft Entra ID SSH Access
- Azure Container Registry (ACR)
- GitHub Actions CI/CD Pipeline
- Prometheus & Grafana Monitoring
- K3s Upgrade Automation via Ansible

---

## Status

✅ Completed

Infrastructure provisioning, K3s installation, worker node join, ingress configuration and application deployment were successfully validated end-to-end.
