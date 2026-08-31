class ItemCarrinho < ApplicationRecord
  belongs_to :carrinho
  belongs_to :produto

  validates :quantidade, numericality: { greater_than_or_equal_to: 1 }

  def subtotal
    (quantidade || 0) * (produto&.preco || 0)
  end
end