# Hello World en Bash

Une fois que nous avons créé notre fichier `devdojo.sh` et spécifié le shebang sur la première ligne, nous sommes prêts à créer notre premier script Bash qui affichera `Hello World`.

Pour cela, ouvrez le fichier `devdojo.sh` et ajoutez le texte suivant après la ligne contenant `#!/bin/bash`:

```bash
#!/bin/bash
echo "Hello World!"
```

Sauvegardez et fermez le fichier.

Ensuite, rendez le script exécutable en utilisant la commande suivante :

```bash
chmod +x devdojo.sh
```

Enfin, exécutez le script :

```bash
./devdojo.sh
```

Vous verrez apparaitre le message "Hello World" sur votre écran.

Une autre manière de lancer le script serait de lancer la commande suivante :

```bash
bash devdojo.sh
```

Puisque Bash peut être utilisé de manière interactive, vous pouvez directement lancer la commande suivante depuis votre terminal et vous obtiendrez le même résultat :

```bash
echo "Hello World!"
```

Créer un fichier de script est utile lorsque vous devez utiliser plusieurs commandes ensemble.
