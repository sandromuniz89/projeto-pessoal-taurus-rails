class ClientesController < ApplicationController
  before_action :authenticate_cliente!

  def conta
    @cliente = current_cliente
    @pedidos = @cliente.pedidos.includes(item_pedidos: :produto).order(created_at: :desc)
  end
end