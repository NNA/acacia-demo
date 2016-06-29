# Test technique

Voici ma réponse pour le test technique réalisé en moins de 48h.

##Énoncé

Créer une application rails permettant de lister, créer, voir et modifier des projets payants ayant les attributs suivants:

- Nom (max 50 caractères)
- Description (max 300 caractères)
- Lieu
- Catégorie (Les catégories seront gérées via une table indépendante)
- Montant

Tous les champs sont obligatoires.

###Création:

Via HTML5 proposer à l'utilisateur de géolocaliser sa position et de la préremplir lors de la création du projet (en JS)

###Page projet:

Sur la page de vue du projet intégrer une carte permettant de visualiser la localisation de ce dernier.

Environnement technique:

Rails 4+ (obligatoire)
PostgreSQL 9+ (obligatoire)
SASS (Conseillé)
Bootstrap 3 (Conseillé)
HAML/SLIM (Conseillé)
Simple form (Conseillé)
+ Toutes les gems/plugins/librairies qui vous semblent nécessaires

Un soin particulier sera accordé à la qualité du code + 1 partie devra être testée.

Le code devra être déposé sur un compte github/bitbucket ou équivalent.

##Mode d'emploi

1. Récupérer le code: 
``` shell 
git clone https://github.com/NNA/acacia-demo.git
```

2. Pour lancer les tests:
```shell
rspec
```

3. Pour jouer
```
[Déployé sur Heroku](http://acacia-demo.herokuapp.com)
```

