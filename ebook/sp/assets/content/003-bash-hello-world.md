# Bash Hola mundo

Una vez que hayamos creado nuestro archivo `devdojo.sh` y hayamos especificado el shebang bash en la primera línea, estamos listos para crear nuestro primer script bash `Hello World`.

Para hacer eso, abra el archivo `devdojo.sh` nuevamente y agregue lo siguiente después de la línea `#!/bin/bash`:

```golpecito
#!/bin/bash

eco "¡Hola mundo!"
```

Guarda el archivo y cierra.

Después de eso, haga que el script sea ejecutable ejecutando:

```golpecito
chmod +x devdojo.sh
```

Después de eso ejecute el archivo:

```golpecito
./devdojo.sh
```

Verá un mensaje "Hola mundo" en la pantalla.

Otra forma de ejecutar el script sería:

```golpecito
bash devdojo.sh
```

Como bash se puede usar de forma interactiva, puede ejecutar el siguiente comando directamente en su terminal y obtendrá el mismo resultado:

```golpecito
echo "¡Hola DevDojo!"
```

Crear un script es útil una vez que tienes que combinar varios comandos.