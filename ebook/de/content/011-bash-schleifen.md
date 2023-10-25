# Bash Schleifen

Wie in jeder anderen Sprache, sind Schleifen sehr praktisch. Mit Bash können sie `for`, `while` und `until` Schleifen verwenden.

## For Schleifen

Hier ist die Struktur einer `for` Schleife:

```bash
for var in ${list}
do
    ihre_befehle
done
```

Beispiel:

```bash
#!/bin/bash

users="devdojo bobby tony"

for user in ${users}
do
    echo "${user}"
done
```

Eine kurze Zusammenfassung des Beispiels:

- Zuallererst erstellen wir eine Liste von Benutzern und speichern sie in einer Variable welche wir als `users` bezeichnen.
- Dann starten wir unsere `for` Schleife mit dem `for` Befehl.
- Danach definieren wir eine Variable, welche jeden Eintrag in der `users` Variable darstellt. In unserem Fall definieren wir eine Variable mit dem Namen `user`, welche jeden einzelnen Benutzer in der `users` Variable repraesentiert.
- Dann geben wir das Schlüsselwort `in` an, gefolgt von unserer Liste, die wir durchlaufen.
- In der nächsten Zeile verwenden wir das Schlüsselwort `do`, das angibt, was wir für jede Iteration der Schleife tun werden.
- Dann geben wir die Befehle an, die wir ausführen möchten.
- Abschließend schließen wir die Schleife mit dem Schlüsselwort `done`.

Sie können `for` auch verwenden, um eine Reihe von Zahlen zu verarbeiten. Hier ist zum Beispiel eine Möglichkeit, von 1 bis 10 zu durchlaufen:

```bash
#!/bin/bash

for num in {1..10}
do
    echo ${num}
done
```

## While Schleifen

Der Aufbau einer while-Schleife ist der `for`-Schleife recht ähnlich:

```bash
while [ ihre_bedingung ]
do
    ihre_befehle
done
```

Hier ist ein Beispiel für eine `while`-Schleife:

```bash
#!/bin/bash

counter=1
while [[ $counter -le 10 ]]
do
    echo $counter
    ((counter++))
done
```

Zuerst haben wir eine Zählervariable angegeben und auf „1“ gesetzt, dann haben wir innerhalb der Schleife einen Zähler hinzugefügt, indem wir diese Anweisung hier verwendet haben: `((counter++))`. Auf diese Weise stellen wir sicher, dass die Schleife nur 10 Mal und nicht ewig ausgeführt wird. Die Schleife wird abgeschlossen, sobald der Zähler 10 erreicht, da wir dies als Bedingung festgelegt haben: `while [[ $counter -le 10 ]]`.

Erstellen wir ein Skript, das den Benutzer nach seinem Namen fragt und keine leere Eingabe zulässt:

```bash
#!/bin/bash

read -p "Wie ist ihr Name? " name

while [[ -z ${name} ]]
do
    echo "Ihr Name darf nicht leer sein. Bitte geben Sie einen gültigen Namen ein!"
    read -p "Geben Sie Ihren Namen erneut ein? " name
done

echo "Hallo ${name}"
```

Wenn Sie nun das oben Gesagte ausführen und einfach die Eingabetaste drücken, ohne eine Eingabe vorzunehmen, läuft die Schleife erneut und fragt Sie immer wieder nach Ihrem Namen, bis Sie tatsächlich eine Eingabe machen.

## Until Schleifen

Der Unterschied zwischen `until`- und `while`-Schleifen besteht darin, dass die `until`-Schleife die Befehle innerhalb der Schleife ausführt, bis die Bedingung wahr wird.

Struktur:

```bash
until [[ ihre_bedingung ]]
do
    ihre_befehle
done
```

Beispiel:

```bash
#!/bin/bash

count=1
until [[ $count -gt 10 ]]
do
    echo $count
    ((count++))
done
```

## Continue und Break

Wie bei anderen Sprachen können Sie auch bei Ihren Bash-Skripten `continue` und `break` verwenden:

- `continue` weist Ihr Bash-Skript an, die aktuelle Iteration der Schleife zu stoppen und die nächste Iteration zu starten.

Die Syntax der continue-Anweisung lautet wie folgt:

```bash
continue [n]
```

Das Argument [n] ist optional und kann größer oder gleich 1 sein. Wenn [n] angegeben wird, wird die n-te umschließende Schleife fortgesetzt. continue 1 ist gleichbedeutend mit continue.

```bash
#!/bin/bash

for i in 1 2 3 4 5
do
    if [[ $i –eq 2 ]]
    then
        echo "ueberspringe nummer 2"
    continue
    fi
    echo "i ist gleich $i"
done
```

Wir können den Continue-Befehl auch auf ähnliche Weise wie den Break-Befehl verwenden, um mehrere Schleifen zu steuern.

- `break` weist Ihr Bash-Skript an, die Schleife sofort zu beenden.

Die Syntax der break-Anweisung sieht wie folgt aus:

```bash
break [n]
```

[n] ist ein optionales Argument und muss größer oder gleich 1 sein. Wenn [n] angegeben wird, wird die n-te umschließende Schleife verlassen. Pause 1 entspricht Pause.

Beispiel:

```bash
#!/bin/bash

num=1
while [[ $num –lt 10 ]]
do
    if [[ $num –eq 5 ]]
    then
        break
    fi
    ((num++))
done
echo "Schleife abgeschlossen"
```

Wir können den Befehl break auch mit mehreren Schleifen verwenden. Wenn wir die aktuelle Arbeitsschleife verlassen möchten, egal ob innere oder äußere Schleife, verwenden wir einfach break. Wenn wir uns jedoch in der inneren Schleife befinden und die äußere Schleife verlassen möchten, verwenden wir break 2.

Beispiel:

```bash
#!/bin/bash

for (( a = 1; a < 10; a++ ))
do
    echo "Schleife außen: $a"
    for (( b = 1; b < 100; b++ ))
    do
        if [[ $b –gt 5 ]]
        then
            break 2
        fi
    echo "Schleife innen: $b "
    done
done
```

Das Bash-Skript beginnt mit a=1 und wechselt zur inneren Schleife. Wenn es b=5 erreicht, wird die äußere Schleife unterbrochen.
Wir können nur `break` anstelle von `break 2` verwenden, um die innere Schleife zu unterbrechen und zu sehen, wie sich dies auf die Ausgabe auswirkt.
