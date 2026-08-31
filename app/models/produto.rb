class Produto < ApplicationRecord
  has_one_attached :imagem

  validates :nome, :preco, :estoque, presence: true
end