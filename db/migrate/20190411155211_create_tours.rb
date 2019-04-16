class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.date :departureDay
      t.integer :duration
      t.float :money
      t.text :schedule
      t.references :hotels, foreign_key: true
      t.timestamps
    end
  end
end
