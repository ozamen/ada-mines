# README

## Ada-minesweeper

Un démineur en console écrit en Ada.

## Build
	
`make` ou `make check` afin de build.

## Usage

Userclick_x représente la coordonnée horizontale et Userclick_y la coordonnée verticale allant de 0 à 9.

Flag permet de poser un flag sur une case.

## Architecture



## Board descriptions

### RealBoard

> Ne change pas pendant la partie

0. pas de bombe
1. bombe
2. point de départ

### MinesBoard

> Ne change pas pendant la partie

Nombre de bombe voisines

### UserBoard

> Change pendant la partie

0. fermé
1. ouvert
2. flag

> Si ouvert + bombe = perdu

## PPCO

## DO
