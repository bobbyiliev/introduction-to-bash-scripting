# Bash Hello World

Uma vez que criamos nosso arquivo `devdojo.sh` e especificamos o bash shebang na primeira linha, estamos prontos para criar nosso primeiro script bash `Hello World`.

Para fazer isso, abra o arquivo `devdojo.sh` novamente e adicione o seguinte após a linha `#!/bin/bash`:

```bash
#!/bin/bash

echo "Hello World!"
```

Salve o arquivo e saia.

Depois disso, torne o script executável executando:

```bash
chmod +x devdojo.sh
```

Após isso execute o arquivo:

```bash
./devdojo.sh
```

Você verá uma mensagem "Hello World" na tela.

Outra maneira de executar o script seria:

```bash
bash devdojo.sh
```

Como o bash pode ser usado interativamente, você pode executar o seguinte comando diretamente no seu terminal e obter o mesmo resultado:

```bash
echo "Hello DevDojo!"
```

Colocar em um script é útil quando você precisa combinar vários comandos.
