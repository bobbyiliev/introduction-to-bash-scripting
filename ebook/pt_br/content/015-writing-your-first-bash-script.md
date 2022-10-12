# Escreva seu primeiro script Bash

Vamos tentar juntar o que aprendemos até agora e criar nosso primeiro script Bash!

## Planejando o roteiro

Como exemplo, escreveremos um script que reuniria algumas informações úteis sobre nosso servidor, como:

* Uso atual do disco
* Uso atual da CPU
* Uso atual de RAM
* Verifique a versão exata do Kernel

Sinta-se à vontade para ajustar o script adicionando ou removendo a funcionalidade para que corresponda às suas necessidades.

## Escrevendo o roteiro

A primeira coisa que você precisa fazer é criar um novo arquivo com a extensão `.sh`. Vou criar um arquivo chamado `status.sh` pois o script que vamos criar nos daria o status do nosso servidor.

Depois de criar o arquivo, abra-o com seu editor de texto favorito.

Como aprendemos no capítulo 1, na primeira linha do nosso script Bash, precisamos especificar o chamado [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)):

```bash
#!/bin/bash
```

Tudo o que o shebang faz é instruir o sistema operacional a executar o script com o executável /bin/bash.

## Adicionando comentários

Em seguida, conforme discutido no capítulo 6, vamos começar adicionando alguns comentários para que as pessoas possam descobrir facilmente para que serve o script. Para fazer isso logo após o shebang, basta adicionar o seguinte:

```bash
#!/bin/bash

# Script que retorna o status atual do servidor
```

## Adicionando sua primeira variável

Então vamos aplicar o que aprendemos no capítulo 4 e adicionar algumas variáveis ​​que podemos querer usar em todo o script.

Para atribuir um valor a uma variável no bash, você só precisa usar o sinal `=`. Por exemplo, vamos armazenar o hostname do nosso servidor em uma variável para que possamos usá-lo mais tarde:

```bash
server_name=$(hostname)
```

Usando `$()` dizemos ao bash para interpretar o comando e então atribuir o valor à nossa variável.

Agora, se ecoássemos a variável, veríamos o nome do host atual:

```bash
echo $server_name
```

## Adicionando sua primeira função

Como você já sabe depois de ler o capítulo 12, para criar uma função no bash você precisa usar a seguinte estrutura:

```bash
function nome_função() {
    seus_comandos
}
```

Vamos criar uma função que retorne o uso atual de memória em nosso servidor:

```bash
function memory_check() {
    echo ""
    echo "O uso atual de memória em ${server_name} é: "
    free -h
    echo ""
}
```

Resumo rápido da função:

* `function memory_check() {` - é assim que definimos a função
* `echo ""` - aqui apenas imprimimos uma nova linha
* `echo "O uso atual de memória em ${server_name} é: "` - aqui nós imprimimos uma pequena mensagem e a variável `$server_name`
* `}` - finalmente é assim que fechamos a função

Então, uma vez definida a função, para chamá-la, basta usar o nome da função:

```bash
#Defina a função
function memory_check() {
    echo ""
    echo "O uso atual de memória em ${server_name} é: "
    free -h
    echo ""
}

# Chama a função
memory_check
```

## Desafio de adicionar mais funções

Antes de verificar a solução, eu desafio você a usar a função acima e escrever algumas funções por conta própria.

As funções devem fazer o seguinte:

* Uso atual do disco
* Uso atual da CPU
* Uso atual de RAM
* Verifique a versão exata do Kernel

Sinta-se à vontade para usar o google se não tiver certeza de quais comandos precisa usar para obter essas informações.

Quando estiver pronto, sinta-se à vontade para rolar para baixo e verificar como fizemos isso e comparar os resultados!

Observe que existem várias maneiras corretas de fazer isso!

## O script de exemplo

Veja como ficaria o resultado final:

```bash
#!/bin/bash

##
# script BASH que verifica:
#   - Uso de memória
# - carga da CPU
# - Número de conexões TCP
# - Versão do kernel
##

server_name=$(hostname)

function memory_check() {
    echo ""
    echo "O uso de memória em ${server_name} é: "
    free -h
    echo ""
}

function cpu_check() {
    echo ""
    echo "A carga da CPU em ${server_name} é: "
    echo ""
    uptime
    echo ""
}

function tcp_check() {
    echo ""
    echo "Conexões TCP em ${server_name}: "
    echo ""
    cat /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
    echo "A versão do kernel em ${server_name} é: "
    echo ""
    uname -r
    echo ""
}

function all_checks() {
    memory_check
    cpu_check
    tcp_check
    kernel_check
}

all_checks
```

## Conclusão

O script Bash é incrível! Não importa se você é um engenheiro de DevOps/SysOps, desenvolvedor ou apenas um entusiasta do Linux, você pode usar scripts Bash para combinar diferentes comandos do Linux e automatizar tarefas diárias chatas e repetitivas, para que você possa se concentrar em coisas mais produtivas e divertidas!

>{notice} Isso foi postado inicialmente em [DevDojo.com](https://devdojo.com/bobbyiliev/introduction-to-bash-scripting)
