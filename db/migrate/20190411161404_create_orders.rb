class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :users, foreign_key: true
      t.references :tours, foreign_key: true
      t.float :money
      t.integer :quantity
      t.timestamps
    end
  end
end
