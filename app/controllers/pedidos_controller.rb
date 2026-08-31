class PedidosController < ApplicationController
  before_action :authenticate_cliente!

  def index
    @pedidos = current_cliente.pedidos.order(created_at: :desc)
  end

  def show
    @pedido = current_cliente.pedidos.find(params[:id])
  end

  def create
    if @carrinho.item_carrinhos.empty?
      redirect_to produtos_path, alert: "Seu carrinho está vazio."
      return
    end

    @pedido = current_cliente.pedidos.new(total: @carrinho.total, status: "pending")

    if @pedido.save
      @carrinho.item_carrinhos.each do |item|
        @pedido.item_pedidos.create(
          produto: item.produto,
          quantidade: item.quantidade,
          preco_unitario: item.produto.preco
        )
      end

      pix_service = MercadoPagoPixService.new(@pedido)
      if pix_service.criar_cobranca
        @carrinho.item_carrinhos.destroy_all
        redirect_to pedido_path(@pedido), notice: "Cobrança PIX gerada com sucesso!"
      else
        redirect_to carrinho_path, alert: "Falha ao comunicar com o Mercado Pago."
      end
    else
      redirect_to carrinho_path, alert: "Erro ao criar pedido."
    end
  end

  def cancelar
    @pedido = current_cliente.pedidos.find(params[:id])
    if @pedido.status == "pending"
      @pedido.update(status: "cancelled")
      redirect_to minha_conta_path, notice: "Pedido ##{@pedido.id} cancelado com sucesso."
    else
      redirect_to minha_conta_path, alert: "Este pedido não pode ser cancelado."
    end
  end
end