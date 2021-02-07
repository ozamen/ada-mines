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

Nous avons utilisé la version Windows GNAT community (gnat-2020-20200429-x86_64-windows-bin.exe) avec GTKADA (gtkada-2020-x86_64-windows-bin.exe). L'IDE compile ensuite grâce au build.gpr.

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

Pour avoir une interface graphique, nous avons utilisé gtkada. Nous avions prévu de séparer en plusieurs parties:

- L'initialisation et le lancement de la boucle gtk.
- Une fonction de callback qui gère l'entrée utilisateur et qui appelle le moteur de jeu.
- Une fonction pour afficher le nouveau plateau de jeu une fois qu'il a été calculé.

Malheureusement nous n'avons jamais pu faire une fonction de callback car gtk-handlers ne fonctionnait pas.

Le compilateur nous a soutenu que Connect() et To_Marshaller() n'étaient pas visible et malgré plusieurs heures sur ce problème et de nombres tests différents. D'autres camarades se sont heurtés à cette même problématique et nous avons donc décidé d'abandonner la partie event.

La seule partie graphique du programme s'execute à la fin, où nous affichons le board final, que l'utilisateur ai perdu ou gagné.

Pour l'affichage nous utilisons Gdk_Pixbuf pour charger et redimensionner l'image puis nous mettons le résultat dans une nouvelle variable Gtk_Image. Cette dernière est ensuite ajoutée dans la Gtk_Table, un widget parfait pour un jeu de plateau en deux dimensions. La table est contenue dans une Gtk_Vbox qui est elle contenue dans la Gtk_Window, notre fenêtre.

## PPCO

CONTRAT / POST ET PRECONDITION

## DO

HLR / LLR
