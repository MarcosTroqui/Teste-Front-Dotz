# frozen_string_literal: true

Quando("clico no link login") do
  login.link_acesso
end

Quando("insiro um {string} e {string} inválido") do |email, senha|
  login.insere_email(email,senha)
end

Entao("valido a {string} de login inválido") do |string|
  #não é possivel a validação desta step pois o site de produção verifica a automação e exige o recaptcha
end
