# Executando scripts BASH em vários servidores remotos

Qualquer comando que você possa executar a partir da linha de comando pode ser usado em um script bash. Os scripts são usados ​​para executar uma série de comandos. O Bash está disponível por padrão nos sistemas operacionais Linux e macOS.

Vamos ter um cenário hipotético em que você precisa executar um script BASH em vários servidores remotos, mas não deseja copiar manualmente o script para cada servidor, fazer login novamente em cada servidor individualmente e só então executar o script.

Claro que você poderia usar uma ferramenta como o Ansible, mas vamos aprender como fazer isso com o Bash!

# Executando scripts BASH em vários servidores remotos

Qualquer comando que você possa executar a partir da linha de comando pode ser usado em um script bash. Os scripts são usados ​​para executar uma série de comandos. O Bash está disponível por padrão nos sistemas operacionais Linux e macOS.

Vamos ter um cenário hipotético em que você precisa executar um script BASH em vários servidores remotos, mas não deseja copiar manualmente o script para cada servidor, fazer login novamente em cada servidor individualmente e só então executar o script.

## Pré-requisitos

Para este exemplo, usarei 3 servidores Ubuntu remotos implantados na DigitalOcean. Se você ainda não tem uma conta da Digital Ocean, pode se inscrever na DigitalOcean e obter US$ 100 de crédito grátis por meio deste link de referência aqui:

[https://m.do.co/c/2a9bba940f39](https://m.do.co/c/2a9bba940f39)

Depois de ter sua conta Digital Ocean pronta, vá em frente e implante 3 droplets.

Eu fui em frente e criei 3 servidores Ubuntu:

![Servidores DigitalOcean Ubuntu](https://imgur.com/09xmq41.png)

Vou colocar os IPs desses servidores em um arquivo `servers.txt` que eu usaria para fazer um loop com nosso script Bash.

Se você é novo na DigitalOcean, pode seguir os passos sobre como criar um Droplet aqui:

* [Como criar um Droplet no Painel de controle da DigitalOcean](https://www.digitalocean.com/docs/droplets/how-to/create/)

Você também pode seguir as etapas deste vídeo aqui sobre como fazer a configuração inicial do servidor:

* [Como fazer a configuração inicial do servidor com o Ubuntu](https://youtu.be/7NL2_4HIgKU)

Ou melhor ainda, você pode seguir este artigo aqui sobre como automatizar sua configuração inicial de servidor com o Bash:

[Automatizando a configuração inicial do servidor com o Ubuntu 18.04 com Bash](https://www.digitalocean.com/community/tutorials/automating-initial-server-setup-with-ubuntu-18-04)

Com os 3 novos servidores instalados, podemos seguir em frente e focar na execução do nosso script Bash em todos eles com um único comando!

## O script BASH

Vou reutilizar o script de demonstração do capítulo anterior com algumas pequenas alterações. Ele simplesmente executa algumas verificações como o uso atual da memória, o uso atual da CPU, o número de conexões TCP e a versão do kernel.

```bash
#!/bin/bash

##
# script BASH que verifica o seguinte:
# - Uso de memória
# - carga da CPU
# - Número de conexões TCP
# - Versão do kernel
##

##
# Verificação de memória
##
server_name=$(hostname)

função memory_check() {
    echo "#######"
    echo "O uso atual de memória em ${server_name} é: "
    free -h
    echo "#######"
}


function cpu_check() {
    echo "#######"
    echo "A carga atual da CPU em ${server_name} é: "
    eco ""
    uptime
    echo "#######"
}

function tcp_check() {
    echo "#######"
    echo "Total de conexões TCP em ${server_name}: "
    echo ""
    cat /proc/net/tcp | wc -l
    echo "#######"
}

function kernel_check() {
    echo "#######"
    echo "A versão exata do Kernel em ${server_name} é: "
    echo ""
    uname -r
    echo "#######"
}

function all_checks() {
    memory_check
    cpu_check
    tcp_check
    kernel_check
}

all_checks
```

Copie o código abaixo e adicione-o em um arquivo chamado `remote_check.sh`. Você também pode obter o script [aqui](https://devdojo.com/bobbyiliev/executing-bash-script-on-multiple-remote-server).

## Executando o Script em todos os Servidores

Agora que temos o script e os servidores prontos e que adicionamos esses servidores em nosso arquivo servers.txt, podemos executar o seguinte comando para percorrer todos os servidores e executar o script remotamente sem ter que copiar o script para cada servidor e conectar individualmente a cada servidor.

```bash
for server in $(cat servers.txt) ; do ssh your_user@${server} 'bash -s' < ./remote_check.sh ; done
```

O que esse loop for faz é passar por cada servidor no arquivo servers.txt e, em seguida, executa o seguinte comando para cada item da lista:

```bash
ssh your_user@the_server_ip 'bash -s' < ./remote_check.sh
```

Você obteria a seguinte saída:

![Executando script bash em vários servidores remotos](https://imgur.com/B1AmhUP.png)

## Conclusão

Este é apenas um exemplo muito simples de como executar um script simples em vários servidores sem ter que copiar o script para cada servidor e sem ter que acessar os servidores individualmente.

Claro que você poderia executar um script muito mais complexo e em muitos outros servidores.

Se você estiver interessado em automação, recomendo verificar a página de recursos do Ansible no site da DigitalOcean:

[Recursos do Ansible](https://www.digitalocean.com/community/tags/ansible)

>{notice} Este conteúdo foi postado inicialmente no [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)
