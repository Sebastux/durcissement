# Rôle Ansible : durcissement

Ce rôle Ansible automatise le durcissement de systèmes Linux, en appliquant un ensemble de bonnes pratiques de sécurité adaptées aux distributions Fedora et AlmaLinux (versions 9 et 10). Il offre des configurations robustes pour protéger les machines contre des usages non souhaités ou des vulnérabilités courantes, tout en adaptant précisément les tâches aux systèmes cibles.

## Prérequis

- Ansible >= 2.9
- Accès root aux machines cibles

## Distributions supportées

- Fedora (toutes versions récentes)
- AlmaLinux 9.x
- AlmaLinux 10.x

## Fonctionnalités principales

- **Configuration du gestionnaire de paquets** (`dnf` ou `dnf5` selon la distribution)
- **Gestion des virtualisations QEMU**
- **Sécurisation SSH**
- **Renforcement des paramètres réseau**
- **Gestion stricte des permissions des fichiers**
- **Configuration de l’horloge système**
- **Désactivation des services et modules inutiles**
- **Renfort PAM et gestion de login**
- **Profil utilisateur sécurisé (/etc/profile)**
- **Installation/configuration de Fail2Ban**
- **Configuration de sudo** (Fedora uniquement)
- **Redémarrage contrôlé de la machine après durcissement**

## Utilisation

Incluez ce rôle dans votre playbook comme suit :
yaml
- hosts: serveurs become: true roles:
    - role: durcissement


Le rôle détecte automatiquement la distribution et exécute les tâches appropriées.

### Variables

Des variables spécifiques à chaque distribution/OS sont disponibles dans `defaults/`. Il est possible de les surcharger dans vos propres `vars` ou groupes d’inventaire.

### Exemple d’exécution

Lancement typique :
bash ansible-playbook -i inventaire.yml playbook.yml


## Structure du rôle

- `tasks/main.yml` : Point d’entrée, sélectionne la tâche selon la distribution.
- `tasks/almalinux9.yml`, `tasks/almalinux10.yml`, `tasks/fedora.yml` : Liste des tâches spécifiques par OS/version.
- `tasks/alma9/`, `tasks/alma10/`, `tasks/fedora/` : Détails des tâches incluses pour chaque OS/version.
- `defaults/` : Variables par défaut selon l’OS.
- `handlers/`, `files/`, `templates/`, etc. : Convention standard Ansible.

## Test

Des scénarios de test sont fournis dans le dossier `tests/`.

## Licence

Voir le fichier `LICENSE.md`.

## Auteur

Sébastux

---

Ce rôle est modulaire: n’hésitez pas à enrichir les tâches selon vos besoins de sécurité spécifiques !