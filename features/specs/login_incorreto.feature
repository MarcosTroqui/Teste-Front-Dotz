# language: pt

@login_invalido
Funcionalidade: Realizar login inválido

Contexto:
  Dado que acesse o site Submarino


Esquema do Cenario: Validar mensagem de login inválido
  Quando clico no link login
  E insiro um '<email>' e '<senha>' inválido
  Entao valido a '<mensagem>' de login inválido

Exemplos:
|      email        |      senha      |
|teste@gmail.com    |      123456     |