# Comentarios bash

Como con cualquier otro lenguaje de programación, puedes agregar comentarios a tu script. Los comentarios se utilizan para dejarse notas a través de su código.

Para hacer eso en Bash, debe agregar el símbolo `#` al principio de la línea. Los comentarios nunca se mostrarán en la pantalla.

A continuación se muestra un ejemplo de un comentario:

```golpecito
# Este es un comentario y no se mostrará en la pantalla.
```

Sigamos adelante y agreguemos algunos comentarios a nuestro script:

```golpecito
#!/bin/bash

# Preguntar al usuario su nombre

leer -p "¿Cuál es tu nombre?" nombre

# Saludar al usuario
echo "Hola $nombre"
echo "¡Bienvenido a DevDojo!"
```

Los comentarios son una excelente manera de describir algunas de las funciones más complejas directamente en sus scripts para que otras personas puedan orientarse en su código con facilidad.
