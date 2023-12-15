#!/bin/bash

# Vérifie si la clé SSH existe déjà
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Génération de la paire de clés SSH..."
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
    echo "La paire de clés SSH a été générée avec succès."
else
    echo "La clé SSH existe déjà."
fi

# Vérifie si Ansible est installé
if ! command -v ansible &> /dev/null; then
    echo "Installation d'Ansible..."
    sudo apt update
    sudo apt install -y ansible
fi

# Exécute le playbook Ansible
ansible-playbook -i /root/askdhcp/ansible/inventory.ini /root/askdhcp/ansible/deploy.yml