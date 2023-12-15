# askDHCP

Ce dépôt contient des scripts et des configurations pour automatiser la configuration pour recupérer une adresse ip sur enp0s8 sur une machine virtuelle Debian 11. Il utilise Ansible pour orchestrer le déploiement des scripts.

## Utilisation

Pour lancer la configuration DHCP sur une machine virtuelle Debian 11, exécutez le script d'initialisation directement depuis GitHub en utilisant la commande suivante :

```bash
wget -O - https://raw.githubusercontent.com/SammuelLeroux/askDHCP/master/init.sh | bash
```
Ce script effectuera les étapes suivantes :

    Générer une paire de clés SSH si elle n'existe pas déjà.
    Installera Ansible si ce n'est pas déjà fait.
    Téléchargera le repo GitHub.
    Exécutera le playbook Ansible pour déployer les scripts et les services.

Assurez-vous que votre VM a une connectivité Internet pour télécharger les dépendances nécessaires.
