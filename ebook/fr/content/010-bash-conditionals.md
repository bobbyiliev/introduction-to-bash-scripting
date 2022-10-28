# Les conditions en Bash

Dans la section précédente, nous avons couvert certaines des expressions conditionnelles les plus populaires. À présent, nous pouvons les utiliser avec les expressions conditionnelles les plus courantes telles que `if`, `if-else` et `switch case`.

## L'expression `if`

Le format d'une expression `if` est le suivant :

```bash
if [[ un_test ]]
then
    <commandes>
fi
```

Voici un exemple simple qui vous demande d'entrer votre nom si vous avez laissé le champ de texte vide :

```bash
#!/bin/bash
# Exemple de condition if en Bash 
read -p "Quel est votre nom ? " nom
if [[ -z ${nom} ]]
then
    echo "Veuillez entrer votre nom !"
fi
```

## L'expression If Else

Avec une expression `if-else`, vous pouvez spécifier une action dans le cas où la condition dans l'expression `if` n'est pas vérifiée. Nous pouvons combiner cette notation avec les expressions conditionnelles de la section précédente :

```bash
#!/bin/bash
# Exemple de condition if-else en Bash 
read -p "Quel est votre nom ? " nom
if [[ -z ${nom} ]]
then
    echo "Veuillez entrer votre nom !"
else
    echo "Salut ${nom}"
fi
```

Vous pouvez utiliser l'expression if-else ci-dessus avec toutes les expressions conditionnelles des chapitres précédents :

```bash
#!/bin/bash
admin="devdojo"
read -p "Entrez votre nom d'utilisateur" username
# Vérifier si le nom d'utilisateur fourni est celui de l'administrateur
if [[ "${username}" == "${admin}" ]] ; then
    echo "Vous êtes l'administrateur !"
else
    echo "Vous n'êtes PAS l'administrateur !"
fi
```

Voici un autre exemple d'une expression `if` qui vérifie votre identifiant utilisateur actuel et vous empêche de lancer le script en tant qu'utilisateur `racine` :

```bash
#!/bin/bash
if (( $EUID == 0 )); then
    echo "Veuillez ne pas lancer ce script en tant qu'utilisateur racine"
    exit
fi
```

Si vous placez ce code en haut de votre script, il se fermera si l'EUID est égal à 0 et n'exécutera pas le reste du script. Cet élément a été discuté sur [le forum communautaire DigitalOcean](https://www.digitalocean.com/community/questions/how-to-check-if-running-as-root-in-a-bash-script) (ressource en anglais).

Vous pouvez aussi tester de multiples conditions avec une expression `if`. Dans cet exemple, nous voulons nous assurer que l'utilisateur n'est ni l'administrateur ni l'utilisateur racine pour s'assurer que le script ne risque pas de causer trop de dégats. Nous utiliserons l'opérateur `ou` dans cet exemple, noté `||`. Cela veut dire qu'une des conditions conditions doit être vraie. Si nous utilisions l'opérateur `et` noté `&&`, alors les deux conditions devraient être vérifiées.

```bash
#!/bin/bash
admin="devdojo"
read -p "Entrez votre nom d'utilisateur? " username
# Vérifier si le nom d'utilisateur fourni est celui de l'administrateur ou si l'EUID est celui de l'utilisateur racine
if [[ "${username}" != "${admin}" ]] || [[ $EUID != 0 ]] ; then
    echo "Vous n'êtes ni l'administrateur ni l'utilisateur racine, mais faîtes quand même attention !"
else
    echo "Vous êtes l'administrateur ! Ce que vous faites pourrait être dangereux !"
fi
```

Si vous avez plusieurs conditions et scénerios, vous pouvez utiliser l'expression `elif` à l'intérieuru d'un `if-else`.

```bash
#!/bin/bash
read -p "Entrez un nombre : " num
if [[ $num -gt 0 ]] ; then
    echo "Le nombre est positif"
elif [[ $num -lt 0 ]] ; then
    echo "Le nombre est négatif"
else
    echo "Le nombre est 0"
fi
```

## Les expressions switch case

Comme dans d'autres langage de programmation, vous pouvez utiliser l'expression `case` pour simplifier des conditions complexes lorsqu'il y a plusieurs choix différents. Plutôt que d'utiliser de multiples `if` et `if-else`, vous pouvez utiliser une expression `case`.

L'expression `case` avec la syntaxe Bash est écrite comme suit :

```bash
case $une_variable in
  pattern_1)
    commandes
    ;;
  pattern_2| pattern_3)
    commandes
    ;;
  *)
    default commandes
    ;;
esac
```

Détaillons rapidement la structure :

* Toutes les expressions `case` commencent par le mot-clé `case`.
* Sur la même ligne que le mot-clé `case`, vous devez spécifier une variable ou une expression suivie par le mot-clé `in`.
* Ensuite, vous avez les patterns (motifs) de votre `case`, vous devez utiliser `)`  pour identifier la fin du pattern.
* Vous pouvez spécifier plusieurs patterns séparés par le symbole `|`.
* Après les patterns, vous spécifiez les commandes que vous souhaitez executer quand le pattern correspond à la variable ou à l'expression que vous avez indiquée.
* Chaque clause doit se terminer par `;;`.
* Vous pouvez inclure une clause par défaut en ajoutant un `*` à la place du pattern.
* Pour fermer l'expression `case`, utilisez le mot-clé `esac` (case écrit à l'envers).

Here is an example of a Bash `case` statement:

```bash
#!/bin/bash
read -p "Entrez la marque de votre voiture : " voiture
case $voiture in
  Tesla)
    echo -n "$L'usine de {voiture} est aux États-Unis."
    ;;
  BMW | Mercedes | Audi | Porsche)
    echo -n "$L'usine de {voiture} est en Allemagne."
    ;;
  Toyota | Mazda | Mitsubishi | Subaru)
    echo -n "$L'usine de {voiture} est au Japon."
    ;;
  *)
    echo -n "${voiture} est une marque de voiture inconnue."
    ;;
esac
```

Avec ce script, nous demandons à l'utilisateur d'entrer le nom d'une marque de voiture comme Telsa, BMW, Mercedes, etc.

Ensuite, avec une expression `case`, nous vérifions le nom de la marque et si elle correspond à un de nos patterns, nous affichons le lieu de fabrication.

Si le nom de la marque ne correspond à aucune de nos expressions `case`, nous affichons un message par défaut : `une marque de voiture inconnue`.

## Conclusion

Je vous conseille d'essayer de modifier le script pour mieux assimiler ce que vous avez appris dans les deux derniers chapitres !

Pour d'autres exemples d'expressions `case`, regardez le chapitre 16, où nous créons un menu interactif en Bash en nous servant d'une expression `case` pour analyser l'entrée de l'utilisateur.