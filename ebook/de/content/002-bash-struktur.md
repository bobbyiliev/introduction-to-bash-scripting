# Bash-Struktur

Beginnen wir mit der Erstellung einer neuen Datei mit der Erweiterung `.sh`. Als Beispiel könnten wir eine Datei namens `devdojo.sh` erstellen.

Um diese Datei zu erstellen, können Sie den Befehl `touch` verwenden:

```bash
touch devdojo.sh
```

Oder Sie können stattdessen Ihren Texteditor verwenden:

```bash
nano devdojo.sh
```

Um eine Bash-Skriptdatei mit dem Bash-Shell-Interpreter auszuführen, muss in der ersten Zeile einer Skriptdatei der absolute Pfad zur ausführbaren Bash-Datei angegeben werden:

```bash
#!/bin/bash
```

Dies wird auch [Shebang] genannt (https://en.wikipedia.org/wiki/Shebang_(Unix)).

Der Shebang weist das Betriebssystem lediglich an, das Skript mit der ausführbaren Datei `/bin/bash` auszuführen.
