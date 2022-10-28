# Bash Bedingungen

Im letzten Abschnitt haben wir einige der gängigsten Bedingungs-Ausdrücke behandelt. Wir können sie nun mit Standard-Bedingungsanweisungen wie `if`, `if-else` und `switch case`-Anweisungen verwenden.

## If statement

Das Format einer "if"-Anweisung in Bash ist wie folgt:

```bash
if [[ some_test ]]
then
    <commands>
fi
```

Hier ist ein kurzes Beispiel, das Sie auffordert, Ihren Namen einzugeben, falls Sie ihn leer gelassen haben:

```bash
#!/bin/bash

# Bash if statement beispiel

read -p "Wie heißt du? " name

if [[ -z ${name} ]]
then
    echo "Bitte gebe deinen Namen ein!"
fi
```

## If Else statement

Mit einer `if-else`-Anweisung können Sie eine Aktion für den Fall angeben, dass die Bedingung in der `if`-Anweisung nicht erfüllt ist. Wir können dies mit den bedingten Ausdrücken aus dem vorherigen Abschnitt wie folgt kombinieren:

```bash
#!/bin/bash

# Bash if statement example

read -p "Wie heißt du? " name

if [[ -z ${name} ]]
then
    echo "Bitte gebe deinen Namen ein!"
else
    echo "Hey ${name}"
fi
```

Sie können die obige if-Anweisung mit allen Bedinunges-Ausdrücken aus den vorherigen Kapiteln verwenden:

```bash
#!/bin/bash

admin="devdojo"

read -p "Bitte gebe den Nutzernamen ein " username

# Überprüfen ob der eingegebene Benutzername der Administrator ist

if [[ "${username}" == "${admin}" ]] ; then
    echo "Du bist der Admin!"
else
    echo "Du bist NICHT der Admin!"
fi
```

Hier ist ein weiteres Beispiel für eine  `if `-Anweisung, die Ihre aktuelle  `Benutzer-ID ` überprüft und Ihnen nicht erlaubt, das Skript als  `root `-Benutzer auszuführen:

```bash
#!/bin/bash

if (( $EUID == 0 )); then
    echo "Bitte führe das Skript nicht als root aus"
    exit
fi
```

Wenn Sie dies an den Anfang Ihres Skripts stellen, wird es beendet, wenn die EUID 0 ist, und führt den Rest des Skripts nicht aus. Dies wurde im [DigitalOcean-Community-Forum] (https://www.digitalocean.com/community/questions/how-to-check-if-running-as-root-in-a-bash-script) diskutiert.

Sie können auch mehrere Bedingungen mit einer `if`-Anweisung testen. In diesem Beispiel wollen wir sicherstellen, dass der Benutzer weder der Admin-Benutzer noch der Root-Benutzer ist, um sicherzustellen, dass das Skript nicht zu viel Schaden anrichten kann. In diesem Beispiel verwenden wir den Operator `oder`, gekennzeichnet durch `||`. Das bedeutet, dass eine der beiden Bedingungen wahr sein muss. Wenn wir den `und` Operator von `&&` verwenden würden, müssten beide Bedingungen wahr sein.

```bash
#!/bin/bash

admin="devdojo"

read -p "Bitte gebe den Nutzernamen ein? " username

# Überprüfen ob der eingegebene Benutzername der Administrator ist

if [[ "${username}" != "${admin}" ]] || [[ $EUID != 0 ]] ; then
    echo "Du bist  entweder nicht der Admin oder du bist der root Nutzer, bitte sicher bleiben"
else
    echo "Du bist der Admin! Das könnte zerstörerisch werden"
fi
```

Wenn Sie mehrere Bedingungen und Szenarien haben, können Sie die `elif`-Anweisung mit `if`- und `else`-Anweisungen verwenden.

```bash
#!/bin/bash

read -p "Gebe eine Zahl ein: " num

if [[ $num -gt 0 ]] ; then
    echo "Die Zahl ist positiv"
elif [[ $num -lt 0 ]] ; then
    echo "Die Zahl ist negativ"
else
    echo "Die Zahl ist 0"
fi
```

## Switch case statements

Wie in anderen Programmiersprachen können Sie eine `Case`-Anweisung verwenden, um komplexe Bedingungen zu vereinfachen, wenn es mehrere verschiedene Möglichkeiten gibt. Anstatt also mehrere `if`- und `if-else`-Anweisungen zu verwenden, können Sie eine einzige `case`-Anweisung benutzen.

Die Syntax der Bash `case`-Anweisung sieht wie folgt aus:

```bash
case $some_variable in

  pattern_1)
    commands
    ;;

  pattern_2| pattern_3)
    commands
    ;;

  *)
    default commands
    ;;
esac
```

Ein kurzer Überblick über die Struktur:

* Alle `case`-Anweisungen beginnen mit dem Schlüsselwort `case`.
* In derselben Zeile wie das Schlüsselwort "case" müssen Sie eine Variable oder einen Ausdruck angeben, gefolgt von dem Schlüsselwort `in`.
* Danach folgen die `case`-Muster, wobei Sie mit `)` das Ende des Musters angeben müssen.
* Sie können mehrere Muster angeben, die durch eine Pipe getrennt sind: `|`.
* Nach dem Muster geben Sie die Befehle an, die ausgeführt werden sollen, wenn das Muster auf die angegebene Variable oder den Ausdruck passt.
* Alle Klauseln müssen durch das Anfügen von `;;` am Ende abgeschlossen werden.
* Sie können eine Standardanweisung haben, indem Sie ein `*` als Muster hinzufügen.
* Um die `case`-Anweisung zu schließen, verwenden Sie das Schlüsselwort `esac` (case typed backwards).

Hier ist ein Beispiel für eine Bash `case`-Anweisung:

```bash
#!/bin/bash

read -p "Gebe den Namen einer Automarke ein: " car

case $car in

  Tesla)
    echo -n "${car}'s fabrik steht in der USA."
    ;;

  BMW | Mercedes | Audi | Porsche)
    echo -n "${car}' fabrik steht in Deutschland."
    ;;

  Toyota | Mazda | Mitsubishi | Subaru)
    echo -n "${car}'s fabrik steht in Japan."
    ;;

  *)
    echo -n "${car} ist keine uns bekannte Automarke"
    ;;

esac
```

In diesem Skript wird der Benutzer aufgefordert, den Namen einer Automarke wie Telsa, BMW, Mercedes usw. einzugeben.

Mit einer `Case`-Anweisung prüfen wir dann, ob der Markenname mit einem unserer Muster übereinstimmt, und wenn ja, geben wir den Standort der Fabrik aus.

Wenn der Markenname mit keiner unserer `case`-Anweisungen übereinstimmt, geben wir eine Standardmeldung aus: `eine unbekannte Automarke`.

## Zusammenfassung

Ich würde Ihnen raten, das Skript zu modifizieren und ein wenig damit zu spielen, damit Sie das, was Sie in den letzten beiden Kapiteln gelernt haben, üben können!

Weitere Beispiele für `case`-Anweisungen in der Bash finden Sie in Kapitel 16, in dem wir ein interaktives Menü in der Bash erstellen, das eine `cases`-Anweisung zur Verarbeitung der Benutzereingaben verwendet.
