# Erstellen benutzerdefinierter Bash-Befehle

Als Entwickler oder Systemadministrator müssen Sie möglicherweise viel Zeit an Ihrem Terminal verbringen. Ich versuche immer, nach Möglichkeiten zu suchen, sich wiederholende Aufgaben zu optimieren.

Eine Möglichkeit hierfür besteht darin, entweder kurze Bash-Skripte zu schreiben oder benutzerdefinierte Befehle, auch Aliase genannt, zu erstellen. Anstatt beispielsweise jedes Mal einen wirklich langen Befehl einzugeben, könnten Sie einfach eine Abkürzung dafür erstellen.

## Beispiel

Beginnen wir mit dem folgenden Szenario: Als Systemadministrator müssen Sie möglicherweise häufig die Verbindungen zu Ihrem Webserver überprüfen, daher verwende ich den Befehl `netstat` als Beispiel.

Wenn ich auf einen Server zugreife, der Probleme mit den Verbindungen zu Port 80 oder 443 hat, prüfe ich normalerweise, ob Dienste diese Ports überwachen und wie viele Verbindungen zu diesen Ports bestehen.

Der folgende `netstat`-Befehl würde uns zeigen, wie viele TCP-Verbindungen auf Port 80 und 443 wir derzeit haben:

```bash
netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l
```

Dies ist ein ziemlich langer Befehl, daher kann es auf lange Sicht zeitaufwändig sein, ihn jedes Mal einzugeben, insbesondere wenn Sie diese Informationen schnell erhalten möchten.

Um dies zu vermeiden, können wir einen Alias erstellen, sodass wir statt des gesamten Befehls einfach einen kurzen Befehl eingeben können. Nehmen wir zum Beispiel an, wir wollten in der Lage sein, `conn` (Abkürzung für 'Connections') einzugeben und die gleichen Informationen zu erhalten. In diesem Fall müssen wir lediglich den folgenden Befehl ausführen:

```bash
alias conn="netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Auf diese Weise erstellen wir einen Alias namens `conn`, der im Wesentlichen eine 'Abkürzung' für unseren langen `netstat`-Befehl wäre. Wenn Sie jetzt einfach `conn` ausführen:

```bash
conn
```

Sie würden die gleiche Ausgabe erhalten wie der lange Befehl `netstat`.
Sie können noch kreativer werden und hier einige Infobotschaften wie diese hinzufügen:

```bash
alias conn="echo 'Total connections on port 80 and 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Wenn Sie nun `conn` ausführen, erhalten Sie die folgende Ausgabe:

```bash
Total connections on port 80 and 443:
12
```

Wenn Sie sich jetzt abmelden und wieder anmelden, geht Ihr Alias verloren. Im nächsten Schritt erfahren Sie, wie Sie dies dauerhaft machen.

## Die Veränderung dauerhaft machen

Um die Änderung dauerhaft zu machen, müssen wir den Befehl `alias` in unsere Shell-Profildatei einfügen.

Standardmäßig wäre dies unter Ubuntu die Datei `~/.bashrc`, bei anderen Betriebssystemen könnte dies die Datei `~/.bash_profile` sein. Öffnen Sie die Datei mit Ihrem bevorzugten Texteditor:

```bash
nano ~/.bashrc
```

Gehen Sie nach unten und fügen Sie Folgendes hinzu:

```bash
alias conn="echo 'Total connections on port 80 and 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Speichern und dann beenden.

Auf diese Weise bleibt Ihre Änderung auch dann erhalten, wenn Sie sich abmelden und wieder anmelden, und Sie können Ihren benutzerdefinierten Bash-Befehl ausführen.

## Auflistung aller verfügbaren Aliase

Um alle verfügbaren Aliase für Ihre aktuelle Shell aufzulisten, müssen Sie einfach den folgenden Befehl ausführen:

```bash
alias
```

Dies ist nützlich, falls bei einigen Befehlen ein seltsames Verhalten auftritt.

## Fazit

Dies ist eine Möglichkeit, benutzerdefinierte Bash-Befehle oder Bash-Aliase zu erstellen.

Natürlich könnten Sie tatsächlich ein Bash-Skript schreiben und das Skript in Ihrem Ordner `/usr/bin` hinzufügen, aber das würde nicht funktionieren, wenn Sie keinen Root- oder Sudo-Zugriff haben. Wobei es mit der oben genannten Möglichkeit ohne Notwendigkeit eines Root-Zugriffs funktioniert.

> {notice} Dies wurde ursprünglich auf [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-create-custom-bash-commands) veröffentlicht.
