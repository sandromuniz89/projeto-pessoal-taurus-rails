class CreatePedidos < ActiveRecord::Migration[8.1]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.decimal :total
      t.string :status
      t.string :mp_payment_id
      t.text :pix_copia_e_cola
      t.text :pix_qrcode_base64

      t.timestamps
    end
  end
end
