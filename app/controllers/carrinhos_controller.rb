class CarrinhosController < ApplicationController
  def show
    @itens = @carrinho.item_carrinhos.includes(:produto)
  end
end