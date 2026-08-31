class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pedidos, dependent: :destroy

  after_create :enviar_email_boas_vindas

  private

  def enviar_email_boas_vindas
    ClienteMailer.boas_vindas(self).deliver_later
  end
end