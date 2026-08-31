require 'net/http'
require 'uri'
require 'json'

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mercado_pago
    if params[:type] == 'payment' || params[:topic] == 'payment'
      payment_id = params.dig(:data, :id) || params[:id]

      if payment_id.present?
        access_token = 'APP_USR-3115581658592394-042418-6ba9ab19f9e1cfc3d10f197ec0a2a6fb-79905850'
        uri = URI.parse("https://api.mercadopago.com/v1/payments/#{payment_id}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)
        request["Authorization"] = "Bearer #{access_token}"

        response = http.request(request)
        data = JSON.parse(response.body)
        status = data['status']

        pedido = Pedido.find_by(mp_payment_id: payment_id.to_s)

        if pedido && status == 'approved'
          pedido.update(status: 'approved')
        end
      end
    end

    head :ok
  end
end