class ItemCarrinhosController < ApplicationController
  def create
    produto = Produto.find(params[:produto_id])
    @item_carrinho = @carrinho.item_carrinhos.find_by(produto: produto)

    if @item_carrinho
      @item_carrinho.increment!(:quantidade)
    else
      @item_carrinho = @carrinho.item_carrinhos.create(produto: produto, quantidade: 1)
    end

    redirect_to carrinho_path, notice: "#{produto.nome} adicionado ao carrinho!"
  end

  def destroy
    @item_carrinho = @carrinho.item_carrinhos.find(params[:id])
    @item_carrinho.destroy
    redirect_to carrinho_path, notice: "Item removido do carrinho."
  end
end