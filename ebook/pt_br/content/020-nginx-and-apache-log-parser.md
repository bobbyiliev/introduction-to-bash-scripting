# Analisador de script BASH para resumir seus logs de acesso NGINX e Apache

Uma das primeiras coisas que eu normalmente faria caso eu notasse um alto uso de CPU em alguns dos meus servidores Linux seria verificar a lista de processos com top ou htop e caso eu notasse muito processo Apache ou Nginx eu verificaria rapidamente meus logs de acesso para determinar o que causou ou está causando o pico de CPU no meu servidor ou para descobrir se algo malicioso está acontecendo.

Às vezes, a leitura dos logs pode ser bastante intimidante, pois o log pode ser enorme e fazer isso manualmente pode levar muito tempo. Além disso, o formato de log bruto pode ser confuso para pessoas com menos experiência.

Assim como o capítulo anterior, este capítulo será um desafio! Você precisa escrever um script bash curto que resuma todo o log de acesso para você sem a necessidade de instalar nenhum software adicional.

# Requisitos do script

Este script BASH precisa analisar e resumir seus logs de acesso e fornecer informações muito úteis, como:

* As 20 principais páginas com mais solicitações POST
* As 20 principais páginas com mais solicitações GET
* Os 20 principais endereços IP e sua localização geográfica

## Script de exemplo

Eu já preparei um script de demonstração que você pode usar como referência. Mas eu encorajo você a tentar escrever o script primeiro e só então dar uma olhada no meu script!

Para baixar o script, você pode clonar o repositório com o seguinte comando:

```bash
git clone https://github.com/bobbyiliev/quick_access_logs_summary.git
```

Ou execute o seguinte comando que faria o download do script em seu diretório atual:

```bash
wget https://raw.githubusercontent.com/bobbyiliev/quick_access_logs_summary/master/spike_check
```

O script não faz nenhuma alteração no seu sistema, ele apenas lê o conteúdo do seu log de acesso e o resume para você, no entanto, depois de baixar o arquivo, certifique-se de revisar o conteúdo você mesmo.

## Executando o script

Tudo o que você precisa fazer após o download do script é torná-lo executável e executá-lo.

Para fazer isso, execute o seguinte comando para tornar o script executável:

```bash
chmod +x spike_check
```

Em seguida, execute o script:

```bash
./spike_check /path/to/your/access_log
```

Certifique-se de alterar o caminho para o arquivo com o caminho real para o log de acesso. Por exemplo, se você estiver usando o Apache em um servidor Ubuntu, o comando exato ficaria assim:

```bash
./spike_check /var/log/apache2/access.log
```

Se você estiver usando o Nginx, o comando exato seria quase o mesmo, mas com o caminho para o log de acesso do Nginx:

```bash
./spike_check /var/log/nginx/access.log
```

## Entendendo a saída

Depois de executar o script, pode demorar um pouco dependendo do tamanho do log.

A saída que você veria deve ser assim:

![Registro de acesso resumido](https://imgur.com/WWHVMrj.png)

Essencialmente, o que podemos dizer neste caso é que recebemos 16 solicitações POST para nosso arquivo xmlrpc.php, que é frequentemente usado por invasores para tentar explorar sites WordPress usando várias combinações de nome de usuário e senha.

Neste caso específico, este não foi um grande ataque de força bruta, mas nos dá uma indicação antecipada e podemos tomar medidas para evitar um ataque maior no futuro.

Também podemos ver que havia alguns endereços IP russos acessando nosso site, portanto, caso você não espere nenhum tráfego da Rússia, bloqueie esses endereços IP também.

## Conclusão

Este é um exemplo de um script BASH simples que permite resumir rapidamente seus logs de acesso e determinar se algo malicioso está acontecendo.

Claro, você também pode querer passar manualmente pelos logs, mas é um bom desafio tentar automatizar isso com o Bash!

>{notice} Este conteúdo foi postado inicialmente no [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)
