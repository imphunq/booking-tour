class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :status
      t.references :tours, foreign_key: true
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
