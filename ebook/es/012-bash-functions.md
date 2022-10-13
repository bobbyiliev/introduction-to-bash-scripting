# Funciones de Bash

Las funciones son una gran manera de reutilizar el código. La estructura de una función en bash es bastante similar a la de la mayoría de los lenguajes:

```bash
function nombre_de_la_funcion() {
    comandos
}
```

También puede omitir la palabra clave `function` al principio, lo que también funcionaría:

```bash
nombre_de_la_funcion() {
    comandos
}
```

Yo prefiero ponerlo así para una mejor legibilidad. Pero es una cuestión de preferencia personal.

Ejemplo de una función "¡Hola Mundo!":

```bash
#!/bin/bash

function hola() {
    echo "¡Función Hola Mundo!"
}

hola
```

>{notice} Una cosa a tener en cuenta es que no debe añadir el paréntesis cuando llame a la función.

Pasar argumentos a una función funciona de la misma manera que pasar argumentos a un script:

```bash
#!/bin/bash

function hola(){
    echo "¡Hola $1!"
}

hola DevDojo
```

Las funciones deberían tener comentarios que mencionen la descripción, las variables globales, los argumentos, las salidas y los valores devueltos, si corresponde

```bash
#######################################
# Descripción: Función hola
# Globales:
#   Ninguno
# Entradas:
#   Un argumento de entrada
# Salidas:
#   Valor del argumento de entrada
# Devuelve:
#   0 si tiene éxito, distinto de cero en caso de error.
#######################################
function hola(){
    echo "¡Hola $1!"
}
```

¡En los próximos capítulos utilizaremos mucho las funciones!

