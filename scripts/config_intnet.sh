#!/bin/bash

internal_interface=$(ip link | grep -Eo '^[0-9]+: [a-zA-Z0-9]+' | grep -Eo '[a-zA-Z0-9]+$' | grep -E '^enp0s8')

if [ -z "$internal_interface" ]; then
    echo "Aucune interface réseau interne (enp0s8) trouvée."
    exit 1
fi

echo "Interface réseau interne (enp0s8) trouvée : $internal_interface"

# Affiche la configuration réseau de l'interface
ip addr show $internal_interface

sudo dhclient -r $internal_interface
sudo dhclient $internal_interface

echo "Obtention de l'adresse IP sur l'interface $internal_interface terminée."