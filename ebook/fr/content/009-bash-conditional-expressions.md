# Les Expressions Conditionnelles en Bash

En informatique, les affirmations conditionnelles, expressions conditionnelles et constructions conditionnelles sont des fonctionnalités d'un langage de programmation qui effectuent des opérations différentes en fonction de la valeur booléenne d'une condition spécifiée par le développeur, `true` (vrai) ou `false` (faux).

En Bash, les expressions conditionnelles utilisent les commandes `[[` et `[` pour tester les attributs d'un fichier et effectuer des comparaisons arithmétiques ou à partir de strings. 

Voici une liste des expressions conditionnelles Bash les plus populaires. Vous n'avez pas besoin de les retenir par coeur. Vous pouvez simplement vous référer à cette liste quand vous en avez besoin !

## Expressions à partir d'un fichier

* Vrai si le fichier existe.

```bash
[[ -a ${fichier} ]]
```

* Vrai si le fichier existe et est un fichier spécial en mode bloc (block special file).

```bash
[[ -b ${fichier} ]]
```

* Vrai si le fichier existe et est un fichier spécial en mode caractère (character special file).

```bash
[[ -c ${fichier} ]]
```

* Vrai si le fichier existe et est un dossier.

```bash
[[ -d ${fichier} ]]
```

* Vrai si le fichier existe.

```bash
[[ -e ${fichier} ]]
```

* Vrai si le fichier existe et est un fichier normal.

```bash
[[ -f ${fichier} ]]
```

* Vrai si le fichier existe et est un lien symbolique.

```bash
[[ -h ${fichier} ]]
```

* Vrai si le fichier existe et est lisible.

```bash
[[ -r ${fichier} ]]
```

* Vrai si le fichier existe et a une taille supérieure à zéro.

```bash
[[ -s ${fichier} ]]
```

* Vrai si le fichier existe et peut recevoir des écritures.

```bash
[[ -w ${fichier} ]]
```

* Vrai si le fichier existe et est exécutable.

```bash
[[ -x ${fichier} ]]
```

* Vrai si le fichier existe et est un lien symbolique.

```bash
[[ -L ${fichier} ]]
```

## Les expressions sur des strings

* Vrai si la variable varname existe (on lui a assigné une valeur).

```bash
[[ -v ${varname} ]]
```

* Vrai si la string a une longueur égale à 0.

```bash
[[ -z ${string} ]]
```

* Vrai si la string a une longueur différente de 0.

```bash
[[ -n ${string} ]]
```

* Vrai si les strings sont égales. `=` doit être utilisé avec la commande `[` pour être conforme à la norme POSIX. Quand vous utilisez la commande `[[`, vous cherchez des correspondances de motifs entre les deux strings.

```bash
[[ ${string1} == ${string2} ]]
```

* Vrai si les strings sont différentes.

```bash
[[ ${string1} != ${string2} ]]
```

* Vrai si string1 précède string2 alphabétiquement.

```bash
[[ ${string1} < ${string2} ]]
```

* Vrai si string1 suit string2 alphabétiquement.

```bash
[[ ${string1} > ${string2} ]]
```

## Les opérateurs arithmétiques

* Vrai si les nombres sont **égaux**.

```bash
[[ ${arg1} -eq ${arg2} ]]
```

* Vrai si les nombres ne sont **pas égaux**.

```bash
[[ ${arg1} -ne ${arg2} ]]
```

* Vrai si arg1 est **plus petit que** arg2.

```bash
[[ ${arg1} -lt ${arg2} ]]
```

* Vrai si arg1 est **plus petit ou égal à** arg2.

```bash
[[ ${arg1} -le ${arg2} ]]
```

* Vrai si arg1 est **plus grand que** arg2.

```bash
[[ ${arg1} -gt ${arg2} ]]
```

* Vrai si arg1 est **plus grand ou égal à** arg2.

```bash
[[ ${arg1} -ge ${arg2} ]]
```

Pour information, arg1 et arg2 peuvent être des entiers positifs ou négatifs.

Comme avec d'autres langages de programmation, vous pouvez utiliser les conditions `AND` (et) & `OR` (ou) :

```bash
[[ test_case_1 ]] && [[ test_case_2 ]] # And
[[ test_case_1 ]] || [[ test_case_2 ]] # Or
```

## Opérateurs sur le statut de fin d'une commande

* Vrai si la commande a réussi et n'a pas rencontré d'erreur.

```bash
[[ $? -eq 0 ]]
```

* Vrai si la commande n'a pas réussi ou a rencontré une erreur.

```bash
[[ $? -gt 0 ]]
```
