# Condicionales de bash

En la última sección, cubrimos algunas de las expresiones condicionales más populares. Ahora podemos usarlos con declaraciones condicionales estándar como declaraciones `if`, `if-else` y `switch case`.

## Si declaración

El formato de una declaración "if" en Bash es el siguiente:

```golpecito
si [[ alguna_prueba ]]
entonces
     <comandos>
fi
```

Aquí hay un ejemplo rápido que le pedirá que ingrese su nombre en caso de que lo haya dejado vacío:

```golpecito
#!/bin/bash

# Ejemplo de declaración Bash if

leer -p "¿Cuál es tu nombre?" nombre

si [[ -z ${nombre} ]]
entonces
     echo "¡Por favor ingresa tu nombre!"
fi
```

## Si no, declaración

Con una declaración `if-else`, puede especificar una acción en caso de que la condición en la declaración `if` no coincida. Podemos combinar esto con las expresiones condicionales de la sección anterior de la siguiente manera:

```golpecito
#!/bin/bash

# Ejemplo de declaración Bash if

leer -p "¿Cuál es tu nombre?" nombre

si [[ -z ${nombre} ]]
entonces
     echo "¡Por favor ingresa tu nombre!"
demás
     echo "Hola ${nombre}"
fi
```

Puede utilizar la declaración if anterior con todas las expresiones condicionales de los capítulos anteriores:

```golpecito
#!/bin/bash

admin="devdojo"

leer -p "¿Ingrese su nombre de usuario?" nombre de usuario

# Comprobar si el nombre de usuario proporcionado es el administrador

if [[ "${nombre de usuario}" == "${admin}" ]] ; entonces
     echo "¡Tú eres el usuario administrador!"
demás
     echo "¡NO eres el usuario administrador!"
fi
```

Aquí hay otro ejemplo de una declaración `if` que verificaría su `ID de usuario` actual y no le permitiría ejecutar el script como usuario `root`:

```golpecito
#!/bin/bash

si (( $EUID == 0 )); entonces
     echo "Por favor no ejecutar como root"
     salida
fi
```

Si coloca esto encima de su secuencia de comandos, se cerrará en caso de que el EUID sea 0 y no ejecutará el resto de la secuencia de comandos. Esto se discutió en [el foro de la comunidad DigitalOcean] (https://www.digitalocean.com/community/questions/how-to-check-if-running-as-root-in-a-bash-script).

También puedes probar múltiples condiciones con una declaración "if". En este ejemplo queremos asegurarnos de que el usuario no sea ni el usuario administrador ni el usuario root para garantizar que el script no pueda causar demasiado daño. Usaremos el operador `o` en este ejemplo, marcado con `||`. Esto significa que cualquiera de las condiciones debe ser cierta. Si usáramos el operador `y` de `&&` entonces ambas condiciones tendrían que ser verdaderas.

```golpecito
#!/bin/bash

admin="devdojo"

leer -p "¿Ingrese su nombre de usuario?" nombre de usuario

# Comprobar si el nombre de usuario proporcionado es el administrador

if [[ "${nombre de usuario}" != "${admin}" ]] || [[ $EUID != 0 ]] ; entonces
     echo "Usted no es el administrador ni el usuario root, ¡pero tenga cuidado!"
demás
     echo "¡Tú eres el usuario administrador! ¡Esto podría ser muy destructivo!"
fi
```

Si tiene varias condiciones y escenarios, puede usar la declaración "elif" con las declaraciones "if" y "else".

```golpecito
#!/bin/bash

leer -p "Ingrese un número: " num

si [[ $num -gt 0 ]] ; entonces
     echo "El número es positivo"
elif [[ $num -lt 0 ]] ; entonces
     echo "El número es negativo"
demás
     echo "El número es 0"
fi
```

## Cambiar declaraciones de caso

Como en otros lenguajes de programación, puede utilizar una declaración "case" para simplificar condicionales complejos cuando hay varias opciones diferentes. Entonces, en lugar de usar algunas declaraciones `if` y `if-else`, podría usar una sola declaración `case`.

La sintaxis de la declaración Bash `case` se ve así:

```golpecito
caso $alguna_variable en

   patrón_1)
     comandos
     ;;

   patrón_2| patrón_3)
     comandos
     ;;

   *)
     comandos predeterminados
     ;;
esac
```

Un rápido resumen de la estructura:

* Todas las declaraciones "case" comienzan con la palabra clave "case".
* En la misma línea que la palabra clave `case`, debe especificar una variable o una expresión seguida de la palabra clave `in`.
* Después de eso, tienes tus patrones `case`, donde necesitas usar `)` para identificar el final del patrón.
* Puede especificar múltiples patrones divididos por una tubería: `|`.
* Después del patrón, especifica los comandos que le gustaría que se ejecuten en caso de que el patrón coincida con la variable o la expresión que haya especificado.
* Todas las cláusulas deben terminar agregando `;;` al final.
* Puede tener una declaración predeterminada agregando un `*` como patrón.
* Para cerrar la declaración `case`, use la palabra clave `esac` (caso escrito al revés).

A continuación se muestra un ejemplo de una declaración de "caso" de Bash:

```golpecito
#!/bin/bash

leer -p "Ingrese el nombre de la marca de su automóvil: " automóvil

caso $car en

   tesla)
     echo -n "La fábrica de automóviles de ${car} está en EE. UU."
     ;;

   BMW | mercedes | Audi | Porsche)
     echo -n "La fábrica de automóviles de ${car} está en Alemania".
     ;;

   Toyota | Mazda | Mitsubishi | Subaru)
     echo -n "La fábrica de automóviles de ${car} está en Japón".
     ;;

   *)
     echo -n "${car} es una marca de automóvil desconocida"
     ;;

esac
```

Con este script, le pedimos al usuario que ingrese el nombre de una marca de automóvil como Telsa, BMW, Mercedes, etc.

Luego, con una declaración de "caso", verificamos el nombre de la marca y si coincide con alguno de nuestros patrones y, de ser así, imprimimos la ubicación de la fábrica.

Si el nombre de la marca no coincide con ninguna de nuestras declaraciones de "caso",