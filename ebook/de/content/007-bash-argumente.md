# Bash-Argumente

Sie können Ihrem Shell-Skript Argumente übergeben, wenn Sie es ausführen. Um ein Argument zu übergeben, müssen Sie es einfach direkt hinter den Namen Ihres Skripts schreiben. Zum Beispiel:

```bash
./devdojo.com ihr_argument
```

Im Skript können wir dann `$1` verwenden, um auf das erste Argument zu verweisen, das wir angegeben haben.

Wenn wir ein zweites Argument übergeben, wäre es als `$2` verfügbar und so weiter.

Lassen Sie uns als Beispiel ein kurzes Skript namens `arguments.sh` erstellen:

```bash
#!/bin/bash

echo "Argument eins ist $1"
echo "Argument zwei ist $2"
echo "Argument drei ist $3"
```

Speichern Sie die Datei und machen Sie sie ausführbar:

```bash
chmod +x argumente.sh
```

Starten Sie dann die Datei und übergeben Sie **3** Argumente:

```bash
./arguments.sh hund katze vogel
```

Die Ausgabe, die Sie erhalten würden, wäre:

```bash
Argument eins ist Hund
Argument zwei ist Katze
Argument drei ist Vogel
```

Um alle Argumente zu referenzieren, können Sie `$@` verwenden:

```bash
#!/bin/bash

echo "Alle Argumente: $@"
```

Wenn Sie das Skript erneut ausführen:

```bash
./arguments.sh dog cat bird
```

Sie werden die folgende Ausgabe erhalten:

```
Alle Argumente: Hund Katze Vogel
```

Eine weitere Sache, die Sie beachten müssen, ist, dass `$0` verwendet wird, um auf das Skript selbst zu verweisen.

Dies ist ein ausgezeichneter Weg, um die Datei bei Bedarf selbst zu zerstören oder einfach den Namen des Skripts zu erhalten.

Lassen Sie uns zum Beispiel ein Skript erstellen, das den Namen der Datei ausgibt und die Datei danach löscht:

```bash
#!/bin/bash

echo "Der Name der Datei ist: $0 und sie wird selbst geloescht."

rm -f $0
```

Sie müssen mit der Selbstlöschung vorsichtig sein und sicherstellen, dass Sie Ihr Skript gesichert haben, bevor Sie es selbst löschen.