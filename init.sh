#!/bin/bash

# Vérifie si le répertoire existe, sinon le crée
repo_dir="/root"
if [ ! -d "$repo_dir" ]; then
    echo "Création du répertoire $repo_dir"
    mkdir -p "$repo_dir"
fi

# Télécharge le repo GitHub avec wget
echo "Téléchargement du repo GitHub..."
wget -O "$repo_dir/askdhcp.zip" https://github.com/SammuelLeroux/askDHCP/archive/main.zip
unzip "$repo_dir/askdhcp.zip" -d "$repo_dir/"
mv "$repo_dir/askDHCP-main" "$repo_dir/askdhcp"
rm "$repo_dir/askdhcp.zip"

# Ajoute la commande pour exécuter le script config_intnet.sh dans /etc/rc.local
echo "Ajout de la commande dans /etc/rc.local..."
echo "$repo_dir/askdhcp/config_intnet.sh" | sudo tee -a /etc/rc.local

# Exécute le script config_intnet.sh immédiatement
chmod +x "$repo_dir/askdhcp/config_intnet.sh"
"$repo_dir/askdhcp/config_intnet.sh"

# Exécute le script deploy_all.sh
chmod +x "$repo_dir/askdhcp/deploy_all.sh"
"$repo_dir/askdhcp/deploy_all.sh"