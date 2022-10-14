# Variables en Bash

Como en cualquier otro lenguaje de programación, también puede usar variables en Bash scripting. Sin embargo, no hay tipos de datos, y una variable en Bash puede contener tanto números como caracteres.

Para asignar un valor a una variable, todo lo que necesita hacer es usar el signo `=`:

```bash
nombre="DevDojo"
```

>{notice} como nota importante, no puede haber espacios antes y después del signo `=`.

Después de eso, para acceder a la variable, debe utilizar el `$` y la referencia como se muestra debajo:

```bash
echo $nombre
```

Envolver el nombre de la variable entre llaves no es obligatorio, pero se considera una buena práctica, y le aconsejo que las use siempre que pueda:

```bash
echo ${nombre}
```

El código anterior daría como resultado `DevDojo` ya que este es el valor de nuestra variable `nombre`.

A continuación, vamos a actualizar nuestro script `devdojo.sh` e incluir una variable en él.

De nuevo, puede abrir el archivo `devdojo.sh` con su editor de texto favorito, yo estoy usando nano aquí para abrir el archivo:

```bash
nano devdojo.sh
```

Añadiendo nuestra variable `nombre` aquí en el archivo, con un mensaje de bienvenida. Nuestro archivo ahora se ve así:

```bash
#!/bin/bash

nombre="DevDojo"

echo "Hola $nombre"
```

Guárdelo y ejecute el archivo con el siguiente comando:

```bash
./devdojo.sh
```

Verá la siguiente salida en su pantalla:

```bash
Hola DevDojo
```

Aquí está un resumen del script escrito en el archivo:

* `#!/bin/bash` - Al principio, especificamos nuestro shebang.
* `nombre=DevDojo` - Luego, definimos una variable llamada `nombre` y le asignamos un valor.
* `echo "Hola $nombre"` - Finalmente, mostramos el contenido de la variable en la pantalla como un mensaje de bienvenida usando `echo`.

También puede añadir múltiples variables en el archivo como se muestra debajo:

```bash
#!/bin/bash

nombre="DevDojo"
saludo="Hola"

echo "$saludo $nombre"
```

Guarde el archivo y ejecútelo de nuevo:

```bash
./devdojo.sh
```

Verá la siguiente salida en su pantalla:

```bash
Hola DevDojo
```

Tenga en cuenta que no necesariamente tiene que añadir punto y coma `;` al final de cada línea. Funciona de ambas maneras, un poco como otros lenguajes de programación como JavaScript.
