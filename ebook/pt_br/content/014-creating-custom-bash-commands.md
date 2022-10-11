# Criando comandos bash personalizados

Como desenvolvedor ou administrador do sistema, você pode ter que passar muito tempo em seu terminal. Eu sempre tento procurar maneiras de otimizar quaisquer tarefas repetitivas.

Uma maneira de fazer isso é escrever scripts bash curtos ou criar comandos personalizados também conhecidos como aliases. Por exemplo, em vez de digitar um comando muito longo toda vez, você pode simplesmente criar um atalho para ele.

## Exemplo

Vamos começar com o seguinte cenário, como administrador do sistema, você pode ter que verificar as conexões com seu servidor web com bastante frequência, então usarei o comando `netstat` como exemplo.

O que eu normalmente faço quando acesso um servidor que está tendo problemas com as conexões à porta 80 ou 443 é verificar se há algum serviço escutando nessas portas e o número de conexões nas portas.

O seguinte comando `netstat` nos mostraria quantas conexões TCP nas portas 80 e 443 temos atualmente:

```bash
netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l
```

Este é um comando bastante longo, portanto, digitá-lo sempre pode ser demorado a longo prazo, especialmente quando você deseja obter essas informações rapidamente.

Para evitar isso, podemos criar um alias, então, em vez de digitar o comando inteiro, podemos simplesmente digitar um comando curto. Por exemplo, digamos que queríamos poder digitar `conn` (abreviação de conexões) e obter as mesmas informações. Tudo o que precisamos fazer neste caso é executar o seguinte comando:

```bash
alias conn="netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Dessa forma, estamos criando um alias chamado `conn` que seria essencialmente um 'atalho' para nosso longo comando `netstat`. Agora, se você executar apenas `conn`:

```bash
conn
```

Você obteria a mesma saída que o comando longo `netstat`.
Você pode ser ainda mais criativo e adicionar algumas mensagens informativas como esta aqui:

```bash
alias conn="echo 'Total de conexões na porta 80 e 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Agora, se você executar `conn`, obterá a seguinte saída:

```bash
Total de conexões na porta 80 e 443:
12
```

Agora, se você sair e entrar novamente, seu alias será perdido. Na próxima etapa, você verá como tornar isso persistente.

## Tornando a mudança persistente

Para tornar a alteração persistente, precisamos adicionar o comando `alias` em nosso arquivo de perfil do shell.

Por padrão no Ubuntu este seria o arquivo `~/.bashrc`, para outros sistemas operacionais pode ser o arquivo `~/.bash_profle`. Com seu editor de texto favorito abra o arquivo:

```bash
nano ~/.bashrc
```

Vá para a parte inferior e adicione o seguinte:

```bash
alias conn="echo 'Total de conexões na porta 80 e 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Salve e depois saia.

Dessa forma, agora, mesmo que você faça logout e faça login novamente, sua alteração persistirá e você poderá executar seu comando bash personalizado.

## Listando todos os aliases disponíveis

Para listar todos os aliases disponíveis para seu shell atual, basta executar o seguinte comando:

```bash
alias
```

Isso seria útil caso você esteja vendo algum comportamento estranho com alguns comandos.

## Conclusão

Essa é uma maneira de criar comandos bash personalizados ou aliases bash.

Claro, você poderia realmente escrever um script bash e adicionar o script dentro de sua pasta `/usr/bin`, mas isso não funcionaria se você não tivesse acesso root ou sudo, enquanto com aliases você pode fazer isso sem a necessidade de acesso root.

>{notice} Isso foi postado inicialmente em [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-create-custom-bash-commands)
