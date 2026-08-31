class ClienteMailer < ApplicationMailer
  default from: 'taurusiptv@gmail.com'

  def boas_vindas(cliente)
    @cliente = cliente
    mail(to: @cliente.email, subject: "🎉 Bem-vindo à MinhaLoja!")
  end
end