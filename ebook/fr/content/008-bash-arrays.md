# Les Arrays en Bash

Si vous avez déjà fait de la programmation, vous savez probablement déjà ce qu'est un array. 

Mais au cas où vous ne seriez pas un développeur, le plus important est que vous sachiez que, contrairement aux variables, les arrays peuvent contenir plusieurs valeurs sous un même nom.

Vous pouvez initialiser un array en lui assignant des valeurs séparées par des espaces et contenues dans des parenthèses `()`. Par exemple:

```bash
mon_array=("valeur 1" "valeur 2" "valeur 3" "valeur 4")
```

Pour accéder aux éléments de l'array, vous devez les référencer en utilisant leur indice numérique.

>{notice} retenez bien que vous devez utiliser des accolades `{}`.

* Accéder à un seul élément, ce code affichera : `valeur 2`

```bash
echo ${mon_array[1]}
```

* Ce code renvoie le dernier élément: `valeur 4`

```bash
echo ${mon_array[-1]}
```

* Comme pour les arguments en ligne de commande, utiliser `@` renverra tous les éléments de l'array, comme suit : `valeur 1 valeur 2 valeur 3 valeur 4`

```bash
echo ${mon_array[@]}
```

* Précéder le nom de l'array avec un croisillon (`#`) renverra le nombre total d'éléments dans l'array, `4` dans notre cas:

```bash
echo ${#mon_array[@]}
```

Pensez bien à tester ce code et à vous entrainer avec différentes valeurs.

## Les sous-chaînes de caractères (substrings) en Bash : Le découpage

Regardons l'exemple suivant de découpage d'une chaîne de caractères (string) en Bash:

```bash
#!/bin/bash

lettres=( "A""B""C""D""E" ) 
echo ${lettres[@]}
```

Cette commande affichera tous les éléments de l'array.

Sortie :

```bash
$ ABCDE
```


Regardons quelques exemples supplémentaires :

- Exemple 1  

```bash
#!/bin/bash

lettres=( "A""B""C""D""E" ) 
b=${lettres:0:2}
echo "${b}"
```

Cette commande affiche l'array depuis l'indice 0 (le premier de l'array) jusqu'à 2 non inclus.

```bash
$ AB
```
 
- Exemple 2

```bash
#!/bin/bash

lettres=( "A""B""C""D""E" ) 
b=${lettres::5}
echo "${b}"
```

Cette commande affiche les éléments depuis l'indice 0 jusqu'à 5 non inclus, l'indice de départ est initialisé à 0 par défaut.

```bash
$ ABCDE
```

- Exemple 3

```bash
#!/bin/bash

lettres=( "A""B""C""D""E" ) 
b=${lettres:3}
echo "${b}"
```

Cette commande affiche les éléments depuis l'indice 3 jusqu'à la fin de l'array incluse.

 ```bash
 $ DE
 ```
