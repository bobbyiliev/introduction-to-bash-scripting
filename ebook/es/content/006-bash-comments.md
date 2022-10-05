# Comentarios en Bash

Como con cualquier otro lenguaje de programación, puedes agregar comentarios a tu script. Los comentarios son usados para dejar notas personales en el código.

Para hacerlo en Bash, necesitas agregar el simbolo `#` al comienzo de la línea. Los comentarios nunca aparecerán en la pantalla.

Aquí hay un ejemplo de un comentario:

```bash
# Este es un comentario y no aparecerá en la pantalla
```

Ahora agreguemos algunos comentarios a nuestro script:

```bash
#!/bin/bash

# Pregúntale al usuario su nombre
read -p "¿Cuál es tu nombre? " name

# Saluda al usuario
echo "Hola $name"
echo "Bienvenido a DevDojo!"
```

Los comentarios son una excelente manera de describir algunas de las funciones más complejas directamente en tus scripts para que otras personas puedan orientarse en tu código con facilidad.