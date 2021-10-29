# Les variables Bash

Comme avec n'importe quel autre langage de programmation, vous pouvez également utiliser des variables avec Bash. Cependant, il n'y a pas de type de données et une variable en Bash peut contenir des nombres et des caractères.

Pour assigner une valeur à une variable, tout ce que vous devez faire est utiliser le signe `=` :

```bash
name="DevDojo"
```

>{n.b.} vous ne pouvez pas mettre d'espaces avant ou après le signe `=`.

Ensuite, pour accéder à la variable, vous devez utiliser le caractère `$` et indiquer son nom comme ceci :

```bash
echo $name
```

Entourer le nom de la variable avec des accolades n'est pas obligatoire mais est considéré comme une bonne pratique, je vous recommande donc de les utiliser aussi souvent que possible :

```bash
echo ${name}
```

La commande ci-dessus afficherait `DevDojo` puisque c'est la valeur de notre variable.

Maintenant, modifions notre script `devdojo.sh` pour y inclure une variable.

Encore une fois, ouvrez le fichier avec l'éditeur de votre choix :

```bash
nano devdojo.sh
```

Et modifiez le fichier pour qu'il ressemble à ceci :

```bash
#!/bin/bash

name="DevDojo"

echo "Hi there $name"
```

Sauvegardez et lancez-le à nouveau :

```bash
./devdojo.sh
```

Vous devriez voir le résultat suivant sur votre écran :

```bash
Hi there DevDojo
```

Voici un résumé du script:

* `#!/bin/bash` - d'abord, on spécifie le shebang
* `name=DevDojo` - ensuite, on définit une variable appelée `name` et on lui assigne une valeur
* `echo "Hi there $name"` - enfin, on affiche le contenu de la variable à l'écran en utilisant `echo`

Vous pouvez également utiliser plusieurs variables :

```bash
#!/bin/bash

name="DevDojo"
greeting="Hello"

echo "$greeting $name"
```

Sauvegardez et relancez le fichier :

```bash
./devdojo.sh
```

Vous devriez voir le résultat suivant sur votre écran :

```bash
Hello DevDojo
```

Notez que vous n'avez pas nécessairement besoin d'ajouter un point-virgule `;` à la fin de chaque ligne. Ça fonctionnera avec ou sans, un peu comme en JavaScript !
