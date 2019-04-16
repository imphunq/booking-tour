class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :quantity
      t.references :users, foreign_key: true
      t.references :tours, foreign_key: true
      t.timestamps
    end
  end
end
