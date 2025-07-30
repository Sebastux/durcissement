# Rôle Ansible : durcissement

Ce rôle Ansible automatise le durcissement de systèmes Linux, en appliquant un ensemble de bonnes pratiques de
sécurité adaptées aux distributions Fedora et AlmaLinux (versions 9 et 10).<br />
Il offre des configurations robustes pour protéger les machines contre des usages non souhaités ou des 
vulnérabilités courantes, tout en adaptant précisément les tâches aux systèmes cibles.<br />

## Prérequis

- ansible >= 11.8.0
- ansible-core >= 2.18.7
- Accès SSH root aux machines cibles.

## Distributions supportées

- Fedora 42
- AlmaLinux 9.x
- AlmaLinux 10.x

## Fonctionnalités principales

- Configuration du gestionnaire de paquets (`dnf` ou `dnf5` selon la distribution).
- Gestion des virtualisations QEMU.
- Sécurisation SSH.
- Renforcement des paramètres réseau.
- Gestion stricte des permissions des fichiers.
- Configuration de l’horloge système.
- Désactivation des services et modules inutiles.
- Renfort PAM et gestion de login.
- Profil utilisateur sécurisé (/etc/profile).
- Installation/configuration de Fail2Ban.
- Configuration de sudo.
- Redémarrage contrôlé de la machine après durcissement.

## Utilisation

Incluez ce rôle dans votre playbook comme suit :
yaml
- hosts: serveurs become: true roles:
    - role: durcissement

Le rôle détecte automatiquement la distribution et exécute les tâches appropriées.

### Variables

Ce rôle contient plusieurs variables indispensables à son bon fonctionnement, prédéfinies dans le dossier `defaults/`.<br /> 
Il est fortement déconseillé de les surcharger, sauf cas très particulier, car le bon déroulement du rôle et
la conformité des tâches appliquées ne pourraient alors plus être garantis.<br />

### Exemple d’exécution

Lancement typique :
bash ansible-playbook -i inventaire.yml playbook.yml

## Notes

Pour chacune des trois distributions supportées,
le rôle supprime systématiquement les clés SSH par défaut de la machine cible.
Une nouvelle paire de clés SSH est ensuite générée lors du redémarrage de la machine.
La configuration du serveur SSH est adaptée afin d’interdire l’authentification
par mot de passe : seule une connexion via clé SSH sera autorisée.

Le rôle crée automatiquement une nouvelle paire de clés SSH,
stockée dans le sous-répertoire `cles_ssh` du répertoire du rôle.
Le nom des fichiers de clés contient le FQDN (nom de domaine complet) de la machine
cible pour en faciliter l’identification. La clé publique générée est installée
sur le compte `root` de la machine.

**Attention** : après le redémarrage de la machine cible, la clé SSH de cette dernière aura changé.
Pour éviter tout problème d’avertissement ou de refus de connexion, il est nécessaire de supprimer
l’ancienne clé correspondante sur la machine qui exécute le rôle.<br />
<br />
Procédure : pour retirer la clé obsolète du fichier `known_hosts` :

```bash
ssh-keygen -R <fqdn-de-la-machine-cible>
```
<br />

Où <fqdn-de-la-machine-cible> doit être remplacé par le nom utilisé dans les fichiers de clés du répertoire `cles_ssh`.

## Licence

[Consultez le fichier LICENSE.md](LICENSE.md)

## Auteur

Sébastux
