# Comentarios en Bash

Como con cualquier otro lenguaje de programación, puede agregar comentarios a su script. Los comentarios son usados para dejar notas personales en el código.

Para hacerlo en Bash, necesita agregar el simbolo `#` al comienzo de la línea. Los comentarios nunca aparecerán en la pantalla.

Aquí hay un ejemplo de un comentario:

```bash
# Este es un comentario y no aparecerá en la pantalla
```

Ahora agreguemos algunos comentarios a nuestro script:

```bash
#!/bin/bash

# Pregúntele al usuario su nombre
read -p "¿Cuál es su nombre? " nombre

# Saluda al usuario
echo "Hola $nombre"
echo "¡Bienvenido a DevDojo!"
```

Los comentarios son una excelente manera de describir algunas de las funciones más complejas directamente en sus scripts para que otras personas puedan orientarse en su código con facilidad.

