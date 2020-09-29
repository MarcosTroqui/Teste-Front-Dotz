# frozen_string_literal: true

Quando("clico no link login") do
  login.link_acesso
end

Quando("insiro um {string} e {string} inválido") do |email, senha|
  login.insere_email(email,senha)
end

Entao("valido a {string} de login inválido") do |string|
  expect(page).to have_content('E-mail ou senha incorretos')
end
