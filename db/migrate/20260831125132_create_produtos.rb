class CreateProdutos < ActiveRecord::Migration[8.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.decimal :preco
      t.integer :estoque

      t.timestamps
    end
  end
end
