# Variables de bash

Como en cualquier otro lenguaje de programación, también puedes utilizar variables en Bash Scripting. Sin embargo, no existen tipos de datos y una variable en Bash puede contener tanto números como caracteres.

Para asignar un valor a una variable, todo lo que necesitas hacer es usar el signo `=`:

```golpecito
nombre="DevDojo"
```

>{aviso} como nota importante, no puede tener espacios antes y después del signo `=`.

Después de eso, para acceder a la variable, debe usar `$` y hacer referencia a ella como se muestra a continuación:

```golpecito
eco $ nombre
```

No es necesario colocar el nombre de la variable entre llaves, pero se considera una buena práctica y le recomendaría que las utilice siempre que pueda:

```golpecito
eco ${nombre}
```

El código anterior generaría: `DevDojo` ya que este es el valor de nuestra variable `name`.

A continuación, actualicemos nuestro script `devdojo.sh` e incluyamos una variable en él.

Nuevamente, puedes abrir el archivo `devdojo.sh` con tu editor de texto favorito, aquí estoy usando nano para abrir el archivo:

```golpecito
nano devdojo.sh
```

Agregando nuestra variable `nombre` aquí en el archivo, con un mensaje de bienvenida. Nuestro archivo ahora se ve así:

```golpecito
#!/bin/bash

nombre="DevDojo"

echo "Hola $nombre"
```

Guárdelo y ejecute el archivo usando el siguiente comando:

```golpecito
./devdojo.sh
```

Verá el siguiente resultado en su pantalla:

```golpecito
Hola DevDojo
```

Aquí hay un resumen del script escrito en el archivo:

* `#!/bin/bash` - Al principio, especificamos nuestro shebang.
* `name=DevDojo` - Luego, definimos una variable llamada `name` y le asignamos un valor.
* `echo "Hola $name"` - Finalmente, mostramos el contenido de la variable en la pantalla como mensaje de bienvenida usando `echo`

También puede agregar múltiples variables en el archivo como se muestra a continuación:

```golpecito
#!/bin/bash

nombre="DevDojo"
saludo="Hola"

echo "$saludo $nombre"
```

Guarde el archivo y ejecútelo nuevamente:

```golpecito
./devdojo.sh
```

Verá el siguiente resultado en su pantalla:

```golpecito
Hola DevDojo
```
Tenga en cuenta que no es necesario agregar punto y coma `;` al final de cada línea. Funciona en ambos sentidos, ¡un poco como otros lenguajes de programación como JavaScript!


También puede agregar variables en la línea de comando fuera del script Bash y pueden leerse como parámetros:

```golpecito
./devdojo.sh ¡Bobby amigo!
```
Este script toma dos parámetros `Bobby` y `buddy!` separados por espacios. En el archivo `devdojo.sh` tenemos lo siguiente:

```golpecito
#!/bin/bash

echo "Hola" $1

```
`$1` es la primera entrada (`Bobby`) en la línea de comando. De manera similar, podría haber más entradas y todas ellas están referenciadas por el signo `$` y su respectivo orden de entrada. Esto significa que se hace referencia a `buddy!` usando `$2`. Otro método útil para leer variables es `$@` que lee todas las entradas.

Ahora cambiemos el archivo `devdojo.sh` para comprenderlo mejor:

```golpecito
#!/bin/bash

echo "Hola" $1

# $1: primer parámetro

echo "Hola" $2

# $2: segundo parámetro

echo "Hola" $@

#$@: todos
```
La salida para:

```golpecito
./devdojo.sh ¡Bobby amigo!
```
Seria el siguiente:

```golpecito
Hola bobby
¡Hola amigo!
¡Hola amigo Bobby!
```