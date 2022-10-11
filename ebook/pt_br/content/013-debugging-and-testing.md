# Depuração, teste e atalhos

Para depurar seus scripts bash, você pode usar `-x` ao executar seus scripts:

```bash
bash -x ./seu_script.sh
```

Ou você pode adicionar `set -x` antes da linha específica que você deseja depurar, `set -x` habilita um modo do shell onde todos os comandos executados são impressos no terminal.

Outra maneira de testar seus scripts é usar esta ferramenta fantástica aqui:

[https://www.shellcheck.net/](https://www.shellcheck.net/)

Basta copiar e colar seu código na caixa de texto, e a ferramenta lhe dará algumas sugestões sobre como você pode melhorar seu script.

Você também pode executar a ferramenta diretamente no seu terminal:

[https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)

Se você gostar da ferramenta, certifique-se de marcá-la no GitHub e contribuir!

Como SysAdmin/DevOps, passo muito do meu dia no terminal. Aqui estão meus atalhos favoritos que me ajudam a fazer tarefas mais rapidamente enquanto escrevo scripts Bash ou apenas enquanto trabalho no terminal.

Os dois abaixo são particularmente úteis se você tiver um comando muito longo.

* Exclua tudo do cursor até o final da linha:

```
Ctrl + k
```

* Exclua tudo do cursor até o início da linha:

```
Ctrl + você
```

* Excluir uma palavra para trás do cursor:

```
Ctrl + w
```

* Pesquise seu histórico para trás. Este é provavelmente o que eu mais uso. É realmente útil e acelera muito meu fluxo de trabalho:

```
Ctrl + r
```

* Limpe a tela, eu uso isso em vez de digitar o comando `clear`:

```
Ctrl + l
```

* Interrompe a saída para a tela:

```
Ctrl + s
```

* Habilite a saída para a tela caso tenha parado anteriormente por `Ctrl + s`:

```
Ctrl + q
```

* Termina o comando atual

```
Ctrl + c
```

* Jogue o comando atual em segundo plano:

```
Ctrl + z
```

Eu os uso regularmente todos os dias, e isso me economiza muito tempo.

Se você acha que eu perdi algum, sinta-se à vontade para participar da discussão no [fórum da comunidade DigitalOcean](https://www.digitalocean.com/community/questions/what-are-your-favorite-bash-shortcuts)!
