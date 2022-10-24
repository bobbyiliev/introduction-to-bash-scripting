# Les entrées utilisateur en Bash

Avec le précédent script, nous avons défini une variable et nous affichons à l'écran la valeur de cette variable grâce à la commande `echo $name`.

Maintenant nous allons demander à l'utilisateur son nom. Pour ce faire, ouvrez votre fichier avec votre éditeur de texte favori et écrivez ce script :

```bash
#!/bin/bash

echo "Quel est votre nom ?"
read name

echo "Salut $name"
echo "Bienvenue sur DevDojo !"
```

Le script ci-dessus va demander une entrée à l'utilisateur et stocker cette entrée dans une variable. 

Ensuite, nous pouvons utiliser le texte de cette variable et afficher un message à l'utilisateur.

La sortie de ce script sera la suivante :

* D'abord, lancez le script :

```bash
./devdojo.sh
```

* Ensuite, on vous demandera d'entrer votre nom :

```
Quel est votre nom ?
Bobby
```

* Lorsque vous avez entré votre nom, appuyez sur Entrée, et vous verrez la sortie suivante :

```
Salut Bobby
Bienvenue sur DevDojo !
```

Pour réduire la taille du code, nous pourrions remplacer la première commande `echo` en utilisant la commande `read -p`. La commande `read` utilisée avec le drapeau `-p` affichera un message avant de demander une entrée à l'utilisateur :

```bash
#!/bin/bash

read -p "Quel est votre nom ? " name

echo "Salut $name"
echo "Bienvenue sur DevDojo!"
```

Pensez bien à tester ce script par vous même !