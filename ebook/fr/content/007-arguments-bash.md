# Arguments Bash

Vous pouvez passer des arguments à votre script shell quand vous l'exécutez. Pour passer un argument, vous devez simplement l'écrire juste après le nom de votre script. Par exemple :

```bash
./devdojo.com votre_argument
```

Dans le script, nous pouvons ensuite utiliser `$1` pour faire appel au premier argument qui a été spécifié. 

Si nous passons un deuxième argument, nous y aurons accès avec la notation `$2`, et ainsi de suite.

Maintenant, nous allons créer un script court appelé `arguments.sh` qui servira d'exemple :

```bash
#!/bin/bash

echo "Le premier argument est $1"
echo "Le deuxième argument est $2"
echo "Le troisième argument est $3"
```

Sauvegardez le fichier et rendez-le exécutable :

```bash
chmod +x arguments.sh
```

Ensuite, lancez le fichier et passez **3** arguments :

```bash
./arguments.sh chien chat oiseau
```

Vous devriez voir le message suivant s'afficher :

```bash
Le premier argument est chien
Le deuxième argument est chat
Le troisième argument est oiseau
```

Pour accéder à tous les arguments, vous pouvez utiliser `$@` :

```bash
#!/bin/bash

echo "Tous les arguments : $@"
```

Si vous relancez le script :

```bash
./arguments.sh chien chat oiseau
```

Le message suivant s'affichera :

```
Tous les arguments : chien chat oiseau
```

Notez bien que `$0` sert à référencer le nom du script lui-même.

C'est un excellent moyen d'auto-détruire le fichier si besoin ou juste d'accéder au nom du script.

Par exemple, créons un script qui affiche le nom du fichier et l'efface ensuite :

```bash
#!/bin/bash

echo "Le nom du fichier est: $0 et il va s'auto-détruire."

rm -f $0
```

Faites attention avec l'auto-destruction de fichiers et assurez-vous d'avoir une copie du fichier avant de l'auto-détruire.
