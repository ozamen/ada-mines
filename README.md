# README

Authors:

- *Antoine Coulon*
- *Dorian Vinai*
- *Vincent Payet*
- *William Chow*

## Ada-minesweeper

Un démineur en console écrit en Ada.

### Règles du jeu

Comment gagner au démineur ?
Le but du jeu est de découvrir toutes les cases libres sans faire exploser les mines.

La surface bleue correspond a la zone non découverte.

Pour libérer une case, utiliser l'option DISCOVER en entrant le chiffre 2.
Pour marquer une mine, utiliser l'option FLAG en entrant le chiffre 1, qui fera apparaître un drapeau.

Ensuite entrer respectivement les coordonnées X et Y de la case voulu.

Le compteur *"Mines Remainings"* sous le Board indique le nombre de mines qu'il reste à trouver.

Le chiffre qui s'affiche sur les cases découvertes indique le nombre de mines se trouvant à proximité : à gauche ou à droite, en haut ou en bas, ou en diagonale.

## Build

Nous avons utilisé la version Windows GNAT community (gnat-2020-20200429-x86_64-windows-bin.exe) avec GTKADA (gtkada-2020-x86_64-windows-bin.exe). L'IDE compile ensuite grâce au fichier *mines.gpr*.

Ne pas oublier de créer un dossier `obj` à la racine afin de build.

## Usage

Le niveau de difficulté du jeu est modulable.

Il existe 3 niveau de difficultés:

- Beginner : Board 10x10, 10 Mines
- Advanced : Board 16x16, 40 Mines
- Expert : Board 30x16, 99 Mines

Il suffit d'enlever les commentaires dans Board.ads pour sélectionner la difficulté.

Par défault, le jeu est au niveau "Beginner".

## Architecture

## Gestion du plateau (Board.adb)

Ce fichier implémente les fonctions pour créer le board et le modifier, ainsi que des sous-types et des macros.

Il contient aussi des fonctions pour initialiser plusieurs types de terrains qui sont les suivants:

> RealBoard (Ne change pas pendant la partie)

- 0 : pas de bombe
- 1 : bombe
- -1: point de départ

> MinesBoard (Ne change pas pendant la partie)

Chaque case vaut le nombres de bombes sur les cases adjacentes.

> UserBoard (Change pendant la partie)

- -1: Fermé
- 0-8: Nombres de bombes sur les cases voisines
- 9: Flag

## Gestion du jeu (Game.adb)

Ce fichier implémente les fonctions liées au moteur de jeu:

- La boucle principale: *gameLoop()*
- La gestion de l'entrée utilisateur: *clickBoard()*
- Les fonctions pour gérer la victoire / défaite: *countUndiscoverCell(), countFlag()*
- Les foncions pour la gérer le comportement de la découverte *discoverZone(), discoverSafeZone()*

## Interface Graphique (display.adb)

Pour avoir une interface graphique, nous avons utilisé la librairie *gtkada*. Nous avions prévu de séparer en plusieurs parties:

- L'initialisation et le lancement de la boucle gtk.
- Une fonction de callback qui gère l'entrée utilisateur et qui appelle le moteur de jeu.
- Une fonction pour afficher le nouveau plateau de jeu une fois qu'il a été calculé.

Malheureusement nous n'avons jamais pu faire une fonction de callback car gtk-handlers ne fonctionnait pas.

Le compilateur nous a soutenu que *Connect()* et *To_Marshaller()* n'étaient pas visible et malgré plusieurs heures sur ce problème et de nombres tests différents. D'autres camarades se sont heurtés à cette même problématique et nous avons donc décidé d'abandonner la partie event après beaucoup de temps perdu.

La seule partie graphique du programme s'execute à la fin, où nous affichons le board final, que l'utilisateur ai perdu ou gagné.

Pour l'affichage nous utilisons *Gdk_Pixbuf* pour charger et redimensionner l'image puis nous mettons le résultat dans une nouvelle variable *Gtk_Image*. Cette dernière est ensuite ajoutée dans la *Gtk_Table*, un widget parfait pour un jeu de plateau en deux dimensions. La table est contenue dans une *Gtk_Vbox* qui est elle contenue dans la *Gtk_Window*, notre fenêtre.

## DO-178

### High level requirements

- La première case cliqué ainsi que les 8 adjacentes ne contiennent pas de bombes.
- Découvrir toutes les cases sans bombe provoque une victoire.
- On peut placer un flag sur toutes les cases.
- Cliquer sur une case blanche (sans bombes adjacentes) découvre toutes les cases autour et applique cette logique récursivement aux autres cases blanches adjacentes.
- Un clique gauche sur:
  - une case non ouverte qui contient une bombe -> provoque la fin de la partie
  - une case non ouverte vide -> la découvre
  - un flag ou une case ouverte -> ne fais rien
- Un clique droit sur:
  - une case non ouverte -> la flag  
  - un flag -> enlève le flag
  - une case ouverte -> ne fais rien

### Low level requirements

- *countFlag()* doit renvoyer une entier supérieur ou égal à zéro.
- *setFlag()* doit renvoyer l'Array2D avec seulement l'endroit cliqué modifié.
- *generateRandom()* prends un entier et renvois forcément un entier inférieur ou égal à l'argument.

## PPCO

Nous avons utilisé des pré/post conditions dans les déclarations de fonctions suivantes:

- function generateRandom(size : Integer) return Integer with Pre => size >=0, Post => generateRandom'Result <= size;
- function setFlag(UserBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D with Pre => Userclick_x >= 0 and Userclick_y >= 0;
- function countFlag(UserBoard : Array2D) return Integer with Post => countFlag'Result >= 0;
- function countUndiscoverCell(UserBoard : Array2D) return Integer with Post => countUndiscoverCell'Result >= 0;
- function checkMine(Board : Array2D; Pos_x : Integer ; Pos_y : Integer) return Integer with Post => checkMine'Result <= 8;
