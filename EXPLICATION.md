### Pseudo-code : 
Lien : 
`https://www.chegg.com/homework-help/questions-and-answers/pseudocode-iterative-algorithm-fibonacci-numbers-1-procedure-iterative-fibonacci-n-nonnega-q76906547?irclickid=Qa2zy6QuHxyZTIfU9p0Qm2aRUkr1Dv2ctwUEQM0&sharedid=2075099&utm_medium=affiliate&utm_source=Admitad%20-%201310690&utm_campaign=Chegg%20General%20&irgwc=1&afsrc=1`
```
procedure iterative fibonacci (n: nonnegative integer)
if n = 0 then
	return 0
else
	x := 0
	y := 1
	for i := 1 to n-1
		z := x+y
		x := y
		y := z
return y	# {output is the n_th Fibonacci number}

```
En m'appuyant sur le pseudo-code calculant le $n$-ième terme de Fibonacci au dessus, je commence par traiter le cas de base : si l'entrée est 0, on renvoie directement 0. Sinon, on utilise une boucle pour calculer au fur et à mesure les termes $(n-2)$-ième et $(n-1)$-ième, afin d'en déduire le $n$-ième terme. La boucle se déroule en tournant n-1 fois et à chaque tour, on calcule la somme z = x + y, puis on décale les valeurs en mettant à jour x avec l'ancien y, et y avec le nouveau résultat z.

### Mémoire : 
Au lieu d'utiliser un tableau, le programme reste en mémoire constante avec peu de variables :
x : stocke $F(k-2)$, initialisé à 0.
y : stocke $F(k-1)$, initialisé à 1.
z : variable temporaire pour faire la somme $x + y$.
n : stocke l'entier d'entrée lu via GIMMEH.

### Boucle :
Comme LOLCODE n'a pas d'opérateur <=, j'utilise cette condition :
`IM IN YR loop UPPIN YR i WILE BOTH SAEM BIGGR OF i AN DIFF OF n AN 2 AN DIFF OF n AN 2
`
BIGGR OF i AN (n - 2) renvoie la plus grande valeur entre l'indice $i$ et $n - 2$. Puis je teste si ce résultat est égal (BOTH SAEM) à $n - 2$ permet de vérifier que $i \le n - 2$, et quand $i$ dépasse $n - 2$, la condition devient fausse et la boucle s'arrête.

### Astuces :
Pour rassurer les tests, j'ai également écrit un programme avec le même but en Python :
```
def iterative_fibonacci(n: int) -> int:
    if n < 0:
        raise ValueError("Input must be a non-negative integer.")
    if n == 0:
        return 0
    else:
        x = 0
        y = 1
        for _ in range(1, n):
            z = x + y
            x = y
            y = z
        return y
```

	


