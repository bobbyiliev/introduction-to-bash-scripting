# Redirecionamento no Bash

Um superusuário Linux deve ter um bom conhecimento de pipes e redirecionamento no Bash. É um componente essencial do sistema e muitas vezes é útil no campo da Administração de Sistemas Linux.

Quando você executa um comando como ``ls``, ``cat``, etc, você obtém alguma saída no terminal. Se você escrever um comando errado, passar um sinalizador errado ou um argumento de linha de comando errado, você obterá uma saída de erro no terminal.
Em ambos os casos, você recebe algum texto. Pode parecer "apenas texto" para você, mas o sistema trata esse texto de forma diferente. Esse identificador é conhecido como Descritor de Arquivo (fd).

No Linux, existem 3 Descritores de Arquivo, **STDIN** (0); **STDOUT** (1) e **STDERR** (2).

* **STDIN** (fd: 0): Gerencia a entrada no terminal.
* **STDOUT** (fd: 1): Gerencia o texto de saída no terminal.
* **STDERR** (fd: 2): Gerencia o texto de erro no terminal.

# Diferença entre Pipes e Redirecionamentos

Ambos os *pipes* e *redirections* redirecionam os fluxos `(descritor de arquivo)` do processo que está sendo executado. A principal diferença é que os *redirecionamentos* lidam com o `fluxo de arquivos`, enviando o fluxo de saída para um arquivo ou enviando o conteúdo de um determinado arquivo para o fluxo de entrada do processo.

Por outro lado, um pipe conecta dois comandos enviando o fluxo de saída do primeiro para o fluxo de entrada do segundo. sem nenhum redirecionamento especificado.

# Redirecionamento no Bash

## STDIN (Entrada Padrão)

Quando você insere algum texto de entrada para um comando que o solicita, na verdade você está inserindo o texto no descritor de arquivo **STDIN**. Execute o comando ``cat`` sem nenhum argumento de linha de comando.
Pode parecer que o processo parou, mas na verdade é ``cat`` pedindo **STDIN**. ``cat`` é um programa simples e imprimirá o texto passado para **STDIN**. No entanto, você pode estender o caso de uso redirecionando a entrada para os comandos que usam **STDIN**.

Exemplo com ``cat``:

```
cat << EOF
Hello World!
How are you?
EOF
```

Isso simplesmente imprimirá o texto fornecido na tela do terminal:

```
Hello World!
How are you?
```

O mesmo pode ser feito com outros comandos que recebem entrada via STDIN. Tipo, ``wc``:

```
wc -l << EOF
Hello World!
How are you?
EOF
```

O sinalizador ``-l`` com ``wc`` conta o número de linhas.
Este bloco de código bash imprimirá o número de linhas na tela do terminal:

```
2
```

## STDOUT (Saída Padrão)

O texto normal sem erro na tela do terminal é impresso por meio do descritor de arquivo **STDOUT**. O **STDOUT** de um comando pode ser redirecionado para um arquivo, de forma que a saída do comando seja escrita em um arquivo ao invés de ser impressa na tela do terminal.
Isso é feito simplesmente com a ajuda dos operadores ``>`` e ``>>``.

Exemplo:

```
echo "Hello World!" > file.txt
```

O comando a seguir não imprimirá "Hello World" na tela do terminal, ele criará um arquivo chamado ``file.txt`` e escreverá a string "Hello World" nele.
Isso pode ser verificado executando o comando ``cat`` no arquivo ``file.txt``.

```
cat file.txt
```

No entanto, toda vez que você redirecionar o **STDOUT** de qualquer comando várias vezes para o mesmo arquivo, ele removerá o conteúdo existente do arquivo para gravar os novos.

Exemplo:

```
echo "Hello World!" > file.txt
echo "How are you?" > file.txt
```

Ao executar ``cat`` no arquivo ``file.txt``:

```
cat file.txt
```

Você só receberá o "How are you?" cadeia impressa.

```
Como você está?
```

Isso ocorre porque a string "Hello World" foi substituída.
Este comportamento pode ser evitado usando o operador ``>>``.

O exemplo acima pode ser escrito como:

```
echo "Olá Mundo!" > file.txt
echo "Como você está?" >> file.txt
```

Ao executar o ``cat`` no arquivo ``file.txt``, você obterá o resultado desejado.

```
Olá Mundo!
Como você está?
```

Alternativamente, o operador de redirecionamento para **STDOUT** também pode ser escrito como ``1>``. Curti,

```
echo "Olá Mundo!" 1> file.txt
```

## STDERR (Erro padrão)

O texto de erro na tela do terminal é impresso através do **STDERR** do comando. Por exemplo:

```
ls --hello 2> error.txt
```

