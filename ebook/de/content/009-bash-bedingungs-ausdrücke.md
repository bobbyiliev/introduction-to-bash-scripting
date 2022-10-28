# Bash Bedingungs Ausdrücke

In der Informatik sind Bedingungen fundamentale Merkmale von Programmiersprachen, die verschiedene Berechnungen oder Aktionen durchführen,
je nachdem, ob eine vom Programmierer festgelegte boolesche Bedingung als wahr oder falsch bewertet wird.

In Bash werden Bedingungen vom `[[` zusammengesetzten Befehl und den `[`eingebauten Befehlen verwendet, um Dateiattribute zu testen und String- 
und arithmetische Vergleiche durchzuführen. 

Hier ist eine Liste der gängigsten Bedingungen in Bash. Sie müssen sie nicht auswendig lernen. Sie können einfach auf diese Liste zurückgreifen,
wann immer Sie sie brauchen!

## Datei

* True, sofern die Datei existiert.

```bash
[[ -a ${file} ]]
```

* True, sofern die Datei existiert und eine spezielle Blockdatei ist.

```bash
[[ -b ${file} ]]
```

* True, sofern die Datei existiert und eine spezielle Zeichendatei ist.

```bash
[[ -c ${file} ]]
```

* True, sofern der Ordner existiert.

```bash
[[ -d ${file} ]]
```

* True, sofern die Datei existiert.

```bash
[[ -e ${file} ]]
```

* True, sofern die Datei existiert und eine reguläre Datei ist.

```bash
[[ -f ${file} ]]
```

* True, sofern die Datei existiert und ein symbolischer Link ist.

```bash
[[ -h ${file} ]]
```

* True, sofern die Datei existiert und lesbar ist.

```bash
[[ -r ${file} ]]
```

* True, sofern die Datei größer als 0 ist

```bash
[[ -s ${file} ]]
```

* True, sofern die Datei existiert und beschreibbar ist.

```bash
[[ -w ${file} ]]
```

* True, sofern die Datei existiert und ausführbar ist.

```bash
[[ -x ${file} ]]
```

* True, sofern die Datei existiert und ein symbolischer Link ist.

```bash
[[ -L ${file} ]]
```

## String ausdrücke

* True, sofern die shell Variable existiert

```bash
[[ -v ${varname} ]]
```

* True, sofern die Länge des Strings 0 ist.

```bash
[[ -z ${string} ]]
```

* True, sofern die Länge des Strings nicht 0 ist.

```bash
[[ -n ${string} ]]
```

* True if the strings are equal. `=` should be used with the test command for POSIX conformance. When used with the `[[` command, this performs pattern matching as described above (Compound Commands).

* True, sofern die String gleich sind. `=` sollte mit dem test Befehl für POSIX Konformität verwendet werden. Bei Verwendung mit dem Befehl `[[` wird der Mustervergleich wie oben beschrieben durchgeführt (Zusammengesetzte Befehle).

```bash
[[ ${string1} == ${string2} ]]
```

* True, sofern die Strings nicht gleich sind.

```bash
[[ ${string1} != ${string2} ]]
```

* True, sofern string1 vor string2 lexikografisch sortiert ist.

```bash
[[ ${string1} < ${string2} ]]
```

* True, sofern string1 nach string2 lexikografisch sortiert ist.

```bash
[[ ${string1} > ${string2} ]]
```

## Arithmetische Operatoren

* True, wenn die Zahlen **gleich** sind

```bash
[[ ${arg1} -eq ${arg2} ]]
```

* True, wenn die Zahlen **nicht gleich** sind

```bash
[[ ${arg1} -ne ${arg2} ]]
```

* True, wenn arg1 **kleiner als** arg2 ist

```bash
[[ ${arg1} -lt ${arg2} ]]
```

* True, wenn arg1 **kleiner oder gleich** arg2 ist

```bash
[[ ${arg1} -le ${arg2} ]]
```

* True, wenn arg1 **größer als** arg2´ist

```bash
[[ ${arg1} -gt ${arg2} ]]
```

* True, wenn arg1 **größer oder gleich** arg2 ist

```bash
[[ ${arg1} -ge ${arg2} ]]
```

Als Randnotiz, arg1 und arg2 können sowohl positiv als auch negativ sein.

Wie in anderen Programmiersprachen auch, kann man auch `AND` & `OR` verwenden

```bash
[[ test_case_1 ]] && [[ test_case_2 ]] # Und/And
[[ test_case_1 ]] || [[ test_case_2 ]] # Oder/Or
```

## Exit status operatoren

* True, wenn der Befehl ohne erfolgreich ohne Fehler war

```bash
[[ $? -eq 0 ]]
```

* True, wenn der Befehl nicht erfolgreich war und Fehler aufwies

```bash
[[ $? -gt 0 ]]
```
