#!/bin/bash

MASTER_PUBLIC_IP=$(terraform -chdir=../terraform output -raw master_public_ip)
WORKER_PRIVATE_IP=$(terraform -chdir=../terraform output -raw worker_private_ip)

cat <<EOF > inventory.ini
[master]
master01 ansible_host=${MASTER_PUBLIC_IP}

[workers]
worker01 ansible_host=${WORKER_PRIVATE_IP}

[all:vars]
ansible_user=azureuser
ansible_ssh_private_key_file=~/.ssh/k3s_azure

[workers:vars]
ansible_ssh_common_args='-o ProxyJump=azureuser@${MASTER_PUBLIC_IP}'
EOF
