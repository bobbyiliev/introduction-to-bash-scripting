# Comentários em Bash

Como em qualquer outra linguagem de programação, você pode adicionar comentários ao seu script. Os comentários são usados para deixar notas entre seu código.

Para fazer isso no Bash, você precisa adicionar o símbolo `#` no início da linha. Os comentários nunca serão renderizados na tela.

Aqui está um exemplo de comentário:

```bash
# Este é um comentário e não será renderizado na tela
```

Vamos em frente e adicionar alguns comentários ao nosso script:

```bash
#!/bin/bash

# Pergunte ao usuário seu nome

leia -p "Qual é o seu nome?" name

# Cumprimentar o usuário
echo "Hello $name"
echo "Bem-vindo ao DevDojo!"
```

Os comentários são uma ótima maneira de descrever algumas das funcionalidades mais complexas diretamente em seus scripts para que outras pessoas possam encontrar seu código com facilidade.
