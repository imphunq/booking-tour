class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :users
      t.references :tours
      t.float :money
      t.integer :quantity
      t.timestamps
    end
  end
end
