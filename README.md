# README

## Ada-minesweeper

Un démineur en console écrit en Ada.

### Règle du jeu

Comment gagner au démineur ?
Le but du jeu est de découvrir toutes les cases libres sans faire exploser les mines.

La surface bleu correspond a la zone non découverte.

Pour libérer une case, utiliser l'option DISCOVER en entrant le chiffre 2.
Pour marquer une mine, utiliser l'option FLAG en entrant le chiffre 1, qui fera apparaître un drapeau.

Ensuite entrer respectivement les coordonnées X et Y de la case voulu.

Le compteur ("Mines Remainings") sous le Board, indique le nombre de mines qu'il reste à trouver.

Le chiffre qui s'affiche sur les cases découvertes indique le nombre de mines se trouvant à proximité : à gauche ou à droite, en haut ou en bas, ou en diagonale.

## Build

Exectuez sous GNAT Studio.

## Usage

Le niveau de difficulté du jeu est modulable.

Il existe 3 niveau de difficultés:
  - Beginner : Board 10x10, 10 Mines
  - Advanced : Board 16x16, 40 Mines
  - Expert : Board 30x16, 99 Mines

Il suffit d'enlever les commentaires dans Board.ads pour sélectionner la difficulté.

Par défault, le jeu est au niveau "Beginner".

## Architecture

### Gestion du plateau (Board.adb)

> RealBoard (Ne change pas pendant la partie)

0. pas de bombe
1. bombe
2. point de départ

> MinesBoard (Ne change pas pendant la partie)

Nombre de bombe voisines

> UserBoard (Change pendant la partie)

-1. fermé
0-8. Nombres de cases voisines
9. flag

### Gestion du jeu (Game.adb)

### Interface Graphique (display.adb)


## PPCO

CONTRAT / POST ET PRECONDITION

## DO

HLR / LLR
