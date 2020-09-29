# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__),
    '../pages/*.rb')].each { |file| require file }

# modulos para chamar as classes instanciadas
module Pages
  def pesquisa
    PesquisaLivro.new
  end
end
