# Criando um menu interativo no Bash

Neste tutorial, mostrarei como criar um menu de múltipla escolha no Bash para que seus usuários possam escolher entre qual ação deve ser executada!

Nós reutilizaríamos parte do código do capítulo anterior, portanto, se você ainda não o leu, certifique-se de fazê-lo.

## Planejando a funcionalidade

Vamos começar de novo analisando a funcionalidade principal do script:

* Verifica o uso atual do disco
* Verifica o uso atual da CPU
* Verifica o uso atual da RAM
* Verifica a versão exata do Kernel

Caso você não o tenha em mãos, aqui está o script em si:

```bash
#!/bin/bash

##
# Script de menu BASH que verifica:
#  - Uso de memória
#  - carga da CPU
#  - Número de conexões TCP
#  - Versão do kernel
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
```

Construiremos então um menu que permite ao usuário escolher qual função será executada.

Claro, você pode ajustar a função ou adicionar novas, dependendo de suas necessidades.

## Adicionando algumas cores

Para tornar o menu um pouco mais 'legível' e fácil de entender à primeira vista, adicionaremos algumas funções de cores.

No início do seu script, adicione as seguintes funções de cores:

```bash
##
# Variáveis ​​de cor
##
verde='\e[32m'
azul='\e[34m'
clear='\e[0m'

##
#Funções de cores
##

CorVerde(){
    echo -ne $verde$1$clear
}
CorAzul(){
    echo -ne $azul$1$clear
}
```

Você pode usar as funções de cor da seguinte forma:

```bash
echo -ne $(ColAzul 'Algum texto aqui')
```

O texto acima produziria a string `Algum texto aqui` e seria azul!

# Adicionando o Menu

Por fim, para adicionar nosso menu, criaremos uma função separada com um case switch para nossas opções de menu:

```bash
menu(){
echo -ne"
Meu primeiro Menu
$(CorVerde '1)') Uso de memória
$(CorVerde '2)') Carga da CPU
$(CorVerde '3)') Número de conexões TCP
$(CorVerde '4)') Versão do kernel
$(CorVerde '5)') Verificar tudo
$(CorVerde '0)') Sair
$(CorAzul 'Escolha uma opção:') "
        read a
        case $a in
            1) memory_check ; menu ;;
            2) cpu_check ; menu ;;
            3) tcp_check ; menu ;;
            4) kernel_check ; menu ;;
            5) all_checks ; menu ;;
            0) exit 0 ;;
            *) echo -e $red"Opção errada."$clear; Comando Errado;;
        esac
}
```

### Um rápido resumo do código

Primeiro, apenas ecoamos as opções do menu com alguma cor:

```
echo -ne"
Meu primeiro Menu
$(CorVerde '1)') Uso de memória
$(CorVerde '2)') Carga da CPU
$(CorVerde '3)') Número de conexões TCP
$(CorVerde '4)') Versão do kernel
$(CorVerde '5)') Verificar tudo
$(CorVerde '0)') Sair
$(CorAzul 'Escolha uma opção:') "
```

Então lemos a resposta do usuário e a armazenamos em uma variável chamada `$a`:

```bash
        read a
```

Finalmente, temos um switch case que aciona uma função diferente dependendo do valor de `$a`:

```bash
        case $a in
         1) memory_check ; menu ;;
         2) cpu_check ; menu ;;
         3) tcp_check ; menu ;;
         4) kernel_check ; menu ;;
         5) all_checks ; menu ;;
         0) exit 0 ;;
         *) echo -e $red"Opção errada."$clear; Comando Errado;;
        esac
```

No final, precisamos chamar a função menu para realmente imprimir o menu:

```bash
# Chama a função de menu
menu
```

## Testando o script

No final, seu script ficará assim:

```bash
#!/bin/bash

##
# Script de menu BASH que verifica:
#  - Uso de memória
#  - Carga da CPU
#  - Número de conexões TCP
#  - Versão do kernel
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

##
# Variáveis ​​de cor
##
verde='\e[32m'
azul='\e[34m'
clear='\e[0m'

##
#Funções de cores
##

CorVerde(){
    echo -ne $verde$1$clear
}
CorAzul(){
    echo -ne $azul$1$clear
}

menu(){
echo -ne"
Meu primeiro Menu
$(CorVerde '1)') Uso de memória
$(CorVerde '2)') Carga da CPU
$(CorVerde '3)') Número de conexões TCP
$(CorVerde '4)') Versão do kernel
$(CorVerde '5)') Verificar tudo
$(CorVerde '0)') Sair
$(CorAzul 'Escolha uma opção:') "
        read a
        case $a in
            1) memory_check ; menu ;;
            2) cpu_check ; menu ;;
            3) tcp_check ; menu ;;
            4) kernel_check ; menu ;;
            5) all_checks ; menu ;;
            0) exit 0 ;;
            *) echo -e $red"Opção errada."$clear; Comando Errado;;
        esac
}

# Call the menu function
menu
```

Para testar o script, crie um novo arquivo com a extensão `.sh`, por exemplo: `menu.sh` e execute-o:

```bash
bash menu.sh
```

A saída que você obterá será assim:

```bash
Meu primeiro cardápio
1) Uso de memória
2) Carga da CPU
3) Número de conexões TCP
4) Versão do kernel
5) Verifique tudo
0) Sair
Escolha uma opção:
```

Você poderá escolher uma opção diferente da lista e cada número chamará uma função diferente do script:

![Menu interativo Nice Bash](https://imgur.com/8EgxX4m.png)

## Conclusão

Agora você sabe como criar um menu Bash e implementá-lo em seus scripts para que os usuários possam selecionar valores diferentes!

>{notice} Este conteúdo foi postado inicialmente em [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-work-with-json-in-bash-using-jq)
