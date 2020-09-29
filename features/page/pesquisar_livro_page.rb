# frozen_string_literal: true

class PesquisaLivro < SitePrism::Page
  element :lgpd, '#lgpd-accept'
  element :livro, '.product-grid-item', match: :first
  element :pesquisa_prod_amazon, '#twotabsearchtextbox'
  element :btn_pesquisa_amazon, '.nav-input', match: :first
  element :mini_prod_amazon, '.s-image-square-aspect'
  element :autor_amazon, '.notFaded'
  element :pesquisa_prod_disal, '#busca'

  def link_livros_sub
    lgpd.click
    click_link 'Livros'
    sleep 2
  end

  def sel_livro_sub
    livro.click
    $isbn_sub = find(:xpath, '//*[@id="info-section"]/div[2]/section/div[2]/section/table/tbody/tr[12]/td[2]/span').text
    $autor_sub = find(:xpath, '//*[@id="info-section"]/div[2]/section/div[2]/section/table/tbody/tr[13]/td[2]/span').text
  end

  def visita_site_amazon
    pesquisa_prod_amazon.visible?
    pesquisa_prod_amazon.set $isbn_sub
    pesquisa_prod_amazon.send_keys [:enter]
    sleep 2
    mini_prod_amazon.visible?
    mini_prod_amazon.click
    find(id= '#detailBulletsWrapper_feature_div', text: '978-8532512949').visible?
    aut_amazon = autor_amazon.text
    $autor_amazon = aut_amazon[0..11]
  end

  def visita_site_disal
    pesquisa_prod_disal.set $isbn_sub
    pesquisa_prod_disal.send_keys [:enter]
    find(class: 'book-image').visible?
    find(class: 'book-image').click
    autor = find(class: 'book-title', match: :first).text[21..32].gsub(',', '')
    nome = autor[8..10]
    sobre_nome = autor[0..6]
    $autor_disal = nome + '.'+' ' + sobre_nome
    $isbn_disal = find(:xpath, '//*[@id="page-book-detail"]/div[2]/div/div/div[4]/div/table/tbody/tr[5]/td[2]').text
  end

  def valida_infos
    resultado = $isbn_sub == $isbn_disal && $autor_sub.upcase == $autor_amazon.upcase && $autor_sub.upcase == $autor_disal.upcase
    raise ArgumentError if resultado == false
  end
end
