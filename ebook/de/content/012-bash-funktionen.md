# Bash Funktionen

Funktionen sind eine großartige Möglichkeit, Code wiederzuverwenden. Die Struktur einer Funktion in Bash ist den meisten Sprachen ziemlich ähnlich:

```bash
function funktion_name() {
    ihre_befehle
}
```

Sie können das Schlüsselwort „function“ auch am Anfang weglassen, was ebenfalls funktionieren würde:

```bash
funktion_name() {
    ihre_befehle
}
```

Ich bevorzuge, es dort zu platzieren, um die Lesbarkeit zu verbessern. Aber es ist eine Frage der persönlichen Präferenz.

Beispiel einer „Hello World!“ Funktion:

```bash
#!/bin/bash

function hello() {
    echo "Hello World Function!"
}

hello
```

> {notice} Beachten Sie, dass Sie beim Aufruf der Funktion keine Klammern hinzufügen sollten.

Die Übergabe von Argumenten an eine Funktion funktioniert auf die gleiche Weise, wie die Übergabe von Argumenten an ein Skript:

```bash
#!/bin/bash

function hello() {
    echo "Hello $1!"
}

hello DevDojo
```

Funktionen sollten Kommentare enthalten, in denen Beschreibung, globale Variablen, Argumente, Ausgaben und ggf. zurückgegebene Werte erwähnt werden. (Kommentare werden i.d.R. in Englisch verfasst, weshalb das Beispiel so beibehalten wird)

```bash
#######################################
# Description: Hello Function
# Globals:
#   None
# Arguments:
#   Single input argument
# Outputs:
#   Value of input argument
# Returns:
#   0 if successful, non-zero on error.
#######################################
function hello() {
    echo "Hello $1!"
}
```

In den nächsten Kapiteln werden wir häufig Funktionen verwenden!
