# frozen_string_literal: true

class LoginIncorreto < SitePrism::Page
  element :btn_area_login, '#h_usr-link'
  element :btn_entrar, '#h_usr-signin'
  element :input_email, '#email-input'
  element :input_senha, '#password-input'
  element :btn_login, '#login-button'

  def link_acesso
    btn_area_login.visible?
    btn_area_login.click
    btn_entrar.visible?
    btn_entrar.click
  end

  def insere_email(email, senha)
    input_email.set email
    input_senha.set senha
    btn_login.click
  end
end
