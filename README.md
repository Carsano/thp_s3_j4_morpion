# Jeu du Morpion

Pour lancer le jeu, veuillez lancer le `app.rb`
## Règles du jeu

Elles sont affichées au lancement (grosse flemme)

## Déroulement du jeu

A chaque tour, le joueur doit sélectionner la case dans laquelle il veut jouer à l'aide des flèches. A chaque moment, le joueur peut décider de quitter le jeu.  
Si un joueur arrive à aligner 3 symboles, ce dernier gagne la partie, les symboles alignés gagnants seront affichés en vert.  
Si aucun joueur n'arrive à aligner 3 symboles alors il y a match nul.  
A la fin de la partie un menu s'affiche.

## Différentes fonctionnalitées un peu cool

### Menu
A la fin de chaque partie, un menu s'affiche :
* Voir les stats
* Rejouer
* Sauvegarder les stats
* Supprimer la sauvegarde
* Quitter le jeu

#### Voir les stats 
Cette fonctionnalité permet d'afficher les statistiques de chaque joueur dans un tableau : 
* Le nom du joueur
* Son nombre de parties jouées
* Son nombre de victoires
* Son nombre de défaites
* Son nombre de matchs nuls

#### Rejouer
Permet de rejouer une partie. En cas d'égalité, le joueur commençant la nouvelle partie est tiré au hasard, sinon le joueur perdant joue en premier.

#### Sauvegarder les stats
Permet de sauvegarder les stats des joueurs dans un fichier de sauvegarde

#### Supprimer la sauvegarde
Permet de supprimer la sauvegarde des stats enregistrée précédement.

#### Quitter le jeu
Permet de quitter le jeu sans sauvegarder

### Recharger une sauvegarde
Dès le lancement de l'application, vous pouvez choisir de charger les joueurs enregistrés précédemment.


