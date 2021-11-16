#!/bin/bash
docker pull jupyter/base-notebook
echo "A quel dossier voulez-vous donner accès à Jupyter (chemin absolu) ?"
read dossier
chmod 777 -R $dossier
echo "Quel mot de passe voulez-vous utiliser pour votre notebook ? (Laissez vide pour aucun)"
read password
docker run -d -p 8888:8888 --user "$(id -u):$(id -g)"  -v $dossier:/home/jovyan/work jupyter/base-notebook start-notebook.sh --NotebookApp.token=$password --allow-root
echo "Si vous utilisez une instance ou un serveur à distance exécutez la commande suivante sur votre ordinateur pour accéder au Notebook en spécifiant votre <USER> et votre <SSH_SERVER> :"
echo "      ssh -L 8888:localhost:8888 <USER>@<SSH_SERVER>"
echo "Le Notebook est disponible dans votre navigateur à l'adresse : localhost:8888 avec le mot de passe/token que vous avez saisi"
