# Variáveis ​​Bash

Como em qualquer outra linguagem de programação, você também pode usar variáveis ​​no Bash Scripting. No entanto, não há tipos de dados e uma variável no Bash pode conter números e caracteres.

Para atribuir um valor a uma variável, tudo que você precisa fazer é usar o sinal `=`:

```bash
name="DevDojo"
```

>{notice} como uma nota importante, você não pode ter espaços antes e depois do sinal `=`.

Depois disso, para acessar a variável, você deve usar o `$` e referenciá-la conforme mostrado abaixo:

```bash
echo $name
```

Colocar o nome da variável entre colchetes não é obrigatório, mas é considerado uma boa prática, e eu aconselho você a usá-los sempre que puder:

```bash
eco ${nome}
```

O código acima produziria: `DevDojo` pois este é o valor da nossa variável `name`.

Em seguida, vamos atualizar nosso script `devdojo.sh` e incluir uma variável nele.

Novamente, você pode abrir o arquivo `devdojo.sh` com seu editor de texto favorito, estou usando o nano aqui para abrir o arquivo:

```bash
nano devdojo.sh
```

Adicionando nossa variável `name` no arquivo, com uma mensagem de boas vindas. Nosso arquivo agora está assim:

```bash
#!/bin/bash

name="DevDojo"

echo "Hello $nome"
```

Salve-o e execute o arquivo usando o comando abaixo:

```bash
./devdojo.sh
```

Você veria a seguinte saída na tela:

```bash
Hello DevDojo
```

Aqui está um resumo do script escrito no arquivo:

* `#!/bin/bash` - Inicialmente, especificamos nosso shebang.
* `name=DevDojo` - Em seguida, definimos uma variável chamada `name` e atribuímos um valor a ela.
* `echo "Hi there $name"` - Finalmente, nós mostramos o conteúdo da variável na tela como uma mensagem de boas-vindas usando `echo`

Você também pode adicionar várias variáveis ​​no arquivo, conforme mostrado abaixo:

```bash
#!/bin/bash

name="DevDojo"
greeting="Hello"

echo "$greeting $name"
```

Salve o arquivo e execute-o novamente:

```bash
./devdojo.sh
```

Você veria a seguinte saída na tela:

```bash
Hello DevDojo
```

Observe que você não precisa necessariamente adicionar ponto e vírgula `;` no final de cada linha. Funciona nos dois sentidos, um pouco como outras linguagens de programação, como JavaScript!
