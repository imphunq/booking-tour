class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :quantity
      t.references :users
      t.references :tours
      t.timestamps
    end
  end
end
