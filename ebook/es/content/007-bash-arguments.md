# Argumentos en Bash

Puede pasar argumentos a su script de shell cuando lo ejecuta. Para pasar un argumento, solo necesita escribirlo justo después del nombre de su script. Por ejemplo:

```bash
./devdojo.com su_argumento
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

Guarde el archivo y hágalo ejecutable:

```bash
chmod +x argumentos.sh
```

Luego ejecute el archivo y pase **3** argumentos:

```bash
./argumentos.sh perro gato pájaro
```

El resultado debería ser:

```bash
Argumento uno es perro
Argumento dos es gato
Argumento tres es pájaro
```

Para hacer referencia a todos los argumentos, puede usar `$@`:

```bash
#!/bin/bash

echo "Todos los argumentos: $@"
```

Si ejecuta el script nuevamente:

```bash
./argumentos.sh perro gato pájaro
```

El resultado debería ser:

```
Todos los argumentos: perro gato pájaro
```

Otra cosa que debe tener en cuenta es que `$0` se usa para hacer referencia al script en sí.

Esta es una excelente manera de autodestruir el archivo si lo necesita o simplemente obtener el nombre del script.

Por ejemplo, creemos un script que imprima el nombre del archivo y lo elimine después de eso:

```bash
#!/bin/bash

echo "El nombre del archivo es: $0 y se va a autoeliminar."

rm -f $0
```

Debe tener cuidado con la eliminación automática y asegurarse de tener una copia de seguridad de su script antes de eliminarlo automáticamente.

