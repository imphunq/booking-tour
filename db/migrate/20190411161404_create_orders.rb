class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      t.float :money
      t.integer :quantity
      t.timestamps
    end
  end
end
