# Debuggen, Testen und Abkürzungen

Um Ihre Bash-Skripte zu debuggen, können Sie beim Ausführen Ihrer Skripte `-x` verwenden:

```bash
bash -x ./ihr_script.sh
```

Oder Sie können `set -x` vor der spezifischen Zeile hinzufügen, die Sie debuggen möchten. `set -x` aktiviert einen Modus der Shell, in dem alle ausgeführten Befehle auf dem Terminal ausgegeben werden.

Eine weitere Möglichkeit, Ihre Skripte zu testen, ist die Verwendung dieses fantastischen Tools hier:

[https://www.shellcheck.net/](https://www.shellcheck.net/)

Kopieren Sie einfach Ihren Code und fügen Sie ihn in das Textfeld ein. Das Tool gibt Ihnen dann einige Vorschläge, wie Sie Ihr Skript verbessern können.

Sie können das Tool auch direkt in Ihrem Terminal ausführen:

[https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)

Wenn Ihnen das Tool gefällt, stellen Sie sicher, dass Sie es auf GitHub mit einem Stern versehen und Ihren Beitrag leisten!

Als SysAdmin/DevOps verbringe ich einen Großteil meines Tages im Terminal. Hier sind meine Lieblingsverknüpfungen, die mir helfen, Aufgaben schneller zu erledigen, während ich Bash-Skripte schreibe oder einfach nur im Terminal arbeite.

Die beiden folgenden sind besonders nützlich, wenn Sie einen sehr langen Befehl haben.

- Löschen Sie alles vom Cursor bis zum Ende der Zeile:

```
Strg + k
```

- Löschen Sie alles vom Cursor bis zum Ende der Zeile:

```
Strg + u
```

- Ein Wort rückwärts vom Cursor löschen:

```
Strg + w
```

- Durchsuchen Sie Ihren Verlauf rückwärts. Dies ist wahrscheinlich die, die ich am häufigsten verwende. Es ist wirklich praktisch und beschleunigt meinen Arbeitsablauf ungemein:

```
Strg + r
```

- Löschen Sie den Bildschirm. Ich verwende Folgendes, anstatt den Befehl `clear` einzugeben:

```
Strg + l
```

- Stoppt die Ausgabe auf dem Bildschirm:

```Strg
Strg + s
```

- Aktivieren Sie die Ausgabe auf dem Bildschirm, falls diese zuvor mit `Strg + s` gestoppt wurde:

```
Strg + q
```

- Beenden Sie den aktuellen Befehl:

```
Strg + c
```

- Werfen Sie den aktuellen Befehl in den Hintergrund:

```
Strg + z
```

Ich verwende sie regelmäßig jeden Tag und spare dadurch viel Zeit.

Wenn Sie der Meinung sind, dass ich etwas ausgelassen habe, können Sie sich gerne an der Diskussion im [DigitalOcean-Community-Forum](https://www.digitalocean.com/community/questions/what-are-your-favorite-bash-shortcuts) beteiligen!
