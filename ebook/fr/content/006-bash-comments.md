# Les Commentaires avec Bash

Comme avec n'importe quel autre langage de programmation, vous pouvez ajouter des commentaires à votre script. Les commentaires servent à vous laisser des notes à l'intérieur de votre code. 

Pour écrire des commentaires en Bash, vous devez ajouter le symbole `#` au début de la ligne. Les commentaires ne seront pas affichés à l'écran.

Voici un exemple simple de commentaire :

```bash
# Ceci est un commentaire et ne sera pas affiché à l'écran
```

Continuons en ajoutant quelques commentaires à notre script :

```bash
#!/bin/bash

# Demander le nom de l'utilisateur

read -p "What is your name? " name

# Saluer l'utilisateur
echo "Hi there $name"
echo "Welcome to DevDojo!"
```

Les commentaires sont un bon moyen de décrire les fonctionnalités les plus complexes directement à l'intérieur de vos scripts pour que d'autres personnes puissent aisément se repérer à l'intérieur de votre code.
