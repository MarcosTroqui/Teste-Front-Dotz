# language: pt

@pesquisa_livro
Funcionalidade: Pesquisar livro no site Submarino e comparar no site da Saraiva e Amazon

Contexto:
  Dado que acesse o site Submarino

@pesquisa_livro_sites
Cenario: Validar o nome do autor e ISBN são iguais nos sites
  Quando clico no link livros
  E seleciono o primeiro livro da pesquisa guardo o nome do autor e ISBN 
  E visito o site da Amazon e pesquiso o livro pelo ISBN e guardo o nome do autor e ISBN
  E visito o site da Disal e pesquiso o livro pelo ISBN e guardo o nome do autor e ISBN
  Então valido o nome do autor e ISBN são iguais nos sites

