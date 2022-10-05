# Argumentos en Bash

Puedes pasar argumentos a tu script de shell cuando lo ejecutas. Para pasar un argumento, solo necesitas escribirlo justo después del nombre de tu script. Por ejemplo:

```bash
./devdojo.com tu_argumento
```

En el script, podemos usar `$1` para hacer referencia al primer argumento que especificamos.

Si pasamos un segundo argumento, estaría disponible como `$2` y así sucesivamente.

Vamos a crear un script corto llamado `argumentos.sh` como ejemplo:

```bash
#!/bin/bash

echo "Argumento uno es $1"
echo "Argumento dos es $2"
echo "Argumento tres es $3"
```

Guarde el archivo y házlo ejecutable:

```bash
chmod +x argumentos.sh
```

Luego ejecuta el archivo y pasa **3** argumentos:

```bash
./argumentos.sh perro gato pájaro
```

El resultado debería ser:

```bash
Argumento uno es perro
Argumento dos es gato
Argumento tres es pájaro
```

Para hacer referencia a todos los argumentos, puedes usar `$@`:

```bash
#!/bin/bash

echo "Todos los argumentos: $@"
```

Si ejecutas el script nuevamente:

```bash
./argumentos.sh perro gato pájaro
```

El resultado debería ser:

```
Todos los argumentos: perro gato pájaro
```

Otra cosa que debes tener en cuenta es que `$0` se usa para hacer referencia al script en sí.

Esta es una excelente manera de autodestruir el archivo si lo necesitas o simplemente obtener el nombre del script.

Por ejemplo, creemos un script que imprima el nombre del archivo y lo elimine después de eso:

```bash
#!/bin/bash

echo "El nombre del archivo es: $0 y se va a autoeliminar."

rm -f $0
```

Debes tener cuidado con la eliminación automática y asegurarte de tener una copia de seguridad de tu script antes de eliminarlo automáticamente.




