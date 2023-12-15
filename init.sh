#!/bin/bash

# Vérifie si le répertoire existe, sinon le crée
repo_dir="/root"
if [ ! -d "$repo_dir/askdhcp" ]; then
    echo "Création du répertoire $repo_dir/askdhcp"
    mkdir -p "$repo_dir/askdhcp"
fi

# Vérifie si unzip est installé, sinon le télécharge
if ! command -v unzip &> /dev/null; then
    echo "Installation de unzip..."
    sudo apt update
    sudo apt install -y unzip
fi

# Télécharge le repo GitHub avec wget
echo "Téléchargement du repo GitHub..."
wget -O "$repo_dir/askdhcp.zip" https://github.com/SammuelLeroux/askDHCP/archive/main.zip
unzip "$repo_dir/askdhcp.zip" -d "$repo_dir"
mv "$repo_dir/askDHCP-main"/* "$repo_dir/askdhcp/"
rm -r "$repo_dir/askDHCP-main"
rm "$repo_dir/askdhcp.zip"

# Ajoute la commande pour exécuter le script config_intnet.sh dans /etc/rc.local
echo "Ajout de la commande dans /etc/rc.local..."
echo "$repo_dir/askdhcp/config_intnet.sh" | sudo tee -a /etc/rc.local

# Exécute le script config_intnet.sh immédiatement
chmod +x "$repo_dir/askdhcp/scripts/config_intnet.sh"
"$repo_dir/askdhcp/scripts/config_intnet.sh"

# Exécute le script deploy_all.sh
chmod +x "$repo_dir/askdhcp/deploy_all.sh"
"$repo_dir/askdhcp/deploy_all.sh"