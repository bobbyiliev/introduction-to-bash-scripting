# Funções Bash

As funções são uma ótima maneira de reutilizar o código. A estrutura de uma função no bash é bastante semelhante à maioria das linguagens:

```bash
function nome_function() {
    seus_comandos
}
```

Você também pode omitir a palavra-chave `function` no início, o que também funcionaria:

```bash
nome_function() {
    seus_comandos
}
```

Eu prefiro colocá-lo lá para melhor legibilidade. Mas é uma questão de preferência pessoal.

Exemplo de um "Hello World!" função:

```bash
#!/bin/bash

função hello(){
    echo "Função Hello World!"
}

hello
```

>{notice} Uma coisa a ter em mente é que você não deve adicionar os parênteses ao chamar a função.

Passar argumentos para uma função funciona da mesma forma que passar argumentos para um script:

```bash
#!/bin/bash

function hello(){
    echo "Hello $1!"
}

hello DevDojo
```

As funções devem ter comentários mencionando descrição, variáveis ​​globais, argumentos, saídas e valores retornados, se aplicável

```bash
######################################
# Descrição: Função Hello
# Globais:
#   Nenhum
# Argumentos:
#    Argumento de entrada único
# Saídas:
#    Valor do argumento de entrada
# Retorna:
#    0 se for bem-sucedido, diferente de zero em caso de erro.
######################################
function hello(){
    echo "Hello $1!"
}
```

Nos próximos capítulos, usaremos muito as funções!
