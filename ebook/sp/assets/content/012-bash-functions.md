# Funciones de bash

Las funciones son una excelente manera de reutilizar código. La estructura de una función en bash es bastante similar a la de la mayoría de los lenguajes:

```golpecito
función nombre_función() {
     tus_comandos
}
```

También puedes omitir la palabra clave `function` al principio, lo que también funcionaría:

```golpecito
nombre de la función() {
     tus_comandos
}
```

Prefiero ponerlo allí para una mejor legibilidad. Pero es una cuestión de preferencia personal.

Ejemplo de "¡Hola mundo!" función:

```golpecito
#!/bin/bash

función hola() {
     echo "¡Función Hola Mundo!"
}

Hola
```

>{aviso} Una cosa a tener en cuenta es que no debes agregar paréntesis cuando llamas a la función.

Pasar argumentos a una función funciona de la misma manera que pasar argumentos a un script:

```golpecito
#!/bin/bash

función hola() {
     echo "¡Hola $1!"
}

Hola DevDojo
```

Las funciones deben tener comentarios que mencionen la descripción, las variables globales, los argumentos, los resultados y los valores devueltos, si corresponde.

```golpecito
#######################################
# Descripción: Función Hola
# Globales:
#   Ninguno
# Argumentos:
# Argumento de entrada único
# Salidas:
# Valor del argumento de entrada
# Devoluciones:
# 0 si tiene éxito, distinto de cero en caso de error.
#######################################
función hola() {
     echo "¡Hola $1!"
}
```

¡En los próximos capítulos usaremos mucho las funciones!