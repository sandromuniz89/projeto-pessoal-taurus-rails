require 'net/http'
require 'uri'
require 'json'

class MercadoPagoPixService
  def initialize(pedido)
    @pedido = pedido
    @access_token = 'APP_USR-3115581658592394-042418-6ba9ab19f9e1cfc3d10f197ec0a2a6fb-79905850'
  end

  def criar_cobranca
    uri = URI.parse("https://api.mercadopago.com/v1/payments")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri)
    request["Authorization"] = "Bearer #{@access_token}"
    request["Content-Type"] = "application/json"
    request["X-Idempotency-Key"] = "pedido-#{@pedido.id}-#{Time.now.to_i}"

    nome_parts = (@pedido.cliente.nome.presence || "Cliente Loja").split(" ")
    first_name = nome_parts.first
    last_name = nome_parts.drop(1).join(" ").presence || "Comprador"

    body = {
      transaction_amount: @pedido.total.to_f,
      description: "Pedido ##{@pedido.id} - MinhaLoja",
      payment_method_id: "pix",
      payer: {
        email: @pedido.cliente.email,
        first_name: first_name,
        last_name: last_name
      }
    }

    request.body = body.to_json
    response = http.request(request)
    data = JSON.parse(response.body)

    if response.code.to_i == 201
      @pedido.update(
        mp_payment_id: data['id'].to_s,
        status: data['status'],
        pix_copia_e_cola: data.dig('point_of_interaction', 'transaction_data', 'qr_code'),
        pix_qrcode_base64: data.dig('point_of_interaction', 'transaction_data', 'qr_code_base64')
      )
      true
    else
      Rails.logger.error("Erro Mercado Pago: #{response.body}")
      false
    end
  end
end