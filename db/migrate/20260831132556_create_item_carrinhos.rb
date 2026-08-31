class CreateItemCarrinhos < ActiveRecord::Migration[8.1]
  def change
    create_table :item_carrinhos do |t|
      t.references :carrinho, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
