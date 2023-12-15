#!/bin/bash

# Vérifie si la clé SSH existe déjà
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Génération de la paire de clés SSH..."
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
    echo "La paire de clés SSH a été générée avec succès."
else
    echo "La clé SSH existe déjà."
fi

# Exécute le playbook Ansible
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml