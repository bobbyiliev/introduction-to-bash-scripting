# Trabalhe com JSON em BASH usando jq

A ferramenta de linha de comando `jq` é um processador **JSON** de linha de comando leve e flexível. É ótimo para analisar a saída JSON no BASH.

Uma das grandes coisas sobre o `jq` é que ele é escrito em C portátil e tem zero dependências de tempo de execução. Tudo o que você precisa fazer é baixar um único binário ou usar um gerenciador de pacotes como o apt e instalá-lo com um único comando.

## Planejando o script

Para a demonstração neste tutorial, eu usaria uma API REST externa que retorna uma saída JSON simples chamada [QuizAPI](https://quizapi.io/):

> [https://quizapi.io/](https://quizapi.io/)

Se você quiser acompanhar, certifique-se de obter uma chave de API gratuita aqui:

> [https://quizapi.io/clientarea/settings/token](https://quizapi.io/clientarea/settings/token)

O QuizAPI é gratuito para desenvolvedores.

## Instalando o jq

Existem muitas maneiras de instalar o `jq` em seu sistema. Uma das maneiras mais diretas de fazer isso é usar o gerenciador de pacotes, dependendo do seu sistema operacional.

Aqui está uma lista dos comandos que você precisaria usar dependendo do seu sistema operacional:

* Instale o jq no Ubuntu/Debian:

```bash
sudo apt-get install jq
```

* Instale o jq no Fedora:

```bash
sudo dnf install jq
```

* Instale o jq no openSUSE:

```bash
sudo zypper install jq
```

* Instale o jq no Arch:

```bash
sudo pacman -S jq
```

* Instalando no Mac com Homebrew:

```bash
brew install jq
```

* Instale no Mac com MacPort:

```bash
port install jq
```

Se você estiver usando outro sistema operacional, recomendo dar uma olhada na documentação oficial aqui para obter mais informações:

> [https://stedolan.github.io/jq/download/](https://stedolan.github.io/jq/download/)

Depois de instalar o jq, você pode verificar sua versão atual executando este comando:

```bash
jq --version
```

## Analisando JSON com jq

Depois de ter o `jq` instalado e sua chave de API do QuizAPI, você pode analisar a saída JSON do QuizAPI diretamente em seu terminal.

Primeiro, crie uma variável que armazene sua chave de API:

```bash
API_KEY=YOUR_API_KEY_HERE
```

Para obter alguma saída de um dos endpoints da QuizAPI, você pode usar o comando curl:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10"
```

Para uma saída mais específica, você pode usar o Gerador de URL QuizAPI aqui:

> [https://quizapi.io/api-config](https://quizapi.io/api-config)

Depois de executar o comando curl, a saída que você obteria ficaria assim:

![Saída Json bruta](https://imgur.com/KghOfzj.png)

Isso pode ser muito difícil de ler, mas graças à ferramenta de linha de comando jq, tudo o que precisamos fazer é canalizar o comando curl para jq e veríamos uma boa saída JSON formatada:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10" | jq
```

> Observe o `| jq` no final.

Nesse caso, a saída que você obteria seria algo assim:

![formatação bash jq](https://imgur.com/ebdTtVf.png)

Agora, isso parece muito mais bonito! A ferramenta de linha de comando jq formatou a saída para nós e adicionou algumas cores interessantes!

## Obtendo o primeiro elemento com jq

Digamos que queríamos apenas obter o primeiro elemento da saída JSON, para isso precisamos apenas especificar o índice que queremos ver com a seguinte sintaxe:

```bash
jq .[0]
```

Agora, se executarmos o comando curl novamente e canalizarmos a saída para jq .[0] assim:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10" | jq.[0]
```

Você obterá apenas o primeiro elemento e a saída ficará assim:

![jq obtém apenas o primeiro elemento](https://imgur.com/h9bFMAL.png)

## Obtendo um valor apenas para uma chave específica

Às vezes você pode querer obter apenas o valor de uma chave específica, digamos que em nosso exemplo o QuizAPI retorne uma lista de perguntas junto com as respostas, descrição e etc. ?

Isso vai ser bastante simples com `jq`, tudo que você precisa fazer é adicionar a chave após o comando jq, então ficaria algo assim:

```bash
jq .[].question
```

Temos que adicionar o `.[]` já que o QuizAPI retorna um array e especificando `.[]` dizemos ao jq que queremos obter o valor .question para todos os elementos do array.

A saída que você obteria ficaria assim:

![jq obtém um valor apenas para uma chave específica](https://imgur.com/0701wHD.png)

Como você pode ver, agora só recebemos as perguntas sem o restante dos valores.

## Usando jq em um script BASH

Vamos em frente e criar um pequeno script bash que deve gerar as seguintes informações para nós:

* Obtenha apenas a primeira pergunta da saída
* Obtenha todas as respostas para essa pergunta
* Atribuir as respostas às variáveis
* Imprima a pergunta e as respostas
* Para isso montei o seguinte script:

>{notice} certifique-se de alterar a parte API_KEY com sua chave QuizAPI real:

```bash
#!/bin/bash

##
# Faça uma chamada de API para QuizAPI e armazene a saída em uma variável
##
output=$(curl 'https://quizapi.io/api/v1/questions?apiKey=API_KEY&limit=10' 2>/dev/null)

##
#Receba apenas a primeira pergunta
##
output=$(echo $output | jq .[0])

##
#Receba a pergunta
##
question=$(echo $output | jq .question)

##
# Obtenha as respostas
##

answer_a=$(echo $output | jq .answers.answer_a)
answer_b=$(echo $output | jq .answers.answer_b)
answer_c=$(echo $output | jq .answers.answer_c)
answer_d=$(echo $output | jq .answers.answer_d)

##
# Saída da pergunta
##

echo "
Pergunta: ${question}

A) ${answer_a}
B) ${answer_b}
C) ${answer_c}
D) ${answer_d}

"
```

Se você executar o script, obterá a seguinte saída:

![Usando jq em um script bash](https://imgur.com/LKEsrbq.png)

Podemos ir além tornando isso interativo para que possamos escolher a resposta diretamente em nosso terminal.

Já existe um script bash que faz isso usando o QuizAPI e o `jq`:

Você pode dar uma olhada nesse script aqui:

* [https://github.com/QuizApi/QuizAPI-BASH/blob/master/quiz.sh](https://github.com/QuizApi/QuizAPI-BASH/blob/master/quiz.sh)

## Conclusão

A ferramenta de linha de comando `jq` é uma ferramenta incrível que lhe dá o poder de trabalhar com JSON diretamente em seu terminal BASH.

Dessa forma, você pode interagir facilmente com todos os tipos de APIs REST diferentes com o BASH.

Para mais informações, você pode dar uma olhada na documentação oficial aqui:

* [https://stedolan.github.io/jq/manual/](https://stedolan.github.io/jq/manual/)

E para mais informações sobre o **QuizAPI**, você pode dar uma olhada na documentação oficial aqui:

* [https://quizapi.io/docs/1.0/overview](https://quizapi.io/docs/1.0/overview)

>{notice} Este conteúdo foi postado inicialmente em [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-work-with-json-in-bash-using-jq)
