#!/bin/bash

set -e

MASTER_PUBLIC_IP=$(terraform -chdir=../terraform output -raw master_public_ip)
MASTER_PRIVATE_IP=$(terraform -chdir=../terraform output -raw master_private_ip)
WORKER_PRIVATE_IP=$(terraform -chdir=../terraform output -raw worker_private_ip)

cat > inventory.ini <<EOF
[master]
master01 ansible_host=${MASTER_PUBLIC_IP} k3s_private_ip=${MASTER_PRIVATE_IP}

[workers]
worker01 ansible_host=${WORKER_PRIVATE_IP}

[all:vars]
ansible_user=azureuser
ansible_ssh_private_key_file=~/.ssh/k3s_azure

[workers:vars]
ansible_ssh_common_args='-o ProxyJump=master01'
EOF

echo "inventory.ini generated successfully"
