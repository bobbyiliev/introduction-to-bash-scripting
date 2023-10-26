# Bucles de bash

Como ocurre con cualquier otro idioma, los bucles son muy convenientes. Con Bash puedes usar bucles `for`, `` while` y `hasta`.

## Para bucles

Aquí está la estructura de un bucle for:

```golpecito
para var en ${lista}
hacer
     tus_comandos
hecho
```

Ejemplo:

```golpecito
#!/bin/bash

usuarios="devdojo bobby tony"

para usuario en ${users}
hacer
     eco "${usuario}"
hecho
```

Un resumen rápido del ejemplo:

* Primero, especificamos una lista de usuarios y almacenamos el valor en una variable llamada `$usuarios`.
* Después de eso, iniciamos nuestro bucle `for` con la palabra clave `for`.
* Luego definimos una nueva variable que representaría cada elemento de la lista que le damos. En nuestro caso, definimos una variable llamada `usuario`, que representaría a cada usuario de la variable `$users`.
* Luego especificamos la palabra clave `in` seguida de nuestra lista que recorreremos.
* En la siguiente línea, usamos la palabra clave `do`, que indica qué haremos para cada iteración del bucle.
* Luego especificamos los comandos que queremos ejecutar.
* Finalmente, cerramos el ciclo con la palabra clave `done`.

También puedes usar `for` para procesar una serie de números. Por ejemplo, aquí hay una forma de recorrer del 1 al 10:

```golpecito
#!/bin/bash

para número en {1..10}
hacer
     eco ${numero}
hecho
```

## bucles while

La estructura de un bucle while es bastante similar a la del bucle "for":

```golpecito
mientras [tu_condición]
hacer
     tus_comandos
hecho
```

A continuación se muestra un ejemplo de un bucle " while ":

```golpecito
#!/bin/bash

contador=1
mientras [[ $counter -le 10 ]]
hacer
     eco $ contador
     ((contra++))
hecho
```

Primero, especificamos una variable de contador y la configuramos en `1`, luego, dentro del bucle, agregamos un contador usando esta declaración aquí: `((counter++))`. De esa manera, nos aseguramos de que el ciclo se ejecute solo 10 veces y no para siempre. El ciclo se completará tan pronto como el contador llegue a 10, ya que esto es lo que hemos establecido como condición: ` while [[ $counter -le 10 ]]`.

Creemos un script que le pregunte al usuario su nombre y no permita una entrada vacía:

```golpecito
#!/bin/bash

leer -p "¿Cuál es tu nombre?" nombre

mientras [[ -z ${nombre} ]]
hacer
     echo "Su nombre no puede estar en blanco. ¡Ingrese un nombre válido!"
     leer -p "¿Ingresa tu nombre otra vez?" nombre
hecho

echo "Hola ${nombre}"
```

Ahora, si ejecuta lo anterior y simplemente presiona Intro sin proporcionar información, el bucle se ejecutará nuevamente y le pedirá su nombre una y otra vez hasta que realmente proporcione alguna información.

## Hasta bucles

La diferencia entre los bucles `hasta` y `` while` es que el bucle `hasta` ejecutará los comandos dentro del bucle hasta que la condición se vuelva verdadera.

Estructura:

```golpecito
hasta [[ tu_condición ]]
hacer
     tus_comandos
hecho
```

Ejemplo:

```golpecito
#!/bin/bash

contar=1
hasta [[ $count -gt 10 ]]
hacer
     eco $ cuenta
     ((cuenta++))
hecho
```

## Continuar y romper
Al igual que con otros lenguajes, también puedes usar "continuar" y "romper" con tus scripts bash:

* `continue` le dice a su script bash que detenga la iteración actual del bucle y comience la siguiente iteración.

La sintaxis de la declaración de continuación es la siguiente:

```golpecito
continuar [n]
```

El argumento [n] es opcional y puede ser mayor o igual a 1. Cuando se proporciona [n], se reanuda el enésimo bucle envolvente. continuar 1 es equivalente a continuar.

```golpecito
#!/bin/bash

para yo en 1 2 3 4 5
hacer
     si [[ $i –eq 2 ]]
     entonces
         echo "omitiendo el número 2"
     continuar
     fi
     echo "i es igual a $i"
hecho
```

También podemos usar el comando continuar de manera similar al comando romper para controlar múltiples bucles.

* `break` le dice a su script bash que finalice el ciclo de inmediato.

La sintaxis de la declaración de interrupción toma la siguiente forma:

```golpecito
descanso [n]
```
[n] es un argumento opcional y debe ser mayor o igual a 1. Cuando se proporciona [n], se sale del enésimo bucle circundante. break 1 es equivalente a break.

Ejemplo:

```golpecito
#!/bin/bash

número=1
mientras [[ $num –lt 10 ]]
hacer
     si [[ $num –eq 5 ]]
     entonces
         romper
     fi
     ((núm++))
hecho
echo "Bucle completado"
```

También podemos usar el comando break con múltiples bucles. Si queremos salir del bucle de trabajo actual, ya sea interno o externo, simplemente usamos break, pero si estamos en el bucle interno y queremos salir del bucle externo, usamos break 2.

Ejemplo:

```golpecito
#!/bin/bash

para (( a = 1; a < 10; a++ ))
hacer
     echo "bucle externo: $a"
     para (( b = 1; b < 100; b++ ))
     hacer
         si [[ $b –gt 5 ]]
         entonces
             descanso 2
         fi
     echo "Bucle interno: $b "
     hecho
hecho
```

El script bash comenzará con a=1 y se moverá al bucle interno y cuando llegue a b=5, romperá el bucle externo.
Podemos usar break only en lugar de break 2, para romper el bucle interno y ver cómo afecta la salida.