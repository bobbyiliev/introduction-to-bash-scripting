# La Structure Bash

Commençons par créer un nouveau fichier avec l'extension `.sh`. Par exemple, nous pouvons créer un fichier appelé `devdojo.sh`.

Pour créer ce fichier, vous pouvez utiliser la commande `touch` :

```bash
touch devdojo.sh
```

Ou vous pouvez utiliser votre éditeur de texte :

```bash
nano devdojo.sh
```

Pour lancer un fichier contenant un script bash avec l'interpréteur shell, la première ligne de ce fichier doit indiquer le chemin absolu de l'exécutable bash :

```bash
#!/bin/bash
```

On appelle cet en-tête un [Shebang](https://fr.wikipedia.org/wiki/Shebang).

Le shebang sert uniquement à informer le système d'exploitation qu'il doit lancer le script avec l'exécutable `/bin/bash`.
