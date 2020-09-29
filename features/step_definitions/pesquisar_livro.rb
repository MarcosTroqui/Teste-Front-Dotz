# frozen_string_literal: true

Dado("que acesse o site Submarino") do
    visit '/'
  end

  Quando("clico no link livros") do
    pesquisa.link_livros_sub
  end

  Quando("seleciono o primeiro livro da pesquisa guardo o nome do autor e ISBN") do
    pesquisa.sel_livro_sub
  end

  Quando("visito o site da Amazon e pesquiso o livro pelo ISBN e guardo o nome do autor e ISBN") do
    visit 'https://www.amazon.com.br/'
    pesquisa.visita_site_amazon
  end

  Quando("visito o site da Disal e pesquiso o livro pelo ISBN e guardo o nome do autor e ISBN") do 
    visit 'https://www.disal.com.br/'
    pesquisa.visita_site_disal
  end

  Então("valido o nome do autor e ISBN são iguais nos sites") do
    pesquisa.valida_infos
  end
