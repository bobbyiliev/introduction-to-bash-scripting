# Script de Bash: Generador de contraseñas

Es común la situación en la que necesitará generar una contraseña aleatoria que pueda usar para cualquier instalación de software, o cuando se registre en cualquier sitio web.

Hay muchas opciones con el fin de lograr esto. Puede utilizar un gestor de contraseñas, donde a menudo tiene la opción de generar una contraseña al azar, o utilizar un sitio web que puede generar la contraseña.

También puede utilizar Bash en su terminal (línea de comandos) para generar una contraseña que pueda utilizar rápidamente. Hay muchas maneras de lograrlo y me aseguraré de cubrir algunas de ellas y dejaré que elija la opción que más se adapte a sus necesidades.

## :warning: Seguridad

**Este script está pensado para practicar sus habilidades con BASH. Puede divertirse haciendo proyectos simples con BASH, pero la seguridad no es una broma, así que por favor asegúrese de no guardar sus contraseñas en texto plano en un archivo local, ni escribirlas a mano en un pedazo de papel.**

**Recomiendo encarecidamente a todo el mundo que utilice proveedores seguros y de confianza para generar y guardar las contraseñas.

## Resumen del script

Permítame primero hacer un rápido resumen de lo que nuestro script va a hacer:

1. Tendremos la opción de elegir la longitud de los caracteres de la contraseña cuando se ejecute el script.
2. El script generará entonces 5 contraseñas aleatorias con la longitud que se especificó en el paso 1

## Requisitos previos

Necesitará un terminal bash y un editor de texto. Puede usar cualquier editor de texto como vi, vim, nano o Visual Studio Code.

Estoy ejecutando el script localmente en mi portátil GNU/Linux pero si está usando un PC Windows puede hacer ssh a cualquier servidor de su elección y ejecutar el script allí.

Aunque el script es bastante simple, tener algunos conocimientos básicos de BASH le ayudará a entender mejor el script y cómo funciona.

## Generar una contraseña aleatoria
Uno de los grandes beneficios de GNU/Linux es que puede hacer un montón de cosas usando diferentes métodos. Cuando se trata de generar una cadena aleatoria de caracteres tampoco es diferente.

Puede usar varios comandos para generar una cadena de caracteres aleatorios. Cubriré algunos de ellos y proporcionaré algunos ejemplos.

- Usando el comando ```date```.
El comando ```date``` mostrará la fecha y hora actuales. Sin embargo, también podemos manipular la salida con el fin de utilizarla como contraseña generada aleatoriamente. Podemos generar un hash a partir de la fecha utilizando md5, sha o simplemente codificarlo usando base64. Estos son algunos ejemplos:

```
date | md5sum
94cb1cdecfed0699e2d98acd9a7b8f6d  -
```
Usando sha256sum:

```
date | sha256sum
30a0c6091e194c8c7785f0d7bb6e1eac9b76c0528f02213d1b6a5fbcc76ceff4  -
```
Usando base64:
```
date | base64
0YHQsSDRj9C90YMgMzAgMTk6NTE6NDggRUVUIDIwMjEK
```

- También podemos usar openssl para generar bytes pseudoaleatorios y pasar la salida por base64. Un ejemplo de salida será:
```
openssl rand -base64 10
9+soM9bt8mhdcw==
```
Tenga en cuenta que openssl podría no estar instalado en su sistema, por lo que es probable que necesite instalarlo primero para poder utilizarlo.

- La forma preferida es utilizar el generador de números pseudoaleatorios - /dev/urandom ya que está pensado para la mayoría de los propósitos criptográficos. También necesitaríamos manipular la salida usando ```tr`` para traducirla. Un ejemplo de comando es:

```
tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n 1
```
Con este comando tomamos la salida de /dev/urandom y la traducimos con ```tr`` utilizando todas las letras y dígitos e imprimimos el número de caracteres deseado.

## El script
Primero comenzamos el script con el shebang. Lo usamos para decirle al sistema operativo qué intérprete usar para analizar el resto del archivo.
```
#!/bin/bash
```
Entonces podemos continuar y pedir al usuario alguna entrada. En este caso nos gustaría saber cuántos caracteres debe tener la contraseña:

```
# Pregunta al usuario la longitud de la contraseña
clear
printf "\n"
read -p "¿Cuántos caracteres quiere que tenga la contraseña? " longitud_contrasena
printf "\n"
``` 
Generar las contraseñas y luego imprimirla para que el usuario pueda usarla.
```
# ¡Aquí es donde ocurre la magia!
# Generar una lista de 10 cadenas y cortarla al valor deseado proporcionado por el usuario.

for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${longitud_contrasena} | head -n 1); done

# Imprimir las cadenas
printf "$pass_output\n"
printf "Adiós, ${USER}\n"
```

## El script completo:
```
#!/bin/bash
#=============================================
# Generador de contraseñas con opción de login
#=============================================

# Pregunta al usuario por la longitud de la cadena
clear
printf "\n"
read -p "¿Cuántos caracteres quiere que tenga la contraseña? " longitud_contrasena
printf "\n"

# ¡Aquí es donde ocurre la magia!
# Generar una lista de 10 cadenas y cortarla al valor deseado proporcionado por el usuario.

for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${longitud_contrasena} | head -n 1); done

# Imprimir las cadenas
printf "$pass_output\n"
printf "Adiós, ${USER}\n"
```

## Conclusión
Esto es más o menos cómo se puede utilizar un simple script de bash para generar contraseñas aleatorias.

:advertencia: **Como ya se ha mencionado, por favor asegúrese de utilizar contraseñas seguras con el fin de asegurarse de que su cuenta está protegida. También, siempre que sea posible, utilice la autenticación de 2 factores, ya que esto proporcionará una capa adicional de seguridad para su cuenta.

Aunque el script funciona correctamente, espera que el usuario introduzca los datos solicitados correctamente.  Con el fin de evitar cualquier problema, tendría que hacer algunos controles más posteriores a la entrada del usuario, con el fin de asegurarse de que el script seguirá funcionando bien, incluso si la entrada proporcionada no coincide con nuestras necesidades.

## Contribución de
[Alex Georgiev](https://twitter.com/alexgeorgiev17)
