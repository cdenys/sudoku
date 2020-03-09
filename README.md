## Sudoku

bon ben je crois que tout est dit dans le titre, à vous de jouer !

Quelques détails tout de même, on ne vous demande pas de coder un programme capable de résoudre une grille donnée (sauf si
vous voulez vous initier aux joies du [retour arrière/retour sur trace/backtracking](https://fr.wikipedia.org/wiki/Retour_sur_trace)),
 juste de déterminer si une grille donnée (sous forme d'un tableau de tableaux) et déjà remplie est valide ou pas.


Pour celles et ceux qui ne connaîtraient pas le principe de ce jeu, quelques précisions:  
Voici comment se présente une grille de Sudokou:  

![grille de Sudoku](220px-Sudoku-by-L2G-20050714.svg.png)

Une grille de Sodoku se présente sous la forme d'une grille carrée de 9 lignes et 9 colonnes subdivisée en 9 sous-grilles carrées 
de 3 par 3 cases, appelées « régions », et partiellement pré-remplie avec des chiffres de 1 à 9.  
Le but de ce jeu (*pas celui du kata!*) est de remplir entièrement la grille avec les chiffres de 1 à 9 de telle façon que chaque chiffre apparaisse **une  
fois et une seule** dans chaque ligne, dans chaque colonne et dans chaque région.

Voici un autre exemple de grille de Sudolu résolue, dont les chiffres initiaux figurent en rouge, sur les diagonales:  

![Exemple de grille résolue](220px-Diagonal-Sudoku-by-Skratt.svg.png)

Pour plus de détails sur l'historique, les méthodes de résolution, etc: [l'article de wikipedia sur le Soudoku](https://fr.wikipedia.org/wiki/Sudoku)
 
Vous trouverez dans le même répertoire un fichier de tests (thanks to [codewars](https://www.codewars.com/) pour les grilles),
 le but étant évidemment que votre code ~~casse la baraque~~ passe les tests !

Pour les juniors, un conseil (d'ailleurs j'ai rajouté des tests en ce sens, donc ce n'est plus un conseil mais une obligation !): 
"diviser pour règner", décomposer le problème, ici en créant des méthodes pour isoler une ligne (ça ne sera pas le plus 
dur ;-) ), une autre pour les colonnes et encore une autre pour les régions.  
Pour cette dernière, je vous conseille de noter sur papier vos recherches, notamment pour voir les indices des triplets.  

Plus une dernière méthode qui vérifie si chaque partie (ligne, colonne ou région) est correctement remplie, donc avec 
tous les chiffres de 1 à 9, chacun présent une seule fois (avec, par exemple l'utilisation de la structure de données [Set](https://ruby-doc.org/stdlib-2.6.5/libdoc/set/rdoc/Set.html), 
mais c'est juste une suggestion, pas une obligation). Vous remarquerez que cette méthode ".valid?" teste des tableaux, 
donc vous allez utiliser une propriété de Ruby : la possibilité de réouvrir une classe, y compris celle de base de Ruby, 
**à ne pas utiliser en prod**

N.B. Petit test d'attention : avez-vous remarqué que, pas une seule fois (hormis dans le titre de ce README) le nom de 
ce jeu n'a été correctement orthographié :-) ?

### English version

The goal of this kata is to check if a already filled grid is good or not. for [more explanations of this game, the Wikipedia page](https://en.wikipedia.org/wiki/Sudoku)
