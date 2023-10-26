# Expresiones condicionales de Bash

En informática, las declaraciones condicionales, las expresiones condicionales y las construcciones condicionales son características de un lenguaje de programación, que realizan diferentes cálculos o acciones dependiendo de si una condición booleana especificada por el programador se evalúa como verdadera o falsa.

En Bash, las expresiones condicionales son utilizadas por el comando compuesto `[[` y los comandos integrados `[` para probar los atributos del archivo y realizar comparaciones aritméticas y de cadenas.

Aquí hay una lista de las expresiones condicionales de Bash más populares. No es necesario memorizarlos de memoria. ¡Simplemente puede consultar esta lista cuando la necesite!

## Expresiones de archivo

* Verdadero si el archivo existe.

```golpecito
[[ -a ${archivo} ]]
```

* Verdadero si el archivo existe y es un archivo especial de bloque.

```golpecito
[[ -b ${archivo} ]]
```

* Verdadero si el archivo existe y es un archivo de caracteres especiales.

```golpecito
[[ -c ${archivo} ]]
```

* Verdadero si el archivo existe y es un directorio.

```golpecito
[[ -d ${archivo} ]]
```

* Verdadero si el archivo existe.

```golpecito
[[ -e ${archivo} ]]
```

* Verdadero si el archivo existe y es un archivo normal.

```golpecito
[[ -f ${archivo} ]]
```

* Verdadero si el archivo existe y es un enlace simbólico.

```golpecito
[[ -h ${archivo} ]]
```

* Verdadero si el archivo existe y es legible.

```golpecito
[[ -r ${archivo} ]]
```

* Verdadero si el archivo existe y tiene un tamaño mayor que cero.

```golpecito
[[ -s ${archivo} ]]
```

* Verdadero si el archivo existe y se puede escribir.

```golpecito
[[ -w ${archivo} ]]
```

* Verdadero si el archivo existe y es ejecutable.

```golpecito
[[ -x ${archivo} ]]
```

* Verdadero si el archivo existe y es un enlace simbólico.

```golpecito
[[ -L ${archivo} ]]
```

## Expresiones de cadena

* Verdadero si la variable de shell varname está configurada (se le ha asignado un valor).

```golpecito
[[ -v ${varname} ]]
```

Verdadero si la longitud de la cadena es cero.

```golpecito
[[ -z ${cadena} ]]
```

Verdadero si la longitud de la cadena es distinta de cero.

```golpecito
[[ -n ${cadena} ]]
```

* Verdadero si las cadenas son iguales. `=` debe usarse con el comando de prueba para la conformidad con POSIX. Cuando se usa con el comando `[[`, realiza la coincidencia de patrones como se describe arriba (Comandos compuestos).

```golpecito
[[ ${cadena1} == ${cadena2} ]]
```

* Verdadero si las cadenas no son iguales.

```golpecito
[[ ${string1} != ${string2} ]]
```

* Verdadero si cadena1 ordena lexicográficamente antes de cadena2.

```golpecito
[[ ${cadena1} < ${cadena2} ]]
```

* Verdadero si cadena1 ordena lexicográficamente después de cadena2.

```golpecito
[[ ${string1} > ${string2} ]]
```

## Operadores aritméticos

* Devuelve verdadero si los números son **iguales**

```golpecito
[[ ${arg1} -eq ${arg2} ]]
```

* Devuelve verdadero si los números **no son iguales**

```golpecito
[[ ${arg1} -ne ${arg2} ]]
```

* Devuelve verdadero si arg1 es **menor que** arg2

```golpecito
[[ ${arg1} -lt ${arg2} ]]
```

* Devuelve verdadero si arg1 es **menor o igual** arg2

```golpecito
[[ ${arg1} -le ${arg2} ]]
```

* Devuelve verdadero si arg1 es **mayor que** arg2

```golpecito
[[ ${arg1} -gt ${arg2} ]]
```

* Devuelve verdadero si arg1 es **mayor o igual** arg2

```golpecito
[[ ${arg1} -ge ${arg2} ]]
```

Como nota al margen, arg1 y arg2 pueden ser números enteros positivos o negativos.

Al igual que con otros lenguajes de programación, puedes usar las condiciones `Y` y `O`:

```golpecito
[[ test_case_1 ]] && [[ test_case_2 ]] # Y
[[ test_case_1 ]] || [[ test_case_2 ]] # O
```

## Operadores de estado de salida

* devuelve verdadero si el comando fue exitoso sin ningún error

```golpecito
ps -ecuación 0 ]]
```

* devuelve verdadero si el comando no tuvo éxito o tuvo errores

```golpecito
ps -gt 0 ]]
```