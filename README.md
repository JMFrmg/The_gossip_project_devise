# Bienvenue dans mon script TheGossipProject!

## Instructions
La création d'un nouveau compte est soumise au respect de plusieurs règles :
* Renseigner un nom d'utilisateur (il ne doit pas avoir été déjà choisi)
* Renseigner un email dans un format valide (il ne doit pas non plus avoir été déjà choisi)
* Renseigner un mot de passe
* Renseigner le code d'accès : "THPGOSSIPS"

Pour lancer les tests :
* Ouvrir un terminal dans le dossier de l'application et taper "bundle exec rspec"


## Ce script a plusieurs fonctionnalités:
* La page root redirige automatiquement soit vers l'index des gossips si l'utilisateur a déjà une cession d'ouverte, soit vers la page de login si ce n'est pas le cas
* Créer un compte (il faut en créer un pour accéder à toutes les fonctionnalités liées aux gossips)
* Ouvrir une cession avec ce compte
* Redirection automatique d'une requête dirigée vers le controlleur gossips d'un visiteur non connecté vers la page de login
* Voir l'ensemble des ragots créés et cliquer sur 'détails' pour afficher le nom d'utilisateur du créateur du ragot
* Créer des ragots
* Editer et/ou supprimer des ragots
* Des tests pour les models user et gossip


##Certaines choses auraient été bien mais ne sont pas présentes faute de temps :
* Subordonner la création d'un compte à la présence de l'email dans une liste
* Créer les tests pour les controlleurs et les views
* Améliorer l'esthétique
* Il y en a certainement beaucoup d'autres, on peut toujours mieux faire :)

Bonne lecture!

