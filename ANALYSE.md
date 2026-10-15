### Sémantique :

* Pour l'instant, `p1.lol` et même `p2.lol` (version corrigée du `p1.lol`) ne calcule pas la même chose que le mien (`p.lol`) car le programme du LLM ne passe aucun test (0 / 11). Dès le début, le code plante sur l'erreur `unable to store variable: n`. De plus, le LLM a ajouté une phrase d'affichage (`VISIBLE "Entrez un entier n :"`) qui n'était pas demandée et qui fausse la comparaison avec mes fichiers attendus `.out`.

* Pour savoir si 2 programmes font vraiment la même chose sans se limiter aux tests, on peut relire le code et vérifier que l'algorithme calcule bien la même relation de récurrence $F_n = F_{n-1} + F_{n-2}$ et gère bien les cas $0$ et $1$. En plus, on peut aussi isoler la fonction de calcul (sans le `GIMMEH` et le `VISIBLE`) et comparer les résultats sur des entiers plus grands pour voir si le type entier supporte les calculs de la même façon.


* A mon avis, les raisons pour laquelle le LLM a échoué sont :

    - En LOLCODE, on doit déclarer la variable avec `I HAS A n` avant d'utiliser `GIMMEH n`, tandis que le LLM a cru qu'il pouvait lire directement dans la variable sans la préparer, ce qui fait planter l'interpréteur `lci`.
    - Le LLM a pris l'habitude d'écrire des programmes interactifs pour des humains, donc il affiche une question avant de lire, alors que la spec demandait juste de lire l'entrée brute.

* Ce qui a rendu le travail difficile est que LOLCODE est un langage ésotérique très peu présent sur Internet par rapport à Python ou C. C'est pourquoi le LLM a peu d'exemples d'entraînement et la syntaxe est inhabituelle, il a donc du mal à écrire du code sans inventer ou mélanger la syntaxe.

* Analyse le comportement du calcul :
En LOLCODE, il n'y a pas de boucle `while` avec des opérateurs comme <= qu'on peut trouver dans d'autres langages. Pour faire la condition d'arrêt, j'ai donc dû utiliser l'expression : `IM IN YR loop UPPIN YR i WILE BOTH SAEM BIGGR OF i AN DIFF OF n AN 2 AN DIFF OF n AN 2`. L'idée ici est d'utiliser BIGGR OF, qui est une fonction comparant deux nombres et renvoie le plus grand. En testant si le résultat de BIGGR OF i AN (n - 2) est encore égal (BOTH SAEM) à (n - 2), cela permet de vérifier que i ne dépasse pas n - 2. Tant que cette condition est vraie, la boucle continue de tourner. Dès que i devient plus grand que n - 2, le maximum devient i, la condition n'est plus satisfaite et la boucle s'arrête, c'est à quel point la syntaxe de LOLCODE rend l'écriture d'une boucle itérative difficile pour le LLM.


### Syntaxe : comparaison entre $p$ et $p1$/$p2$

**Structure :**
- Mon code `p.lol` gère n=0 avec un simple `YA RLY / NO WAI` et pour le cas $n=1$ ne nécessite pas de condition car la boucle ne s'exécute pas et renvoie directement 1.
- Le LLM empile 2 blocs de test séparés (`n == 0` puis `n == 1`), ce qui est redondant.

**Mémoire :**
* Dans `p.lol`, j'utilise 3 variables locales pour le calcul (x, y, z).
* Le LLM alloue 4 variables de calcul (a, b, i, temp) plus des variables intermédiaires (entree, resultat). Mais dans `p1.lol`, il oublie d'allouer n, ce qui provoque un crash à l'exécution.

**Condition d'arrêt :**
* Dans `p.lol`, j'itère de 0 à n-2 en simulant l'inégalité $i \le n - 2$ grâce au maximum :
`
WILE BOTH SAEM BIGGR OF i AN DIFF OF n AN 2 AN DIFF OF n AN 2
`

* Le LLM part de $i=2$, sa condition dans `p1.lol` est incohérente (`WILE DIFFRINT ...`) tandis que dans `p2.lol`, il la remplace par un test d'arrêt `TIL BOTH SAEM i AN SUM OF n AN 1` ($i = n + 1$).

Le LLM semble d'essayer d'effectuer une boucle `for (i=2; i<=n; i++)`, il n'utilise pas le syntaxe `BIGGR OF` pour contourner l'absence d'opérateur `<=` en LOLCODE. Je préfère la version `p.lol` parce qu'il est plus logique, utilise moins de mémoire et gérer naturellement le cas n=1, en plus il rend des résultats exacts donc bien passé les tests.


### Conclusion : 
On constate que LOLCODE n'offre pas les abstractions usuelles (pas d'inégalité simple, syntaxe préfixée stricte), donc même calcul de Fibonacci est classique, mais c'est difficile pour un LLM à manipuler correctement les contraintes de ce langage sans faire d'erreurs de syntaxe bien qu'il puisse comprendre la logique de l'algorithme.