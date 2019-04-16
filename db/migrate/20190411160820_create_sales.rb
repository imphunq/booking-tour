class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :tours
      t.integer :sale_of
      t.timestamps
    end
  end
end
