Private Contributions
========

Como nem todas as contribuições que faço aqui no GitHub são públicas, criei um
script que pega minhas contribuições privadas e cria mirrors públicas, pras
estatísticas do meu perfil serem visíveis para todos.

Instalação
-------

Crie um repositório para onde os commits serão enviados e tornados públicos. Na
pasta do seu repositório copie os arquivos do Private Contributions.

Crie um arquivo chamado `private_repos` e, em cada linha, coloque o path para os
seus repositórios privados. Utilize a versão expandida do path, i. e.,
`/Users/jmorais/private-repo` em vez de `~/Users/jmorais/private-repo`.

Antes de executar o arquivo de instalação, **leia todo o conteúdo para ter certeza
que nada vai destruir seu computador. Ao executar o arquivo a culpa de qualquer
problema é sua e apenas sua.**

**Apenas após ler o arquivo de instalação**, execute. Ele fará a instalação (du'h) do
agente que rodará o script uma vez por dia. Assim seus commits privados estarão
sempre atualizados.

Como Funciona
-------

O script visita todas os seus repositórios e pega uma lista de todas as datas
de commits (com o comando `git --no-pager log --format=%cI`). Todas as datas são
então comparadas com as datas dos commits já publicados, para evitar commits com
datas duplicadas. As novas datas são então enviadas, uma a uma, para as variáveis
`ENV['GIT_AUTHOR_DATE']` e `ENV['GIT_COMMITTER_DATE']`, que são usadas pelo
`git commit` como a data do commit. Por fim, é realizado o commit vazio, com o
comando `git commit --allow-empty -m '[Private commit]'`.

Como os commits são vazios e com uma mensagem padrão (`[Private commit]`), nada
do seu repositório original, exceto a data, é publicada. O GitHub então usa esses
commits vazios para plotar o gráfico de contribuições. Você verá contribuições
"duplicadas", já que possui acesso aos commits privados. Mas os visitantes do seu
perfil apenas verão os commits `[Private commit]`.

Créditos
-------

Desenvolvido por José Morais ([@jmorais](https://github.com/jmorais))
