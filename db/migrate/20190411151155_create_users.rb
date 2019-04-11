class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.datetime :birth
      t.string :gender
      t.string :address
      t.string :phone
      t.boolean :permission

      t.timestamps
    end
  end
end
