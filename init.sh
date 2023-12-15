#!/bin/bash

# Vérifie si le répertoire existe, sinon le crée
repo_dir="/root/askdhcp"
if [ ! -d "$repo_dir" ]; then
    echo "Création du répertoire $repo_dir"
#    mkdir -p "$repo_dir"
fi

# Télécharge le repo GitHub avec wget
echo "Téléchargement du repo GitHub..."
wget -O "$repo_dir/askdhcp.zip" https://github.com/SammuelLeroux/askDHCP/archive/main.zip
unzip "$repo_dir/askdhcp.zip" -d "$repo_dir/"
mv "$repo_dir/askDHCP-main" "$repo_dir/askdhcp"
rm "$repo_dir/askdhcp.zip"

# Exécute le script deploy_all.sh
chmod +x "$repo_dir/deploy_all.sh"
"$repo_dir/deploy_all.sh"