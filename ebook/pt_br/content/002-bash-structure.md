# Estrutura Bash

Vamos começar criando um novo arquivo com a extensão `.sh`. Como exemplo, poderíamos criar um arquivo chamado `devdojo.sh`.

Para criar esse arquivo, você pode usar o comando `touch`:

```bash
touch devdojo.sh
```

Ou você pode usar seu editor de texto:

```bash
nano devdojo.sh
```

Para executar/rodar um arquivo de script bash com o interpretador de shell bash, a primeira linha de um arquivo de script deve indicar o caminho absoluto para o executável bash:

```bash
#!/bin/bash
```

Isso também é chamado de [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)).

Tudo o que o shebang faz é instruir o sistema operacional a executar o script com o executável `/bin/bash`.
