# Bash-Variablen

Wie in jeder anderen Programmiersprache können Sie auch in Bash Scripting Variablen verwenden. Allerdings gibt es keine Datentypen, und eine Variable in der Bash kann sowohl Zahlen als auch Zeichen enthalten.

Um einer Variablen einen Wert zuzuweisen, müssen Sie nur das `=` Zeichen verwenden:

```bash
name="DevDojo"
```

>Beachten Sie, dass vor und nach dem `=`-Zeichen keine Leerzeichen stehen dürfen.

Um danach auf die Variable zuzugreifen, müssen Sie das `$` Zeichen verwenden und auf sie verweisen, wie unten gezeigt:

```bash
echo $name
```

Den Variablennamen in geschweifte Klammern einzuschließen ist nicht erforderlich, wird aber als gute Praxis angesehen, und ich würde Ihnen raten, sie zu verwenden, wann immer Sie können:

```bash
echo ${name}
```

Der obige Code würde ausgeben: DevDojo", da dies der Wert unserer Variable "Name" ist.

Als Nächstes wollen wir unser Skript `devdojo.sh` aktualisieren und eine Variable einfügen.

Wiederum können Sie die Datei `devdojo.sh` mit Ihrem bevorzugten Texteditor öffnen, ich benutze hier nano, um die Datei zu öffnen:

```bash
nano devdojo.sh
```

Füge unsere Variable `name` hier in die Datei ein, mit einer Willkommensnachricht. Unsere Datei sieht nun wie folgt aus:

```bash
#!/bin/bash

name="DevDojo"

echo "Hallo, $name"
```

Speichern Sie die Datei und führen Sie sie mit dem folgenden Befehl aus:

```bash
./devdojo.sh
```

Sie werden die folgende Ausgabe auf Ihrem Bildschirm sehen:

```bash
Hallo, DevDojo
```

Hier ist ein Überblick über das Skript, das in die Datei geschrieben wurde:

* `#!/bin/bash` - Als erstes haben wir unseren Shebang angegeben.
* `name=DevDojo` - Dann haben wir eine Variable namens `name` definiert und ihr einen Wert zugewiesen.
* `echo "Hallo $name"` - Schließlich geben wir den Inhalt der Variable als Willkommensnachricht auf dem Bildschirm aus, indem wir `echo` verwenden.

Sie können auch mehrere Variablen in der Datei hinzufügen, wie unten gezeigt:

```bash
#!/bin/bash

name="DevDojo"
gruss="Hallo"

echo "$gruß $name"
```

Speichern Sie die Datei und führen Sie sie erneut aus:

```bash
./devdojo.sh
```

Auf Ihrem Bildschirm sehen Sie die folgende Ausgabe:

```bash
Hallo DevDojo
```

Beachten Sie, dass Sie nicht unbedingt ein Semikolon `;` am Ende jeder Zeile hinzufügen müssen. Es funktioniert in beide Richtungen, ein bisschen wie bei anderen Programmiersprachen wie JavaScript!
