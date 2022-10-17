# Trabalhando com a API Cloudflare com Bash

Hospedo todos os meus sites no **DigitalOcean** Droplets e também uso o Cloudflare como meu provedor de CDN. Um dos benefícios de usar o Cloudflare é que ele reduz o tráfego geral para o usuário e também oculta o endereço IP do servidor real atrás da CDN.

Meu recurso favorito da Cloudflare é a proteção gratuita contra DDoS. Ele salvou meus servidores várias vezes de diferentes ataques DDoS. Eles têm uma API legal que você pode usar para habilitar e desabilitar facilmente a proteção contra DDoS.

Este capítulo vai ser um exercício! Eu desafio você a escrever um script bash curto que habilitaria e desabilitaria a proteção DDoS da Cloudflare para seu servidor automaticamente, se necessário!

## Pré-requisitos

Antes de seguir este guia aqui, configure sua conta Cloudflare e prepare seu site. Se você não tiver certeza de como fazer isso, siga estas etapas aqui: [Crie uma conta Cloudflare e adicione um site](<https://support.cloudflare.com/hc/en-us/articles/201720164-Step-2> -Criar-uma-conta-Cloudflare-e-adicionar-um-site).

Depois de ter sua conta Cloudflare, certifique-se de obter as seguintes informações:

* Uma conta Cloudflare
* Chave de API Cloudflare
* ID da zona Cloudflare

Além disso, verifique se o curl está instalado em seu servidor:

```bash
curl --version
```

Se o curl não estiver instalado, você precisará executar o seguinte:

* Para RedHat/CentOs:

```bash
yum install curl
```

* Para Debian/Ubuntu

```bash
apt-get install curl
```

## Desafio - Requisitos de script

O script precisa monitorar o uso da CPU em seu servidor e, se o uso da CPU ficar alto com base no número de vCPU, ele habilitará a proteção DDoS da Cloudflare automaticamente por meio da API da Cloudflare.

As principais características do script devem ser:

* Verifica a carga da CPU do script no servidor
* No caso de um pico de CPU, o script aciona uma chamada de API para a Cloudflare e habilita o recurso de proteção DDoS para a zona especificada
* Após a carga da CPU voltar ao normal, o script desabilitaria a opção "Estou sob ataque" e a definiria de volta ao normal

## Script de exemplo

Eu já preparei um script de demonstração que você pode usar como referência. Mas eu encorajo você a tentar escrever o script primeiro e só então dar uma olhada no meu script!

Para baixar o script basta executar o seguinte comando:

```bash
wget https://raw.githubusercontent.com/bobbyiliev/cloudflare-ddos-protection/main/protection.sh
```

Abra o script com seu editor de texto favorito:

```bash
nano protection.sh
```

E atualize os seguintes detalhes com seus detalhes do Cloudflare:

```bash
CF_CONE_ID=YOUR_CF_ZONE_ID
CF_EMAIL_ADDRESS=YOUR_CF_EMAIL_ADDRESS
CF_API_KEY=YOUR_CF_API_KEY
```

Depois disso, torne o script executável:

```bash
chmod +x ~/protection.sh
```

Por fim, configure 2  Cron Jobs para serem executados a cada 30 segundos. Para editar seu crontab execute:

```bash
crontab -e
```

E adicione o seguinte conteúdo:

```bash
* * * * * /path-to-the-script/cloudflare/protection.sh
* * * * * ( sleep 30 ; /path-to-the-script/cloudflare/protection.sh )
```

Observe que você precisa alterar o caminho para o script com o caminho real em que armazenou o script.

## Conclusão

Esta é uma solução bastante direta e econômica, uma das desvantagens do script é que, se o servidor não responder devido a um ataque, o script pode não ser acionado.

Claro, uma abordagem melhor seria usar um sistema de monitoramento como o Nagios e, com base nas estatísticas do sistema de monitoramento, você pode acionar o script, mas esse desafio de script pode ser uma boa experiência de aprendizado!

Aqui está outro ótimo recurso sobre como usar a API Discord e enviar notificações para seu canal Discord com um script Bash:

[Como usar o Discord Webhooks para obter notificações para o status do seu site no Ubuntu 18.04](<https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for>- seu-site-status-on-ubuntu-18-04)

>{notice} Este conteúdo foi postado inicialmente no [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-automatically-enable-cloudflare-ddos-protection)
