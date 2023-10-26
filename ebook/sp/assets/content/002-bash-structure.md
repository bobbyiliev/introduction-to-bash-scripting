# Estructura de bash

Comencemos creando un nuevo archivo con una extensión `.sh`. Como ejemplo, podríamos crear un archivo llamado `devdojo.sh`.

Para crear ese archivo, puede usar el comando `touch`:

```golpecito
toque devdojo.sh
```

O puedes usar tu editor de texto en su lugar:

```golpecito
nano devdojo.sh
```

Para ejecutar/ejecutar un archivo de script bash con el intérprete de shell bash, la primera línea de un archivo de script debe indicar la ruta absoluta al ejecutable bash:

```golpecito
#!/bin/bash
```

Esto también se llama [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)).

Todo lo que hace el shebang es indicarle al sistema operativo que ejecute el script con el ejecutable `/bin/bash`.