# Condicionais Bash

Na última seção, abordamos algumas das expressões condicionais mais populares. Agora podemos usá-los com instruções condicionais padrão como instruções `if`, `if-else` e ​​`switch case`.

## Declaração Se (if)

O formato de uma instrução `if` no Bash é o seguinte:

```bash
if [[ algum_teste ]]
then
    <comandos>
fi
```

Aqui está um exemplo rápido que pediria para você digitar seu nome caso você o tenha deixado em branco:

```bash
#!/bin/bash

# Bash if exemplo de instrução

read -p "Qual é o seu nome?" name

if [[ -z ${name} ]]
then
    echo "Por favor, digite seu nome!"
fi
```

## Instrução Se Senão (If Else)

Com uma instrução `if-else`, você pode especificar uma ação caso a condição na instrução `if` não corresponda. Podemos combinar isso com as expressões condicionais da seção anterior da seguinte forma:

```bash
#!/bin/bash

# Bash if exemplo de instrução

read -p "Qual é o seu nome?" name

if [[ -z ${name} ]]
then
    echo "Por favor, digite seu nome!"
else
    echo "Olá ${name}"
fi
```

Você pode usar a instrução if acima com todas as expressões condicionais dos capítulos anteriores:

```bash
#!/bin/bash

admin="devdojo"

read -p "Digite seu nome de usuário?" nome_de_usuario

# Verifique se o nome de usuário fornecido é o admin

if [[ "${nome_de_usuario}" == "${admin}" ]] ; then
    echo "Você é o usuário administrador!"
else
    echo "Você NÃO é o usuário administrador!"
fi
```

Aqui está outro exemplo de uma instrução `if` que verificaria seu `User ID` atual e não permitiria que você executasse o script como o usuário `root`:

```bash
#!/bin/bash

if (( $EUID == 0 )); then
    echo "Por favor, não execute como root"
    exit
fi
```

Se você colocar isso no topo do seu script, ele sairá caso o EUID seja 0 e não execute o resto do script. Isso foi discutido no [fórum da comunidade DigitalOcean](https://www.digitalocean.com/community/questions/how-to-check-if-running-as-root-in-a-bash-script).

Você também pode testar várias condições com uma instrução `if`. Neste exemplo, queremos ter certeza de que o usuário não é o usuário administrador nem o usuário root para garantir que o script seja incapaz de causar muitos danos. Usaremos o operador `or` neste exemplo, indicado por `||`. Isso significa que qualquer uma das condições precisa ser verdadeira. Se usássemos o operador `and` de `&&`, ambas as condições precisariam ser verdadeiras.

```bash
#!/bin/bash

admin="devdojo"

read -p "Digite seu nome de usuário?" nome_de_usuario

# Verifique se o nome de usuário fornecido é o admin

if [[ "${nome_de_usuario}" != "${admin}" ]] || [[ $EUID != 0 ]] ; then
    echo "Você não é o administrador ou usuário root, mas por favor, esteja seguro!"
else
    echo "Você é o usuário administrador! Isso pode ser muito destrutivo!"
fi
```

Se você tiver várias condições e cenários, pode usar a instrução `elif` com instruções `if` e `else`.

```bash
#!/bin/bash

read -p "Digite um número: " num

if [[ $num -gt 0 ]] ; then
    echo "O número é positivo"
elif [[ $num -lt 0 ]] ; then
    echo "O número é negativo"
else
    echo "O número é 0"
fi
```

## Instruções Switch Case

Como em outras linguagens de programação, você pode usar uma instrução `case` para simplificar condicionais complexas quando houver várias opções diferentes. Então, em vez de usar algumas instruções `if` e `if-else`, você pode usar uma única instrução `case`.

A sintaxe da instrução Bash `case` se parece com isso:

```bash
caso $alguma_variável in

  padrão_1)
    comandos
    ;;

  padrão_2| padrão_3)
    comandos
    ;;

  *)
    comandos padrão
    ;;
esac
```

Um rápido resumo da estrutura:

* Todas as instruções `case` começam com a palavra-chave `case`.
* Da mesma forma que a palavra-chave `case`, você precisa especificar uma variável ou uma expressão seguida pela palavra-chave `in`.
* Depois disso, você tem seus padrões `case`, onde você precisa usar `)` para identificar o final do padrão.
* Você pode especificar vários padrões divididos por uma barra vertical: `|`.
* Após o padrão, você especifica os comandos que deseja que sejam executados caso o padrão corresponda à variável ou à expressão que você especificou.
* Todas as cláusulas devem ser encerradas adicionando `;;` no final.
* Você pode ter uma declaração padrão adicionando um `*` como padrão.
* Para fechar a instrução `case`, use a palavra-chave `esac` (case typed backward).

Aqui está um exemplo de uma instrução Bash `case`:

```bash
#!/bin/bash

read -p "Digite o nome da marca do seu carro: " carro

case $carro in

  Tesla)
    echo -n "A fábrica de carros de ${carro} está nos EUA."
    ;;

  BMW | Mercedes | Audi | Porsche)
    echo -n "A fábrica de carros de ${carro} fica na Alemanha."
    ;;

  Toyota | Mazda | Mitsubishi | Subaru)
    echo -n "A fábrica de carros de ${carro} está no Japão."
    ;;

  *)
    echo -n "${carro} é uma marca de carro desconhecida"
    ;;

esac
```

Com este script, pedimos ao usuário que insira o nome de uma marca de carro como Telsa, BMW, Mercedes e etc.

Em seguida, com uma declaração `case`, verificamos o nome da marca e se corresponde a algum de nossos padrões e, em caso afirmativo, imprimimos a localização da fábrica.

Se o nome da marca não corresponder a nenhuma de nossas declarações `case`, imprimimos uma mensagem padrão: `uma marca de carro desconhecida`.

## Conclusão

Aconselho você a tentar modificar o roteiro e brincar um pouco com ele para que possa praticar o que acabou de aprender nos dois últimos capítulos!

Para mais exemplos de instruções `case` do Bash, certifique-se de verificar o capítulo 16, onde criaríamos um menu interativo no Bash usando uma instrução `cases` para processar a entrada do usuário.
