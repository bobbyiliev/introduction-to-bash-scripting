# Argumentos Bash

Você pode passar argumentos para seu script de shell ao executá-lo. Para passar um argumento, você só precisa escrevê-lo logo após o nome do seu script. Por exemplo:

```bash
./devdojo.sh com_seu_argumento
```

No script, podemos usar `$1` para referenciar o primeiro argumento que especificamos.

Se passarmos um segundo argumento, ele estará disponível como `$2` e assim por diante.

Vamos criar um pequeno script chamado `arguments.sh` como exemplo:

```bash
#!/bin/bash

echo "O argumento um é $1"
echo "O argumento dois é $2"
echo "O argumento três é $3"
```

Salve o arquivo e torne-o executável:

```bash
chmod +x argumentos.sh
```

Em seguida, execute o arquivo e passe **3** argumentos:

```bash
./arguments.sh cachorro gato ave
```

A saída que você obteria seria:

```bash
Argumento um é cachorro
Argumento dois é gato
Argumento três é ave
```

Para referenciar todos os argumentos, você pode usar `$@`:

```bash
#!/bin/bash

echo "Todos os argumentos: $@"
```

Se você executar o script novamente:

```bash
./argumentos.sh cachorro gato ave
```

Você obterá a seguinte saída:

```
Todos os argumentos: cachorro gato ave
```

Outra coisa que você precisa ter em mente é que `$0` é usado para referenciar o próprio script.

Esta é uma excelente maneira de criar a autodestruição do arquivo se você precisar ou apenas obter o nome do script.

Por exemplo, vamos criar um script que imprima o nome do arquivo e exclua o arquivo depois disso:

```bash
#!/bin/bash

echo "O nome do arquivo é: $0 e será auto-excluído."

rm -f $ 0
```

Você precisa ter cuidado com a autoexclusão e garantir que você tenha o backup do script antes de excluí-lo automaticamente.
