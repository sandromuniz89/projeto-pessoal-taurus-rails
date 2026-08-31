class Carrinho < ApplicationRecord
  has_many :item_carrinhos, dependent: :destroy
  has_many :produtos, through: :item_carrinhos

  def total
    item_carrinhos.sum { |item| (item.quantidade || 0) * (item.produto&.preco || 0) }
  end

  def total_itens
    item_carrinhos.sum(:quantidade)
  end
end