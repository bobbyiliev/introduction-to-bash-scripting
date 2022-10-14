# Entrada de Usuario en Bash

Con el script anterior, definimos una variable, y mostramos el valor de la variable en la pantalla con el `echo $nombre`.

Ahora vamos a seguir adelante y pedir al usuario que ingrese el dato en su lugar. Para hacerlo de nuevo, abra el archivo con su editor de texto favorito y actualice el script como sigue:

```bash
#!/bin/bash

echo "¿Cuál es su nombre?"
read nombre

echo "Hola $nombre"
echo "¡Bienvenido a DevDojo!"
```

Lo anterior pedirá al usuario su entrada y luego almacenará esa entrada como una cadena/texto en una variable. 

Luego podemos utilizar la variable e imprimir un mensaje de respuesta.

La salida del script anterior sería:

* Primero ejecute el script:

```bash
./devdojo.sh
```

* Luego, se le pedirá que introduzca su nombre:

```
¿Cuál es su nombre?
Bobby
```

* Una vez que haya introducido su nombre, simplemente pulse enter, y obtendrá el siguiente resultado:

```
Hola Bobby
¡Bienvenido a DevDojo!
```

Para reducir el código, podríamos cambiar la primera sentencia `echo` por el comando `read -p`, el comando `read` usado con la bandera `-p` imprimirá un mensaje antes de pedir al usuario su entrada:

```bash
#!/bin/bash

read -p "¿Cuál es su nombre? " nombre

echo "Hola $nombre"
echo "¡Bienvenido a DevDojo!"
```

¡Asegúrese de probar también esto por su cuenta!