daria uma mensagem de erro. Esta mensagem de erro é o **STDERR** do comando.

**STDERR** pode ser redirecionado usando o operador ``2>``.

```
ls --hello 2> error.txt
```

Este comando irá redirecionar a mensagem de erro para o arquivo ``error.txt`` e gravá-la nele. Isso pode ser verificado executando o comando ``cat`` no arquivo ``error.txt``.

Você também pode usar o operador ``2>>`` para **STDERR** assim como usou ``>>`` para **STDOUT**.

Mensagens de erro em scripts Bash podem ser indesejáveis ​​às vezes. Você pode optar por ignorá-los redirecionando a mensagem de erro para o arquivo ``/dev/null``.
``/dev/null`` é um pseudodispositivo que recebe texto e o descarta imediatamente.

O exemplo acima pode ser escrito a seguir para ignorar completamente o texto do erro:

```
ls --hello 2> /dev/null
```

Claro, você pode redirecionar **STDOUT** e **STDERR** para o mesmo comando ou script.

```
./install_package.sh > output.txt 2> error.txt
```

Ambos podem ser redirecionados para o mesmo arquivo também.

```
./install_package.sh > arquivo.txt 2> arquivo.txt
```

Há também uma maneira mais curta de fazer isso.

```
./install_package.sh > arquivo.txt 2>&1
```

# Tubulação (Piping)

Até agora vimos como redirecionar **STDOUT**, **STDIN** e **STDOUT** de e para um arquivo.
Para concatenar a saída do programa *(comando)* como a entrada de outro programa *(comando)* você pode usar uma barra vertical `|`.

Exemplo:

```
ls | grep ".txt"
```

Este comando listará os arquivos no diretório atual e passará a saída para o comando *`grep`*, que filtrará a saída para mostrar apenas os arquivos que contêm a string ".txt".

Sintaxe:

```
[tempo [-p]] [!] comando1 [ | ou |& comando2 ] …
```

Você também pode construir cadeias arbitrárias de comandos conectando-os para obter um resultado poderoso.

Este exemplo cria uma lista de todos os usuários que possuem um arquivo em um determinado diretório, bem como quantos arquivos e diretórios eles possuem:

```
ls -l /projects/bash_scripts | tail -n +2 | sed 's/\s\s*/ /g' | cut -d ' ' -f 3 | sort | uniq -c
```

Resultado:

```
8 anne
34 harry
37 tina
18 ryan
```

# AquiDocumento

O símbolo `<<` pode ser usado para criar um arquivo temporário [heredoc] e redirecioná-lo na linha de comando.

```
COMMAND << EOF
 ContentOfDocument
 ...
 ...
EOF
```

Observe aqui que `EOF` representa o delimitador fim do arquivo (end of file) do heredoc. Na verdade, podemos usar qualquer palavra alfanumérica em seu lugar para significar o início e o fim do arquivo. Por exemplo, este é um heredoc válido:

```
cat << randomword1
Este script imprimirá essas linhas no terminal.
Observe que cat pode ler a partir da entrada padrão. Usando este heredoc, podemos
crie um arquivo temporário com essas linhas como conteúdo e canalize isso
em gato.
randomword1
```

Efetivamente, aparecerá como se o conteúdo do heredoc fosse canalizado para o comando. Isso pode tornar o script muito limpo se várias linhas precisarem ser canalizadas para um programa.

Além disso, podemos anexar mais tubos (pipes) como mostrado:

```
cat << randomword1 | wc
Este script imprimirá essas linhas no terminal.
Observe que cat pode ler a partir da entrada padrão. Usando este heredoc, podemos
crie um arquivo temporário com essas linhas como conteúdo e canalize isso
em gato.
randomword1
```

Além disso, variáveis ​​pré-definidas podem ser usadas dentro dos heredocs.

# HereString

Herestrings são bastante semelhantes aos heredocs, mas usam `<<<`. Eles são usados ​​para strings de linha única que precisam ser canalizadas para algum programa. Isso parece mais limpo do que heredocs, pois não precisamos especificar o delimitador.

```
wc <<<"esta é uma maneira fácil de passar strings para o stdin de um programa (aqui wc)"
```

Assim como heredocs, herestrings podem conter variáveis.

## Resumo

|**Operador** |**Descrição** |
|:---|:---|
|`>`|`Salvar saída em um arquivo`|
|`>>`|`Anexar saída a um arquivo`|
|`<`|`Ler entrada de um arquivo`|
|`2>`|`Redirecionar mensagens de erro`|
|`\|`|`Envia a saída de um programa como entrada para outro programa`|
|`<<`|`Coloque várias linhas em um programa de forma limpa`|
|`<<<`|`Coloque uma única linha em um programa de forma limpa`|
