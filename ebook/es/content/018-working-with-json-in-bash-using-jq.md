# Trabaja con JSON en BASH usando jq

La herramienta de línea de comandos `jq` es un procesador de línea de comandos lígero y flexible de **JSON**. Es genial para analizar el resultado de JSON en BASH.

Una de las mejores cosas sobre `jq`es que está escrito en C portable y no tiene ninguna dependencia. Todo lo que necesitas hacer es descargar un binario único o usar un administrador de paquetes como apt e instalarlo con un único comando. 

## Planeando el script

Para el ejemplo en este tutorial usaré una REST API externa que devuelve un sencillo resultado en JSON llamado el [QuizAPI](https://quizapi.io/):

> [https://quizapi.io/](https://quizapi.io/)

Si quieres hacerlo asegúrate de conseguir una clave gratuita de la API aquí:

> [https://quizapi.io/clientarea/settings/token](https://quizapi.io/clientarea/settings/token)

La QuizAPI es gratuita para desarrolladores.

## Instalando jq

Hay muchas maneras de instalar `jq`en tu sisema. Una de las formas más directa es hacerlo usando el administrador de paquetes de tu sistema operativo.

Aqui hay una lista de comandos que podrías necesitar dependiendo de tu sistema operativo:

* Instala jq en Ubuntu/Debian:

```bash
sudo apt-get install jq
```

* Instala jq en Fedora:

```bash
sudo dnf install jq
```

* Instala jq en openSUSE:

```bash
sudo zypper install jq
```

* Instala jq en Arch:

```bash
sudo pacman -S jq
```

* Instala en Mac con Homebrew:

```bash
brew install jq
```

* Instala en Mac con MacPort:

```bash
port install jq
```

Si usas otro sistema operativo echa un vistazo a la documentación oficial en este link para más información:

> [https://stedolan.github.io/jq/download/](https://stedolan.github.io/jq/download/)

Una vez que ya tengas instalado jq revisa la versión actual con este comando:

```bash
jq --version
```

## Analizando JSON con jq

Con `jq`instalado y tu clave API de QuizAPI podemos analizar el resultado del JSON de la QuizAPI directamente en el terminal.

Primero creamos una variable que almacene la clave API:

```bash
API_KEY=YOUR_API_KEY_HERE
```

Con el fin de conseguir el resultado de uno de los endpoints de la QuizAPI puedes usar el comando curl:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10"
```

Para un resultado más específico puedes usar el generador de URL de QuizAPI:

> [https://quizapi.io/api-config](https://quizapi.io/api-config)

Después de ejecutar el comando curl el resultado que obtendrías se vería así:

![Resultado sin procesar Json](https://imgur.com/KghOfzj.png)

Puede ser dificil de leer pero gracias a la herramienta de línea de comandos de jq todo lo que necesitamos hacer es pipe del comando curl a jq y veremos un resultado con formato más agradable de JSON.

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10" | jq
```

> Observa el `| jq` al final.

En este caso el resultado debería verse así:

![bash jq formatting](https://imgur.com/ebdTtVf.png)

Ahora se ve mucho mejor! La herramienta de línea de comandos jq da formato al resultado y añade algo de agradable colorido.
 
## Obteniendo el primer elemento con jq

Digamos que solo queremos obtener el primer elemento del resultado en JSON, para conseguirlo tenemos que especificar el índice que queremos con la siguiente sintaxis:

```bash
jq .[0]
```

Si ejecutamos ahora el comando curl con pipe, otra vez, el resultado de jq .[0] sería:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10" | jq.[0]
```

Obtendrás el primer elemento como vemos aquí:

![jq obtiene el primer elemento](https://imgur.com/h9bFMAL.png)

## Obteniendo un valor para una clave específica

A veces querrías obtener el valor de una clave específica, digamos que en nuestro ejemplo de QuizAPI devuelve una lista de preguntas junto con las respuestas, descripción, etc... ¿Que pasaría si sólo quisieras obtener las preguntas y no el resto de información?

Se puede hacer de una forma bastante fácil con `jq`, sólo es necesario añadir la clave después del comando jq, sería algo así: 

```bash
jq .[].question
```

Añadiendo `.[]` a la QuizAPI nos devuelve un array y especificando el valor .question (.pregunta) le decimos que queremos obtener todos los elementos del array.

Lo que mostraría algo así:

![jq obtiene un valor por una clave específica](https://imgur.com/0701wHD.png)

Cómo puedes ver sólo obtenemos las preguntas sin el resto de valores.

## Usando jq en un script de BASH

Seguimos avanzando y creamos un pequeño script en bash el cual nos debería mostrar la siguiente información:

* Obtener sólo la primera pregunta
* Obtener todas las respuestas de esa pregunta
* Guardar las respuestas en variables
* Imprimir la pregunta y las respuestas

* Para hacer esto montamos el siguiente script:

>{aviso} asegúrate de cambiar la API_KEY por la tuya:

```bash
#!/bin/bash

##
# Hacer una llamada APi a la QuizAPI y almacenar la salida en una variable
##
output=$(curl 'https://quizapi.io/api/v1/questions?apiKey=API_KEY&limit=10' 2>/dev/null)

##
# Obtener la primera pregunta
##
output=$(echo $output | jq .[0])

##
# Obtener la pregunta
##
question=$(echo $output | jq .question)

##
# Obtener las respuestas
##

answer_a=$(echo $output | jq .answers.answer_a)
answer_b=$(echo $output | jq .answers.answer_b)
answer_c=$(echo $output | jq .answers.answer_c)
answer_d=$(echo $output | jq .answers.answer_d)

##
# imprimir la pregunta y las respuestas
##

echo "
Question: ${question}

A) ${answer_a}
B) ${answer_b}
C) ${answer_c}
D) ${answer_d}

"
```

Si ejecutas el script debería verse algo así:

![Usando jq en un script de bash](https://imgur.com/LKEsrbq.png)

Podemos ir más allá haciendolo interactivo y escogiendo la respuesta directamente en nuestro terminal.

Ya hay un script en bash que hace esto usando la QuizAPI y `jq`:

Echa un vistazo al script aquí:

* [https://github.com/QuizApi/QuizAPI-BASH/blob/master/quiz.sh](https://github.com/QuizApi/QuizAPI-BASH/blob/master/quiz.sh)

## Conclusión

La increible herramienta de linea de comandos `jq` nos da el poder de trabajar directamente con JSON en tu terminal BASH.

Así puedes facilmente interactuar con todo tipo de REST APIs en BASH.

Para más información puedes echar un vistazo a la documentación oficial aquí:

* [https://stedolan.github.io/jq/manual/](https://stedolan.github.io/jq/manual/)

Y más información de la documentación oficial de la  **QuizAPI** aquí:

* [https://quizapi.io/docs/1.0/overview](https://quizapi.io/docs/1.0/overview)

>{aviso} Este contenido ha sido publicado inicialmente en [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-work-with-json-in-bash-using-jq)