# Argumentos de Bash

Puede pasar argumentos a su script de shell cuando lo ejecute. Para pasar un argumento, sólo necesita escribirlo justo después del nombre de su script. Por ejemplo:

```golpecito
./devdojo.com tu_argumento
```

En el script, podemos usar `$1` para hacer referencia al primer argumento que especificamos.

Si pasamos un segundo argumento, estará disponible como `$2` y así sucesivamente.

Creemos un script corto llamado `arguments.sh` como ejemplo:

```golpecito
#!/bin/bash

echo "El argumento uno es $1"
echo "El argumento dos es $2"
echo "El argumento tres es $3"
```

Guarde el archivo y hágalo ejecutable:

```golpecito
chmod +x argumentos.sh
```

Luego ejecute el archivo y pase **3** argumentos:

```golpecito
./arguments.sh perro gato pájaro
```

El resultado que obtendrías sería:

```golpecito
El argumento uno es perro.
El argumento dos es el gato.
El tercer argumento es el pájaro.
```

Para hacer referencia a todos los argumentos, puede utilizar `$@`:

```golpecito
#!/bin/bash

echo "Todos los argumentos: $@"
```

Si ejecuta el script nuevamente:

```golpecito
./arguments.sh perro gato pájaro
```

Obtendrá el siguiente resultado:

```
Todos los argumentos: perro gato pájaro
```

Otra cosa que debes tener en cuenta es que "$0" se usa para hacer referencia al script en sí.

Esta es una excelente manera de crear un archivo autodestructivo si es necesario o simplemente obtener el nombre del script.

Por ejemplo, creemos una secuencia de comandos que imprima el nombre del archivo y luego lo elimine:

```golpecito
#!/bin/bash

echo "El nombre del archivo es: $0 y se eliminará automáticamente."

habitación -f $0
```

Debe tener cuidado con la autoeliminación y asegurarse de tener una copia de seguridad de su secuencia de comandos antes de autoeliminarla.