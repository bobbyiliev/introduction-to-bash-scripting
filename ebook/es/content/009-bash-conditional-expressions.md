# Expresiones Condicionales en Bash

En informática, las declaraciones condicionales, las expresiones condicionales y las construcciones condicionales son características de un lenguaje de programación, que realizan diferentes cálculos o acciones dependiendo de si una condición booleana especificada por el programador se evalúa como verdadera o falsa.

En Bash, las expresiones condicionales son utilizadas por el comando compuesto `[[` y los comandos integrados `[` para probar los atributos del archivo y realizar comparaciones aritméticas y de cadenas.

Aquí hay una lista de las expresiones condicionales de Bash más populares. 
No tiene que memorizarlos. ¡Simplemente, puede volver a consultar esta lista cuando la necesite!

## Expresiones de Archivo

* Verdadero si el archivo existe.

```bash
[[ -a ${file} ]]
```

* Verdadero si el archivo existe y es un archivo especial de bloque.

```bash
[[ -b ${file} ]]
```

* Verdadero si el archivo existe y es un archivo especial de caracteres.

```bash
[[ -c ${file} ]]
```

* Verdadero si el archivo existe y es un directorio.

```bash
[[ -d ${file} ]]
```

* Verdadero si el archivo existe.

```bash
[[ -e ${file} ]]
```

* Verdadero si el archivo existe y es un archivo normal.

```bash
[[ -f ${file} ]]
```

* Verdadero si el archivo existe y es un enlace simbólico.

```bash
[[ -h ${file} ]]
```

* Verdadero si el archivo existe y es legible.

```bash
[[ -r ${file} ]]
```

* Verdadero si el archivo existe y tiene un tamaño mayor que cero.

```bash
[[ -s ${file} ]]
```

* Verdadero si el archivo existe y se puede escribir.

```bash
[[ -w ${file} ]]
```

* Verdadero si el archivo existe y es ejecutable.

```bash
[[ -x ${file} ]]
```

* Verdadero si el archivo existe y es un enlace simbólico.

```bash
[[ -L ${file} ]]
```

## Expresiones de Cadena

* Verdadero si la variable de shell `varname` está configurada (se le ha asignado un valor).

```bash
[[ -v ${varname} ]]
```

* Verdadero si la longitud de la cadena es cero.

```bash
[[ -z ${string} ]]
```

* Verdadero si la longitud de la cadena no es cero.

```bash
[[ -n ${string} ]]
```

* Verdadero si las cadenas son iguales. `=` debe usarse con el comando de prueba para la conformidad con POSIX. Cuando se utiliza con el comando `[[`, este realiza la coincidencia de patrones como se describe arriba (Comandos compuestos).

```bash
[[ ${string1} == ${string2} ]]
```

* Verdadero si las cadenas no son iguales.

```bash
[[ ${string1} != ${string2} ]]
```

* Verdadero si `string1` se ordena lexicográficamente antes que `string2`.

```bash
[[ ${string1} < ${string2} ]]
```

* Verdadero si `string1` se ordena después de `string2` lexicográficamente.

```bash
[[ ${string1} > ${string2} ]]
```

## Operadores Aritméticos

* Devuelve verdadero si los números son **iguales**.

```bash
[[ ${arg1} -eq ${arg2} ]]
```

* Devuelve verdadero si los números **no son iguales**.

```bash
[[ ${arg1} -ne ${arg2} ]]
```

* Devuelve verdadero si arg1 es **menor que** arg2.

```bash
[[ ${arg1} -lt ${arg2} ]]
```

* Devuelve verdadero si arg1 es **menor o igual** arg2.

```bash
[[ ${arg1} -le ${arg2} ]]
```

* Devuelve verdadero si arg1 es **mayor que** arg2.

```bash
[[ ${arg1} -gt ${arg2} ]]
```

* Devuelve verdadero si arg1 es **mayor o igual** arg2

```bash
[[ ${arg1} -ge ${arg2} ]]
```

Como nota al margen, arg1 y arg2 pueden ser números enteros positivos o negativos.

Al igual que con otros lenguajes de programación, puede usar las condiciones `AND` y `OR`:

```bash
[[ test_case_1 ]] && [[ test_case_2 ]] # And
[[ test_case_1 ]] || [[ test_case_2 ]] # Or
```

## Operadores de estado de salida

* devuelve verdadero si el comando fue exitoso sin ningún error

```bash
[[ $? -eq 0 ]]
```

* devuelve verdadero si el comando no tuvo éxito o tuvo errores

```bash
[[ $? -gt 0 ]]
```