# matrices bash

Si alguna vez ha realizado alguna programación, probablemente ya esté familiarizado con las matrices.

Pero en caso de que no seas desarrollador, lo principal que debes saber es que, a diferencia de las variables, las matrices pueden contener varios valores bajo un mismo nombre.

Puede inicializar una matriz asignando valores divididos por espacios y encerrados en `()`. Ejemplo:

```golpecito
my_array=("valor 1" "valor 2" "valor 3" "valor 4")
```

Para acceder a los elementos de la matriz, debe hacer referencia a ellos por su índice numérico.

>{aviso} tenga en cuenta que debe utilizar llaves.

* Acceda a un solo elemento, esto generaría: `valor 2`

```golpecito
eco ${mi_matriz[1]}
```

* Esto devolvería el último elemento: `valor 4`

```golpecito
eco ${mi_matriz[-1]}
```

* Al igual que con los argumentos de la línea de comando, usar `@` devolverá todos los argumentos en la matriz, de la siguiente manera: `valor 1 valor 2 valor 3 valor 4`

```golpecito
eco ${mi_matriz[@]}
```

* Anteponer la matriz con un signo de almohadilla (`#`) generaría el número total de elementos en la matriz, en nuestro caso es `4`:

```golpecito
eco ${#my_array[@]}
```

Asegúrate de probar esto y practicarlo al final con diferentes valores.

## Subcadena en Bash :: Cortar

Repasemos el siguiente ejemplo de corte de una cadena en Bash:

```golpecito
#!/bin/bash

letras=( "A""B""C""D""E")
eco ${letras[@]}
```

Este comando imprimirá todos los elementos de una matriz.

Producción:

```golpecito
$ABCDE
```


Veamos algunos ejemplos más:

- Ejemplo 1

```golpecito
#!/bin/bash

letras=( "A""B""C""D""E")
b=${letras:0:2}
eco "${b}"
```

Este comando imprimirá una matriz desde el índice inicial 0 al 2, donde 2 es exclusivo.

```golpecito
$AB
```
 
  - Ejemplo 2

```golpecito
#!/bin/bash

letras=( "A""B""C""D""E")
b=${letras::5}
eco "${b}"
```

Este comando imprimirá desde el índice base 0 al 5, donde 5 es exclusivo y el índice inicial está configurado de forma predeterminada en 0.

```golpecito
$ABCDE
```

- Ejemplo 3

```golpecito
#!/bin/bash

letras=( "A""B""C""D""E")
b=${letras:3}
eco "${b}"
```

Este comando imprimirá desde el índice inicial
  3 hasta el final de la matriz inclusive.

  ```golpecito
  $DE
  ```
  