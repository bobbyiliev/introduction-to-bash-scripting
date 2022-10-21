# Bash-Kommentare

Wie in jeder anderen Programmiersprache auch können Sie Ihrem Skript Kommentare hinzufügen. Kommentare werden verwendet, um sich selbst Notizen in Ihrem Code zu hinterlassen.

Um dies in der Bash zu tun, müssen Sie das Symbol `#` am Anfang der Zeile einfügen. Kommentare werden niemals auf dem Bildschirm angezeigt.

Hier ist ein Beispiel für einen Kommentar:

```bash
# Dies ist ein Kommentar und wird nicht auf dem Bildschirm angezeigt
```

Fügen wir nun unserem Skript einige Kommentare hinzu:

```bash
#!/bin/bash

# Frag den Benutzer nach seinem Namen

read -p "Wie lautet Ihr Name? " Name

# Begrüßt den Benutzer
echo "Hallo, $Name"
echo "Willkommen bei DevDojo!"
```

Kommentare sind eine großartige Möglichkeit, einige der komplexeren Funktionen direkt in Ihren Skripten zu beschreiben, so dass andere Leute sich leicht in Ihrem Code zurechtfinden können.