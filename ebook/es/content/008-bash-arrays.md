# Matrices en Bash 

Si alguna vez ha hecho algo de programación, probablemente ya está familiarizado con matrices.

Pero en caso de que no sea un desarrollador, lo principal que debe saber es que, a diferencia de las variables, las matrices pueden contener varios valores bajo un mismo nombre.

Puede inicializar una matriz asignando valores divididos por espacio y encerrados en `()`. Ejemplo:

```bash
mi_matriz=("valor 1" "valor 2" "valor 3" "valor 4")
```

Para acceder a los elementos de la matriz, debe hacer referencia a ellos por su índice numérico.

>{aviso} tenga en cuenta que necesita usar corchetes.

* Accede a un solo elemento, esto daría como resultado: `valor 2`

```bash
echo ${mi_matriz[1]}
```

Esto devolvería el último elemento: `valor 4`

```bash
echo ${mi_matriz[-1]}
```

* Al igual que con los argumentos de la línea de comandos, usar `@` devolverá todos los argumentos en la matriz, de la siguiente manera: `valor 1 valor 2 valor 3 valor 4`

```bash
echo ${mi_matriz[@]}
```

* Anteponiendo a la matriz un signo de numeral (`#`) daría como resultado el número total de elementos en la matriz, en nuestro caso es `4`:

```bash
echo ${#mi_matriz[@]}
```

Asegúrese de probar esto y practicarlo con diferentes valores.

## Subcadena en Bash :: Rebanar

Revisemos el siguiente ejemplo de cortar una cadena de texto en Bash:

```bash
#!/bin/bash

letras=( "A""B""C""D""E" ) 
echo ${letras[@]}
```

Este comando imprimirá todos los elementos de una matriz.

Resultado:

```bash
$ ABCDE
```


Veamos algunos ejemplos más:

- Ejemplo 1

```bash
#!/bin/bash

letras=( "A""B""C""D""E" ) 
b=${letras:0:2}
echo "${b}"
```

Este comando imprimirá una matriz desde el índice inicial 0 hasta el 2, donde 2 es exclusivo.

```bash
$ AB
```

- Ejemplo 2

```bash
#!/bin/bash

letras=( "A""B""C""D""E" ) 
b=${letras::5}
echo "${b}"
```

Este comando imprimirá desde el índice base 0 a 5, donde 5 es exclusivo y el índice inicial está predeterminado en 0.

```bash
$ ABCDE
```

- Ejemplo 3

```bash
#!/bin/bash

letras=( "A""B""C""D""E" ) 
b=${letras:3}
echo "${b}"
```

Este comando imprimirá desde el índice inicial 3 hasta el final de la matriz inclusive.

 ```bash
 $ DE
 ```
