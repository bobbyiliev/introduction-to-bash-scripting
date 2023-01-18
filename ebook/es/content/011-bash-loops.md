# Bucles en Bash

Como en cualquier otro lenguaje, los bucles son muy convenientes. Con Bash puede usar bucles `for`, bucles `while` y bucles `until`.

## Bucles for

Esta es la estructura de un bucle for:

```bash
for var in ${lista}
do
    comandos
done
```

Ejemplo:

```bash
#!/bin/bash

usuarios="devdojo bobby tony"

for usuario in ${usuarios}
do
    echo "${user}"
done
```

Un rápido resumen del ejemplo:

* Primero, especificamos una lista de usuarios y almacenamos el valor en una variable llamada `$usuarios`.
* Después, iniciamos nuestro bucle `for` con la palabra clave `for`.
* Luego definimos una nueva variable que representaría cada elemento de la lista que damos. En nuestro caso, definimos una variable llamada `usuario`, que representaría a cada usuario de la variable `$usuarios`.
* Luego especificamos la palabra clave `in` seguida de nuestra lista que recorreremos en bucle.
* En la siguiente línea, usamos la palabra clave `do`, que indica lo que haremos en cada iteración del bucle.
* Luego especificamos los comandos que queremos ejecutar.
* Finalmente, cerramos el bucle con la palabra clave `done`.

También puede utilizar `for` para procesar una serie de números. Por ejemplo, esta es una forma de hacer un bucle del 1 al 10:

```bash
#!/bin/bash

for num in {1..10}
do
    echo ${num}
done
```

## Bucles while

La estructura de un bucle while es bastante similar a la del bucle `for`:

```bash
while [[ condición ]]
do
    comandos
done
```

Este es un ejemplo de un bucle `while`:

```bash
#!/bin/bash

contador=1
while [[ $contador -le 10 ]]
do
    echo $contador
    ((contador++))
done
```

Primero, especificamos una variable contador y la pusimos a `1`, luego dentro del bucle, añadimos el contador usando esta declaración `((contador++))`. De esta manera, nos aseguramos de que el bucle se ejecutará sólo 10 veces y no se ejecutará para siempre. El bucle se completará tan pronto como el contador se convierta en 10, ya que esto es lo que hemos establecido como condición: `while [[ $contador -le 10 ]]`.

Vamos a crear un script que pregunte al usuario por su nombre y no permita una entrada vacía:

```bash
#!/bin/bash

read -p "¿Cuál es su nombre? " nombre

while [[ -z ${nombre} ]]
do
    echo "Su nombre no puede estar en blanco. Por favor, introduzca un nombre válido"
    read -p "Ingrese su nombre de nuevo " nombre
done

echo "Hola ${nombre}"
```

Ahora, si ejecuta lo anterior y simplemente pulsa enter sin proporcionar información, el bucle se ejecutará de nuevo y le preguntará su nombre una y otra vez hasta que proporcione alguna información.

## Bucles Until

La diferencia entre los bucles `until` y `while` es que el bucle `until` ejecutará los comandos dentro del bucle hasta que la condición sea verdadera.

Estructura:

```bash
until [[ condición ]]
do
    comandos
done
```

Ejemplo:

```bash
#!/bin/bash

contador=1
until [[ $contador -gt 10 ]]
do
    echo $contador
    ((contador++))
done
```

## Continue y Break
Al igual que con otros lenguajes, puede usar `continue` y `break` con tus scripts bash también:

* `continue` le dice a su script bash que detenga la iteración actual del bucle y comience la siguiente iteración.

La sintaxis de la sentencia continue es la siguiente:

```bash
continue [n]
```

El argumento [n] es opcional y puede ser mayor o igual a 1. Cuando se da [n], se reanuda el n-ésimo bucle que lo rodea. continue 1 es equivalente a continue.

```bash
#!/bin/bash

for i in 1 2 3 4 5
do
    if [[ $i -eq 2 ]] 
    then
        echo "saltando el número 2"
        continue
    fi
    echo "i es igual a $i"
done
```

También podemos utilizar el comando continue de forma similar al comando break para controlar múltiples bucles.


* `break` le dice a su script bash que termine el bucle directamente.

La sintaxis de la sentencia break tiene la siguiente forma:

```bash
break [n]
```
[n] es un argumento opcional y debe ser mayor o igual a 1. Cuando se proporciona [n], se sale del n-ésimo bucle que lo encierra. break 1 es equivalente a break.

Ejemplo:

```bash
#!/bin/bash

num=1
while [[ $num -lt 10 ]] 
do
    if [[ $num -eq 5 ]] 
    then
        break
    fi
    ((num++))
done
echo "Bucle completado"
```

También podemos usar el comando break con múltiples bucles. Si queremos salir del bucle actual, ya sea interno o externo, simplemente usamos break, pero si estamos en el bucle interno y queremos salir del bucle externo, usamos break 2.

Ejemplo:

```bash
#!/bin/bash

for (( a = 1; a < 10; a++ ))
do
    echo "bucle externo: $a"
    for (( b = 1; b < 100; b++ ))
    do
        if [[ $b -gt 5 ]] 
        then
            break 2
        fi
    echo "bucle interno: $b "
    done
done
```

El script bash comenzará con a=1 y pasará al bucle interno y cuando llegue a b=5, romperá el bucle externo.
Podemos usar sólo break en lugar de break 2, para romper el bucle interno y ver cómo afecta a la salida.

