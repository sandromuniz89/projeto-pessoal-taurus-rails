class CreateItemPedidos < ActiveRecord::Migration[8.1]
  def change
    create_table :item_pedidos do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade
      t.decimal :preco_unitario

      t.timestamps
    end
  end
end
