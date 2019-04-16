class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :tours, foreign_key: true
      t.integer :sale_of
      t.timestamps
    end
  end
end
