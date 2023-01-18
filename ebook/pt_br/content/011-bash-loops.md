# Laços Bash (Loops)

Como em qualquer outra linguagem, os loops são muito convenientes. Com o Bash você pode usar loops `for`, loops `while` e loops `until`.

## Laços For

Aqui está a estrutura de um loop for:

```bash
for var in ${list}
do
    seus_comandos
done
```

Exemplo:

```bash
#!/bin/bash

users="devdojo bobby tony"

for user in ${users}
do
    echo "${user}"
done
```

Um resumo rápido do exemplo:

* Primeiro, especificamos uma lista de usuários e armazenamos o valor em uma variável chamada `$users`.
* Depois disso, iniciamos nosso loop `for` com a palavra-chave `for`
* Em seguida, definimos uma nova variável que representaria cada item da lista que damos. No nosso caso, definimos uma variável chamada `user`, que representaria cada usuário da variável `$users`.
* Em seguida, especificamos a palavra-chave `in` seguida por nossa lista que percorreremos
* Na próxima linha, usamos a palavra-chave `do`, que indica o que faremos para cada iteração do loop
* Em seguida, especificamos os comandos que queremos executar
* Finalmente, fechamos o loop com a palavra-chave `done`

Você também pode usar `for` para processar uma série de números. Por exemplo, aqui está uma maneira de percorrer de 1 a 10:

```bash
#!/bin/bash

for num in {1..10}
do
    echo ${num}
done
```

## Laços Enquanto (While)

A estrutura de um loop while é bastante semelhante ao loop `for`:

```bash
while [[sua_condição]]
do
    suas_condições
done
```

Aqui está um exemplo de um loop `while`:

```bash
#!/bin/bash

contador=1
while [[ $contador -le 10 ]]
do
    echo $ contador
    ((contador++))
done
```

Primeiro, especificamos uma variável de contador e a definimos como `1`, então dentro do loop, adicionamos contador usando esta instrução aqui: `((contador++))`. Dessa forma, garantimos que o loop será executado apenas 10 vezes e não será executado para sempre. O loop será concluído assim que o contador se tornar 10, pois isso é o que definimos como condição: `while [[ $contador -le 10 ]]`.

Vamos criar um script que peça o nome do usuário e não permita uma entrada vazia:

```bash
#!/bin/bash

read -p "Qual é o seu nome?" name

while [[ -z ${name} ]]
do
    echo "Seu nome não pode ficar em branco. Por favor, digite um nome válido!"
    read -p "Digite seu nome novamente?" name
done

echo "Olá ${name}"
```

Agora, se você executar o script acima e apenas pressionar enter sem fornecer dados, o loop será executado novamente e solicitará seu nome várias vezes até que você forneça algum dado.

## Laços Até (Until)

A diferença entre os loops `until` e `while` é que o loop `until` executará os comandos dentro do loop até que a condição se torne verdadeira.

Estrutura:

```bash
until [[sua_condição]]
do
    seus_comandos
done
```

Exemplo:

```bash
#!/bin/bash

contagem=1
until [[ $contagem -gt 10 ]]
do
    echo $ contagem
    ((contagem++))
done
```

## Continuar e brecar

Assim como em outras linguagens, você também pode usar `continue` e `break` com seus scripts bash:

* `continue` diz ao seu script bash para parar a iteração atual do loop e iniciar a próxima iteração.

A sintaxe da instrução continue é a seguinte:

```bash
continue [n]
```

O argumento [n] é opcional e pode ser maior ou igual a 1. Quando [n] é fornecido, o n-ésimo loop delimitador é retomado. continue 1 é equivalente a continuar.

```bash
#!/bin/bash

for i in 1 2 3 4 5
do
    if [[ $i –eq 2 ]]
    then
        echo "pulando o número 2"
    continue
    fi
    echo “I é igual a $i”
done
```

Também podemos usar o comando continue de maneira semelhante ao comando break para controlar vários loops.

* `break` diz ao seu script bash para terminar o loop imediatamente.

A sintaxe da instrução break assume a seguinte forma:

```bash
break [n]
```

[n] é um argumento opcional e deve ser maior ou igual a 1. Quando [n] é fornecido, o n-ésimo loop de fechamento é encerrado. break 1 é equivalente a break.

Exemplo:

```bash
#!/bin/bash

num=1
while [[ $num –lt 10 ]]
do
    if [[ $num –eq 5 ]]
    then
        break
    fi
    ((nº++))
done
echo “Loop concluído”
```

Também podemos usar o comando break com vários loops. Se quisermos sair do loop de trabalho atual, seja interno ou externo, simplesmente usamos break, mas se estamos no loop interno e queremos sair do loop externo, usamos break 2.

Exemplo:

```bash
#!/bin/bash

for ((a = 1; a < 10; a++))
do
    echo “loop externo: $a”
    for ((b = 1; b < 100; b++))
    do
        if [[ $b –gt 5 ]]
        then
            break 2
        fi
    echo “Loop interno: $b”
    done
done
```

O script bash começará com a=1 e passará para o loop interno e, quando atingir b=5, interromperá o loop externo.
Podemos usar apenas um break em vez de dois, para quebrar o loop interno e ver como isso afeta a saída.
