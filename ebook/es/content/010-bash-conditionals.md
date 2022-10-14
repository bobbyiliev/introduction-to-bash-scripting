# Condicionales de Bash

En la última sección, hemos cubierto algunas de las expresiones condicionales más populares. Ahora podemos usarlas con sentencias condicionales estándar como `if`, `if-else` y `switch case`.

## Sentencia If

El formato de una sentencia `if` en Bash es el siguiente:

```bash
if [[ condicion ]]
then
    <comandos>
fi
```

Aquí hay un ejemplo rápido que le pedirá que introduzca su nombre en caso de que lo haya dejado vacío:

```bash
#!/bin/bash

# Ejemplo de sentencia if en Bash

read -p "¿Cuál es su nombre? " nombre

if [[ -z ${nombre} ]]
then
    echo "¡Por favor, escriba su nombre!"
fi
```

## Sentencia If Else

Con una sentencia `if-else`, puede especificar una acción en caso de que la condición de la sentencia `if` no se cumpla. Podemos combinar esto con las expresiones condicionales de la sección anterior de la siguiente manera:

```bash
#!/bin/bash

# Ejemplo de sentencia if en Bash

read -p "¿Cuál es su nombre? " nombre

if [[ -z ${nombre} ]]
then
    echo "¡Por favor, introduzca su nombre!"
else
    echo "Hola ${nombre}"
fi
```

Puede utilizar la sentencia if anterior con todas las expresiones condicionales de los capítulos anteriores:

```bash
#!/bin/bash

admin="devdojo"

read -p "Introduzca su nombre de usuario " usuario

# Comprueba si el nombre de usuario proporcionado es el del administrador

if [[ "${usuario}" == "${admin}" ]] ; then
    echo "¡Usted es el usuario administrador!"
else
    echo "¡Usted NO es el usuario administrador!"
fi
```

Aquí hay otro ejemplo de una sentencia `if` que comprobaría su actual `ID de usuario` y no le permitiría ejecutar el script como el usuario `root`:

```bash
#!/bin/bash

if (( $EUID == 0 )); then
    echo "Por favor, no ejecutar como usuario root"
    exit
fi
```

Si pone esto encima de su script saldría en caso de que el EUID sea 0 y no ejecutaría el resto del script. Esto fue discutido en [el foro de la comunidad de DigitalOcean](https://www.digitalocean.com/community/questions/how-to-check-if-running-as-root-in-a-bash-script).

También puede probar múltiples condiciones con una sentencia `if`. En este ejemplo queremos asegurarnos de que el usuario no es ni el usuario administrador ni el usuario root para asegurarnos de que el script es incapaz de causar demasiado daño. Usaremos el operador `or` en este ejemplo, señalado por `||`. Esto significa que cualquiera de las condiciones debe ser verdadera. Si usáramos el operador `and` de `&&` entonces ambas condiciones tendrían que ser verdaderas.

```bash
#!/bin/bash

admin="devdojo"

read -p "Introduzca su nombre de usuario " usuario

# Comprueba si el nombre de usuario proporcionado es el del administrador

if [[ "${usuario}" != "${admin}" ]] || [[ $EUID != 0 ]] ; then
    echo "Usted no es el usuario admin o root ¡pero por favor tenga cuidado!"
else
    echo "¡Usted es el usuario administrador! ¡Esto podría ser muy destructivo!"
fi
```

Si tiene múltiples condiciones y escenarios, entonces puede usar la sentencia `elif` con las sentencias `if` y `else`.

```bash
#!/bin/bash

read -p "Introduzca un número: " num

if [[ $num -gt 0 ]] ; then
    echo "El número es positivo"
elif [[ $num -lt 0 ]] ; then
    echo "El número es negativo"
else
    echo "El número es 0"
fi
```

## Sentencias switch case

Al igual que en otros lenguajes de programación, puede utilizar una sentencia `case` para simplificar las condiciones complejas cuando hay varias opciones diferentes. Así, en lugar de usar varias sentencias `if`, e `if-else`, puede usar una sola sentencia `case`.

La sintaxis de la sentencia `case` de Bash tiene el siguiente aspecto:

```bash
case $alguna_variable in

  patrón_1)
    comandos
    ;;

  patrón_2| patrón_3)
    comandos
    ;;

  *)
    comandos por defecto
    ;;
esac
```

Un rápido resumen de la estructura:

* Todas las sentencias `case` comienzan con la palabra clave `case`.
* Al igual que la palabra clave `case`, necesita especificar una variable o una expresión seguida de la palabra clave `in`.
* Después de eso, tiene sus patrones `case`, donde necesita usar `)` para identificar el final del patrón.
* Puede especificar múltiples patrones divididos por una tubería: `|`.
* Después del patrón, usted especifica los comandos que le gustaría que se ejecutaran en caso de que el patrón coincida con la variable o la expresión que ha especificado.
* Todas las cláusulas deben terminar añadiendo `;;` al final.
* Puede tener una sentencia por defecto añadiendo un `*` como patrón.
* Para cerrar la sentencia `case`, utilice la palabra clave `esac` (case escrito al revés).

Este es un ejemplo de una sentencia `case` de Bash:

```bash
#!/bin/bash

read -p "Introduzca el nombre de su marca de automóvil: " automovil

case $automovil in

  Tesla)
    echo -n "La fábrica de automóviles de ${automovil} está en EE.UU.".
    ;;

  BMW | Mercedes | Audi | Porsche)
    echo -n "La fábrica de automóviles de ${automovil} está en Alemania".
    ;;

  Toyota | Mazda | Mitsubishi | Subaru)
    echo -n "La fábrica de automóviles de ${automovil} está en Japón".
    ;;

  *)
    echo -n "${automovil} es una marca de automóviles desconocida."
    ;;

esac
```

Con este script, pedimos al usuario que introduzca el nombre de una marca de coche como Telsa, BMW, Mercedes, etc.

A continuación, con una sentencia `case`, comprobamos el nombre de la marca y si coincide con alguno de nuestros patrones, imprimimos la ubicación de la fábrica.

Si el nombre de la marca no coincide con ninguna de nuestras sentencias `case`, mostraremos nuestro mensaje por defecto: `es una marca de automóviles desconocida`.

## Conclusión

Le aconsejo intentar modificar el script y jugar con él un poco ¡así puede practicar lo que ha aprendido en los últimos dos capítulos!

Para más ejemplos de sentencias `case` de Bash, asegúrese de ir al capítulo 16, donde crearemos un menú interactivo en Bash usando sentencias `case` para procesar la entrada del usuario.

