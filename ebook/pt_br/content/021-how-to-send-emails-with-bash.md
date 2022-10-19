# Enviando e-mails com Bash e SSMTP

SSMTP é uma ferramenta que entrega emails de um computador ou servidor para um host de email configurado.

O SSMTP não é um servidor de e-mail em si e não recebe e-mails nem gerencia uma fila.

Um de seus principais usos é encaminhar e-mails automatizados (como alertas do sistema) para fora de sua máquina e para um endereço de e-mail externo.

## Pré-requisitos

Você precisaria das seguintes coisas para poder concluir este tutorial com sucesso:

* Acesso a um servidor Ubuntu 18.04 como usuário não root com privilégios sudo e um firewall ativo instalado em seu servidor. Para configurá-los, consulte nosso [Guia de configuração inicial do servidor para Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)

* Um servidor SMTP junto com o nome de usuário e a senha SMTP, isso também funcionaria com o servidor SMTP do Gmail, ou você pode configurar seu próprio servidor SMTP seguindo as etapas deste tutorial em [<https://www.digitalocean.com/community/> tutoriais/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04](Como instalar e configurar o Postfix como um servidor SMTP somente para envio no Ubuntu 16.04)

## Instalando o SSMTP

Para instalar o SSMTP, você precisará primeiro atualizar seu cache apt com:

```bash
sudo apt update
```

Em seguida, execute o seguinte comando para instalar o SSMTP:

```bash
sudo apt install ssmtp
```

Outra coisa que você precisaria instalar é o `mailutils`, para isso execute o seguinte comando:

```bash
sudo apt install mailutils
```

## Configurando o SSMTP

Agora que você tem o `ssmtp` instalado, para configurá-lo para usar seu servidor SMTP ao enviar e-mails, você precisa editar o arquivo de configuração SSMTP.

Usando seu editor de texto favorito abra o arquivo `/etc/ssmtp/ssmtp.conf`:

```bash
sudo nano /etc/ssmtp/ssmtp.conf
```

Você precisa incluir a configuração do seu SMTP:

```
root=postmaster
mailhub=<^>seu_smtp_host.com<^>:587
hostname=<^>seu_hostname<^>
AuthUser=<^>seu_gmail_username@your_smtp_host.com<^>
AuthPass=<^>sua_gmail_senha<^>
FromLineOverride=YES
UseSTARTTLS=YES
```

Salve o arquivo e saia.

## Enviando e-mails com SSMTP

Feita a configuração, para enviar um e-mail basta executar o seguinte comando:

```bash
echo "<^>Aqui adicione o corpo do seu email<^>" | mail -s "<^>Aqui especifique o assunto do seu e-mail<^>" <^>seu_receptor_email@seudominio.com<^>
```

Você pode executar isso diretamente em seu terminal ou incluí-lo em seus scripts bash.

## Enviando um arquivo com SSMTP (opcional)

Se você precisar enviar arquivos como anexos, você pode usar `mpack`.

Para instalar o `mpack` execute o seguinte comando:

```bash
sudo apt install mpack
```

Em seguida, para enviar um email com um arquivo anexado, execute o seguinte comando.

```bash
mpack -s "<^>Seu assunto aqui<^>" your_file.zip <^>your_recepient_email@yourdomain.com<^>
```

O comando acima enviaria um email para `<^>your_recepient_email@yourdomain.com<^>` com o `<^>your_file.zip<^>` anexado.

## Conclusão

O SSMTP é uma maneira excelente e confiável de implementar a funcionalidade de email SMTP diretamente em scripts bash.

Para obter mais informações sobre o SSMTP, recomendo verificar a documentação oficial [aqui](https://wiki.archlinux.org/index.php/SSMTP).

>{notice} Este conteúdo foi postado inicialmente no [fórum da comunidade DigitalOcean](https://www.digitalocean.com/community/questions/how-to-send-emails-from-a-bash-script-using-ssmtp ).
