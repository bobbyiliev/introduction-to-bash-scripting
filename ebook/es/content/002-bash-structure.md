# Estructura de Bash

Comencemos creando un nuevo archivo con extensión `.sh`. Como ejemplo, podríamos crear un archivo llamado `devdojo.sh`.

Para crear ese archivo, puede usar el comando `touch`:

```bash
touch devdojo.sh
```

O en vez de eso, puede usar su editor de texto:

```bash
nano devdojo.sh
```

Para ejecutar/correr un archivo de script bash con el intérprete de shell bash, la primera línea de un archivo de script debe indicar la ruta absoluta al ejecutable bash:

```bash
#!/bin/bash
```

Esto también se llama [Shebang](https://es.wikipedia.org/wiki/Shebang).

Todo lo que hace el shebang es indicar al sistema operativo que ejecute el script con el ejecutable `/bin/bash`.
