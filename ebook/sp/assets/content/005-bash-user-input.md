# Entrada de usuario Bash

Con el script anterior, definimos una variable y mostramos el valor de la variable en la pantalla con el `echo $name`.

Ahora sigamos adelante y pidamos información al usuario. Para hacerlo nuevamente, abra el archivo con su editor de texto favorito y actualice el script de la siguiente manera:

```golpecito
#!/bin/bash

eco "¿Cuál es tu nombre?"
leer nombre

echo "Hola $nombre"
echo "¡Bienvenido a DevDojo!"
```

Lo anterior solicitará al usuario una entrada y luego almacenará esa entrada como una cadena/texto en una variable.

Luego podemos usar la variable e imprimirles un mensaje.

El resultado del script anterior sería:

* Primero ejecute el script:

```golpecito
./devdojo.sh
```

* Luego, se le pedirá que ingrese su nombre:

```
¿Cómo te llamas?
Poli
```

* Una vez que haya escrito su nombre, simplemente presione Intro y obtendrá el siguiente resultado:

```
Hola bobby
¡Bienvenidos a DevDojo!
```

Para reducir el código, podríamos cambiar la primera declaración `echo` con `read -p`, el comando `read` usado con el indicador `-p` imprimirá un mensaje antes de solicitar al usuario su entrada:

```golpecito
#!/bin/bash

leer -p "¿Cuál es tu nombre?" nombre

echo "Hola $nombre"
echo "¡Bienvenido a DevDojo!"
```

¡Asegúrate de probarlo tú mismo también!