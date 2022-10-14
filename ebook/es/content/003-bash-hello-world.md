# Hola Mundo con Bash

Una vez que tenemos nuestro archivo `devdojo.sh` creado y hemos especificado el shebang de bash en la primera línea, estamos listos para crear nuestro primer script bash: `Hola Mundo`.

Para ello, abra de nuevo el archivo `devdojo.sh` y añada lo siguiente después de la línea `#!/bin/bash`:

```bash
#!/bin/bash

echo "¡Hola Mundo!"
```

Guarde el archivo y salga.

Después haga que el script sea ejecutable con el siguiente comando en la consola

```bash
chmod +x devdojo.sh
```

Después ejecute el archivo:

```bash
./devdojo.sh
```

Verá un mensaje de "¡Hola Mundo!" en la pantalla.

Otra forma de ejecutar el script sería

```bash
bash devdojo.sh
```

Como bash se puede utilizar de forma interactiva, podría ejecutar el siguiente comando directamente en su terminal y obtendría el mismo resultado:

```bash
echo "¡Hola Mundo!"
```

Armar un script es útil cuando tiene que combinar varios comandos.
