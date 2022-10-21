# Bash-Benutzereingabe

Mit dem vorherigen Skript haben wir eine Variable definiert und den Wert der Variable mit `echo $name` auf dem Bildschirm ausgegeben.

Jetzt machen wir weiter und fragen stattdessen den Benutzer nach einer Eingabe. Um dies zu tun, öffnen Sie die Datei mit Ihrem bevorzugten Texteditor und ändern Sie das Skript wie folgt

```bash
#!/bin/bash

echo "Wie lautet Ihr Name?"
read name

echo "Hallo, $Name"
echo "Willkommen bei DevDojo!"
```

Das obige Beispiel fordert den Benutzer zur Eingabe auf und speichert diese Eingabe als String/Text in einer Variablen.

Wir können dann die Variable verwenden und eine Nachricht an den Benutzer zurückgeben.

Die Ausgabe des obigen Skripts wäre:

* Starten Sie zuerst das Skript:

```bash
./devdojo.sh
```

* Dann würden Sie aufgefordert werden, Ihren Namen einzugeben:

```
Wie lautet Ihr Name?
Bobby
```

* Nachdem Sie Ihren Namen eingegeben haben, drücken Sie einfach die Eingabetaste und Sie erhalten die folgende Ausgabe:

```
Hallo, Bobby
Willkommen bei DevDojo!
```

Um den Code zu reduzieren, koennten wir die erste `echo`-Anweisung durch `read -p` ersetzen. Der `read`-Befehl, der mit der `-p`-Flagge verwendet wird, gibt eine Nachricht aus, bevor er den Benutzer nach seiner Eingabe fragt:

```bash
#!/bin/bash

read -p "Wie ist Ihr Name? " Name

echo "Hallo, $Name"
echo "Willkommen bei DevDojo!"
```

Testen Sie dies unbedingt auch selbst!