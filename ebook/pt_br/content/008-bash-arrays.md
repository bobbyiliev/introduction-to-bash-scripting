# Arrays Bash

Se você já fez alguma programação, provavelmente já está familiarizado com arrays.

Mas caso você não seja um desenvolvedor, a principal coisa que você precisa saber é que, diferentemente das variáveis, os arrays podem conter vários valores sob um nome.

Você pode inicializar um array atribuindo valores divididos por espaço e entre `()`. Exemplo:

```bash
my_array=("valor 1" "valor 2" "valor 3" "valor 4")
```

Para acessar os elementos na matriz, você precisa referenciá-los por seu índice numérico.

>{notice} tenha em mente que você precisa usar colchetes.

* Acesse um único elemento, isso resultaria em: `valor 2`

```bash
echo ${my_array[1]}
```

* Isso retornaria o último elemento: `valor 4`

```bash
echo ${my_array[-1]}
```

* Assim como os argumentos de linha de comando, usar `@` retornará todos os argumentos na matriz, como segue: `valor 1 valor 2 valor 3 valor 4`

```bash
echo ${my_array[@]}
```

* Prefixar o array com um sinal de hash (`#`) produziria o número total de elementos no array, no nosso caso é `4`:

```bash
echo ${#my_array[@]}
```

Certifique-se de testar isso e praticá-lo com valores diferentes.

## Substring no Bash :: Fatiando

Vamos revisar o seguinte exemplo de fatiamento em uma string no Bash:

```bash
#!/bin/bash

letras=("A""B""C""D""E")
echo ${letras[@]}
```

Este comando imprimirá todos os elementos de um array.

Resultado:

```bash
ABCDE
```

Vejamos mais alguns exemplos:

* Exemplo 1

```bash
#!/bin/bash

letras=("A""B""C""D""E")
b=${letras:0:2}
echo "${b}"
```

Este comando imprimirá a matriz do índice inicial 0 a 2, onde 2 é exclusivo.

```bash
AB
```

* Exemplo 2

```bash
#!/bin/bash

letras=("A""B""C""D""E")
b=${letras::5}
echo "${b}"
```

Este comando imprimirá do índice base 0 a 5, onde 5 é exclusivo e o índice inicial é definido como 0 .

```bash
ABCDE
```

* Exemplo 3

```bash
#!/bin/bash

letras=("A""B""C""D""E")
b=${letras:3}
echo "${b}"
```

Este comando imprimirá a partir do índice inicial
 3 ao final do array inclusive .

 ```bash
 DE
 ```
