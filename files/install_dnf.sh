#!/bin/bash
# -*- coding: utf-8 -*-

#==============================================================================
# Titre            : install_dnf.sh
# Description      : Vérifie la présence d'une librairie pour l'utilisation du module dnf5
# Auteur           : Sébastux
# Date             : 25/06/2025
# Modification     : 25/06/2025
# Version          : 1.00
# Utilisation      : install_dnf.sh
# Notes            : Script lancé par ansible.
#==============================================================================

# Initialisation de variables
present=$(rpm -qa | grep -i python3-libdnf5 | wc -l)

# Test
if [ ${present} -eq 1 ]
then
  echo "Le fichier est présent, rien à faire."
  exit 1
else
  echo "Installation du package."
  dnf install -qy python3-libdnf5
  exit 0
fi
