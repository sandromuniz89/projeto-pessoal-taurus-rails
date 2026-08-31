class CreateCarrinhos < ActiveRecord::Migration[8.1]
  def change
    create_table :carrinhos do |t|
      t.timestamps
    end
  end
end
