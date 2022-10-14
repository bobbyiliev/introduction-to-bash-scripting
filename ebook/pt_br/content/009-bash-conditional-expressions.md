# Expressões Condicionais Bash

Na ciência da computação, declarações condicionais, expressões condicionais e construções condicionais são recursos de uma linguagem de programação, que executam diferentes computações ou ações dependendo se uma condição booleana especificada pelo programador é avaliada como verdadeira ou falsa.

No Bash, as expressões condicionais são usadas pelo comando composto `[[` e os comandos internos `[` para testar os atributos do arquivo e realizar comparações aritméticas e de strings.

Aqui está uma lista das expressões condicionais Bash mais populares. Você não precisa memorizá-los de cor. Você pode simplesmente consultar esta lista sempre que precisar!

## Expressões de arquivo

* Verdadeiro se o arquivo existir.

```bash
[[ -a ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for um arquivo especial de bloco.

```bash
[[ -b ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for um arquivo especial de caracteres.

```bash
[[ -c ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for um diretório.

```bash
[[ -d ${arquivo}]]
```

* Verdadeiro se o arquivo existir.

```bash
[[ -e ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for um arquivo normal.

```bash
[[ -f ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for um link simbólico.

```bash
[[ -h ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for legível.

```bash
[[ -r ${arquivo}]]
```

* Verdadeiro se o arquivo existir e tiver um tamanho maior que zero.

```bash
[[ -s ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for gravável.

```bash
[[ -w ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for executável.

```bash
[[ -x ${arquivo}]]
```

* Verdadeiro se o arquivo existir e for um link simbólico.

```bash
[[ -L ${arquivo}]]
```

## Expressões de string

* True se a variável shell varname estiver definida (foi atribuído um valor).

```bash
[[ -v ${varname}]]
```

* True se o comprimento da string for zero.

```bash
[[ -z ${string}]]
```

* True se o comprimento da string for diferente de zero.

```bash
[[ -n ${string}]]
```

* True se as strings forem iguais. `=` deve ser usado com o comando test para conformidade com POSIX. Quando usado com o comando `[[`, ele executa a correspondência de padrões conforme descrito acima (Comandos compostos).

```bash
[[ ${string1} == ${string2}]]
```

* True se as strings não forem iguais.

```bash
[[ ${string1} != ${string2} ]]
```

* Verdadeiro se string1 classificar antes de string2 lexicograficamente.

```bash
[[ ${string1} < ${string2} ]]
```

* Verdadeiro se string1 classificar após string2 lexicograficamente.

```bash
[[ ${string1} > ${string2}]]
```

## Operadores aritméticos

* Retorna verdadeiro se os números forem **iguais**

```bash
[[ ${arg1} -eq ${arg2} ]]
```

* Retorna verdadeiro se os números **não forem iguais**

```bash
[[ ${arg1} -ne ${arg2} ]]
```

* Retorna verdadeiro se arg1 for **menor que** arg2

```bash
[[ ${arg1} -lt ${arg2} ]]
```

* Retorna verdadeiro se arg1 for **menor ou igual** arg2

```bash
[[ ${arg1} -le ${arg2} ]]
```

* Retorna verdadeiro se arg1 for **maior que** arg2

```bash
[[ ${arg1} -gt ${arg2} ]]
```

* Retorna verdadeiro se arg1 for **maior ou igual** arg2

```bash
[[ ${arg1} -ge ${arg2} ]]
```

Como uma nota lateral, arg1 e arg2 podem ser números inteiros positivos ou negativos.

Assim como em outras linguagens de programação, você pode usar as condições `AND` e `OR`:

```bash
[[ test_case_1 ]] && [[ test_case_2 ]] # E
[[ test_case_1 ]] || [[ test_case_2 ]] # Ou
```

## Operadores de status de saída

* Retorna true se o comando foi bem sucedido sem nenhum erro

```bash
[[$? -eq 0 ]]
```

* Retorna true se o comando não foi bem sucedido ou teve erros

```bash
[[$? -gt 0 ]]
```
