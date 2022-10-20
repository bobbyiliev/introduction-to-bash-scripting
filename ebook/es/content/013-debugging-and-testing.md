# Depuración, pruebas y accesos directos

Para depurar sus scripts de bash, puede usar `-x` cuando ejecute sus scripts:

```bash
bash -x ./su_script.sh
```

O puede añadir `set -x` antes de la línea específica que quiera depurar, `set -x` activa un modo del shell en el que todos los comandos ejecutados se imprimen en el terminal.

Otra forma de probar sus scripts es usar esta fantástica herramienta:

[https://www.shellcheck.net/](https://www.shellcheck.net/)

Sólo tiene que copiar y pegar su código en el cuadro de texto, y la herramienta te dará algunas sugerencias sobre cómo puede mejorar su script.

También puede ejecutar la herramienta directamente en su terminal:

[https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)

Si le gusta la herramienta, asegúrese de ponerle una estrella en GitHub y contribuir.

Como SysAdmin/DevOps, paso gran parte de mi día en la terminal. Aquí están mis atajos favoritos que me ayudan a hacer tareas más rápido mientras escribo scripts Bash o simplemente mientras trabajo en la terminal.

Los dos siguientes son particularmente útiles si tiene un comando muy largo.

* Borrar todo desde el cursor hasta el final de la línea:

```
Ctrl + k
```

* Borrar todo desde el cursor hasta el inicio de la línea:

```
Ctrl + u
```

* Borrar una palabra hacia atrás desde el cursor:

```
Ctrl + w
```

* Buscar en el historial hacia atrás. Esta es probablemente la que más uso. Es realmente útil y acelera mucho mi flujo de trabajo:

```
Ctrl + r
```

* Borrar la pantalla, yo uso esto en lugar de escribir el comando `clear`:

```
Ctrl + l
```

* Detiene la salida a la pantalla:

```
Ctrl + s
```

* Habilita la salida a la pantalla en caso de que se haya detenido previamente con `Ctrl + s`:

```
Ctrl + q
```

* Terminar el comando actual:

```
Ctrl + c
```

* Llevar el comando actual a un segundo plano:

```
Ctrl + z
```

Yo las uso regularmente todos los días, y me ahorran mucho tiempo.

Si cree que me he olvidado de alguna, ¡siéntase libre de unirse a la discusión en [el foro de la comunidad de DigitalOcean](https://www.digitalocean.com/community/questions/what-are-your-favorite-bash-shortcuts)!
