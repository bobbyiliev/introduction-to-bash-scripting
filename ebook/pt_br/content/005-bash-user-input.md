# Entrada de dados pelo no Bash

Com o script anterior, definimos uma variável e mostramos o valor da variável na tela com o `echo $name`.

Agora vamos em frente e pediremos ao usuário para entrar com dados. Para fazer isso novamente, abra o arquivo com seu editor de texto favorito e atualize o script da seguinte forma:

```bash
#!/bin/bash

echo "Qual é o seu nome?"
read name

echo "Hello $name"
echo "Bem-vindo ao DevDojo!"
```

O script acima solicitará que o usuário entre com dados e, em seguida, armazenará essa entrada como uma string/texto em uma variável.

Podemos então usar a variável e imprimir uma mensagem de volta para eles.

A saída do script acima seria:

* Primeiro execute o script:

```bash
./devdojo.sh
```

* Em seguida, você será solicitado a inserir seu nome:

```
Qual o seu nome?
Bobby
```

* Depois de digitar seu nome, basta pressionar enter e você obterá a seguinte saída:

```
Hello, Bobby
Bem-vindo ao DevDojo!
```

Para reduzir o código, poderíamos alterar a primeira instrução `echo` com o `read -p`, o comando `read` usado com o sinalizador `-p` imprimirá uma mensagem antes de solicitar ao usuário sua entrada:

```bash
#!/bin/bash

leia -p "Qual é o seu nome?" name

echo "Hello $name"
echo "Bem-vindo ao DevDojo!"
```

Certifique-se de testar isso você mesmo também!
