# Preview all emails at http://localhost:3000/rails/mailers/cliente_mailer
class ClienteMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/cliente_mailer/boas_vindas
  def boas_vindas
    ClienteMailer.boas_vindas
  end
end
