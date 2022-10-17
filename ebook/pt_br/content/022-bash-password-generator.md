# Script Bash do Gerador de Senhas

Não é incomum uma situação em que você precisará gerar uma senha aleatória que possa ser usada para qualquer instalação de software ou quando você se inscrever em qualquer site.

Existem muitas opções para conseguir isso. Você pode usar um gerenciador de senhas/cofre onde geralmente tem a opção de gerar uma senha aleatoriamente ou usar um site que possa gerar a senha em seu nome.

Você também pode usar o Bash em seu terminal (linha de comando) para gerar uma senha que você pode usar rapidamente. Existem muitas maneiras de conseguir isso e vou me certificar de cobrir algumas delas e deixar para você escolher qual opção é mais adequada às suas necessidades.

## :aviso: Segurança

**Este script destina-se a praticar suas habilidades de script bash. Você pode se divertir enquanto faz projetos simples com o BASH, mas a segurança não é brincadeira, portanto, certifique-se de não salvar suas senhas em texto simples em um arquivo local ou anotá-las à mão em um pedaço de papel.**

**Recomendarei a todos que usem provedores seguros e confiáveis ​​para gerar e salvar as senhas.**

## Resumo do roteiro

Deixe-me primeiro fazer um resumo rápido do que nosso script vai fazer.:

1. Teremos a opção de escolher o tamanho dos caracteres da senha quando o script for executado.
2. O script gerará 5 senhas aleatórias com o comprimento especificado na etapa 1

## Pré-requisitos

Você precisaria de um terminal bash e um editor de texto. Você pode usar qualquer editor de texto como vi, vim, nano ou Visual Studio Code.

Estou executando o script localmente no meu laptop Linux, mas se você estiver usando o Windows PC, poderá executar o ssh em qualquer servidor de sua escolha e executar o script lá.

Embora o script seja bastante simples, ter algum conhecimento básico de script BASH ajudará você a entender melhor o script e como ele está funcionando.

## Gerar uma senha aleatória

Um dos grandes benefícios do Linux é que você pode fazer muitas coisas usando métodos diferentes. Quando se trata de gerar uma string aleatória de caracteres, também não é diferente.

Você pode usar vários comandos para gerar uma sequência aleatória de caracteres. Vou cobrir alguns deles e fornecer alguns exemplos.

- Usando o comando ```date```.
O comando date produzirá a data e hora atuais. No entanto, também manipulamos ainda mais a saída para usá-la como senha gerada aleatoriamente. Podemos fazer o hash da data usando md5, sha ou apenas executá-la em base64. Estes são alguns exemplos:

```
date | md5sum
94cb1cdecfed0699e2d98acd9a7b8f6d -
```

usando sha256sum:

```
date | sha256sum
30a0c6091e194c8c7785f0d7bb6e1eac9b76c0528f02213d1b6a5fbcc76ceff4 -
```

usando base64:

```
date | base64
0YHQsSDRj9C90YMgMzAgMTk6NTE6NDggRUVUIDIwMjEK
```

- Também podemos usar openssl para gerar bytes pseudo-aleatórios e executar a saída através de base64. Uma saída de exemplo será:

```
openssl rand -base64 10
9+soM9bt8mhdcw==
```

Tenha em mente que o openssl pode não estar instalado em seu sistema, então é provável que você precise instalá-lo primeiro para usá-lo.

- A maneira mais preferida é usar o gerador de números pseudoaleatórios - /dev/urandom
uma vez que se destina à maioria dos propósitos criptográficos. Também precisaríamos manipular a saída usando ```tr``` para traduzi-la. Um exemplo de comando é:

```
tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n 1
```

Com este comando pegamos a saída de /dev/urandom e traduzimos com ```tr``` enquanto usamos todas as letras e dígitos e imprimimos o número desejado de caracteres.

## O script

Primeiro começamos o script com o shebang. Nós o usamos para informar ao sistema operacional qual interpretador usar para analisar o restante do arquivo.

```
#!/bin/bash
```

Podemos então continuar e pedir ao usuário alguma entrada. Neste caso, gostaríamos de saber quantos caracteres a senha precisa ter:

```
# Pedir ao usuário o comprimento da senha
clear
printf "\n"
read -p "How many characters you would like the password to have? " pass_length
printf "\n"
```

Gere as senhas e imprima-as para que o usuário possa usá-las.

```
# É aqui que a mágica acontece!
# Gera uma lista de 10 strings e corta para o valor desejado fornecido pelo usuário

for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${pass_lenght} | head -n 1); done

# Imprime as strings
printf "$pass_output\n"
printf "Goodbye, ${USER}\n"
```

## O script completo

```
#!/bin/bash
#=======================================
# Gerador de senhas com opção de login
#=======================================


# Pergunta ao usuário o comprimento da string
Claro
clear
printf "\n"
read -p "How many characters you would like the password to have? " pass_length
printf "\n"


# É aqui que a mágica acontece!
# Gera uma lista de 10 strings e corta para o valor desejado fornecido pelo usuário

for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${pass_lenght} | head -n 1); done

# Imprime as strings
printf "$pass_output\n"
printf "Goodbye, ${USER}\n"
```

## Conclusão

É basicamente assim que você pode usar um script bash simples para gerar senhas aleatórias.

:aviso: **Como já mencionado, certifique-se de usar senhas fortes para garantir que sua conta esteja protegida. Além disso, sempre que possível, use a autenticação de dois fatores, pois isso fornecerá uma camada adicional de segurança para sua conta.**

Enquanto o script está funcionando bem, ele espera que o usuário forneça a entrada solicitada. Para evitar quaisquer problemas, você precisaria fazer algumas verificações mais avançadas na entrada do usuário para garantir que o script continue funcionando bem, mesmo que a entrada fornecida não corresponda às nossas necessidades.

## Contribuído por

[Alex Georgiev](https://twitter.com/alexgeorgiev17)
