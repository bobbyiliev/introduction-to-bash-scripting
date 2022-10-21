# Bash Arrays

Wenn Sie jemals programmiert haben, sind Sie wahrscheinlich bereits mit Arrays vertraut.

Für den Fall, dass Sie kein Entwickler sind, sollten Sie vor allem wissen, dass Arrays, anders als Variablen, mehrere Werte unter einem Namen speichern können.

Sie können ein Array initialisieren, indem Sie ihm Werte zuweisen, die durch ein Leerzeichen getrennt und in `()` eingeschlossen sind. Beispiel:

```bash
mein_array=("Wert 1" "Wert 2" "Wert 3" "Wert 4")
```

Um auf die Elemente im Array zuzugreifen, müssen Sie sie über ihren numerischen Index referenzieren.

>Beachten Sie, dass Sie geschweifte Klammern verwenden müssen.

* Beim Zugriff auf ein einzelnes Element würde dies ausgegeben werden: `Wert 2`

```bash
echo ${my_array[1]}
```

* Dies würde das letzte Element zurückgeben: `value 4`

```bash
echo ${my_array[-1]}
```

* Wie bei den Kommandozeilenargumenten gibt die Verwendung von `@` alle Argumente im Array zurück, wie folgt: `Wert 1 Wert 2 Wert 3 Wert 4`

```bash
echo ${my_array[@]}
```

* Wenn man dem Array ein Rautezeichen (`#`) voranstellt, wird die Gesamtzahl der Elemente im Array ausgegeben, in unserem Fall ist es `4`:

```bash
echo ${#my_array[@]}
```

Testen Sie dies und üben Sie es bei Ihnen mit verschiedenen Werten.

## Zeichenketten in der Bash :: Zerschneiden

Schauen wir uns das folgende Beispiel für die Zerlegung einer Zeichenkette in der Bash an:

```bash
#!/bin/bash

Buchstaben=( "A""B""C""D""E" ) 
echo ${Buchstaben[@]}
```

Dieser Befehl gibt alle Elemente eines Arrays aus.

Ausgabe:

```bash
$ ABCDE
```


Sehen wir uns ein paar weitere Beispiele an:

- Beispiel 1

```bash
#!/bin/bash

Buchstaben=("A""B""C""D""E" ) 
b=${Buchstaben:0:2}
echo "${b}"
```

Dieser Befehl druckt ein Array vom Startindex 0 bis 2, wobei 2 exklusiv ist.

```bash
$ AB
```

- Beispiel 2

```bash
#!/bin/bash

Buchstaben=("A""B""C""D""E" ) 
b=${Buchstaben::5}
echo "${b}"
```

Dieser Befehl druckt von Basisindex 0 bis 5, wobei 5 exklusiv ist und der Startindex standardmäßig auf 0 gesetzt ist.

```bash
$ ABCDE
```

- Beispiel 3

```bash
#!/bin/bash

Buchstaben=("A""B""C""D""E" ) 
b=${Buchstaben:3}
echo "${b}"
```

Dieser Befehl druckt vom Startindex
3 bis einschließlich Ende des Arrays aus.

 ```bash
 $ DE
 ```
