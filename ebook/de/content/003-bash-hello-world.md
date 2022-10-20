# Bash Hallo Welt

Nachdem wir unsere `devdojo.sh`-Datei erstellt und den Bash-Shabang in der ersten Zeile angegeben haben, können wir unser erstes `Hello World`-Bash-Skript erstellen.

Dazu öffnen wir die Datei `devdojo.sh` erneut und fügen nach der Zeile `#!/bin/bash` folgendes ein:

```bash
#!/bin/bash

echo "Hello World!"
```

Speichern Sie die Datei und beenden Sie sie.

Danach machen Sie das Skript ausführbar, indem Sie es ausführen:

```bash
chmod +x devdojo.sh
```

Danach führen Sie die Datei aus:

```bash
./devdojo.sh
```

Sie werden eine "Hello World"-Meldung auf dem Bildschirm sehen.

Eine andere Möglichkeit, das Skript auszuführen, wäre:

```bash
bash devdojo.sh
```

Da bash interaktiv verwendet werden kann, könnten Sie den folgenden Befehl direkt in Ihrem Terminal ausführen und Sie würden das gleiche Ergebnis erhalten:

```bash
echo "Hallo DevDojo!"
```

Das Zusammenstellen eines Skripts ist nützlich, wenn Sie mehrere Befehle miteinander kombinieren müssen.
