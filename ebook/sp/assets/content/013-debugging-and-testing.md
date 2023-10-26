# Depuración, pruebas y atajos

Para depurar sus scripts bash, puede usar `-x` al ejecutar sus scripts:

```golpecito
bash -x ./tu_script.sh
```

O puede agregar `set -x` antes de la línea específica que desea depurar, `set -x` habilita un modo del shell donde todos los comandos ejecutados se imprimen en la terminal.

Otra forma de probar tus scripts es utilizar esta fantástica herramienta aquí:

[https://www.shellcheck.net/](https://www.shellcheck.net/)

Simplemente copie y pegue su código en el cuadro de texto y la herramienta le dará algunas sugerencias sobre cómo puede mejorar su script.

También puedes ejecutar la herramienta directamente en tu terminal:

[https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)

Si te gusta la herramienta, asegúrate de destacarla en GitHub y contribuir.

Como SysAdmin/DevOps, paso gran parte del día en la terminal. Estos son mis atajos favoritos que me ayudan a realizar tareas más rápido mientras escribo scripts Bash o simplemente mientras trabajo en la terminal.

Los dos siguientes son particularmente útiles si tienes un comando muy largo.

* Eliminar todo desde el cursor hasta el final de la línea:

```
Ctrl+k
```

* Eliminar todo desde el cursor hasta el inicio de la línea:

```
Ctrl + u
```

* Eliminar una palabra hacia atrás desde el cursor:

```
Ctrl + w
```

* Busca en tu historial hacia atrás. Este es probablemente el que más uso. Es realmente útil y acelera mucho mi flujo de trabajo:

```
Ctrl+r
```

* Limpiar la pantalla, uso esto en lugar de escribir el comando `clear`:

```
Ctrl + l
```

* Detiene la salida a la pantalla:

```
Ctrl + s
```

* Habilitar la salida a pantalla en caso de que previamente se detuviera con `Ctrl + s`:

```
Ctrl + q
```

* Terminar el comando actual

```
Ctrl+c
```

* Lanzar el comando actual al fondo:

```
Ctrl + z
```

Los uso regularmente todos los días y me ahorra mucho tiempo.

Si cree que me he perdido algo, no dude en unirse a la discusión en [el foro de la comunidad de DigitalOcean] (https://www.digitalocean.com/community/questions/what-are-your-favorite-bash-shortcuts).
