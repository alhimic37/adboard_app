class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true
      t.string :full_name
      t.date :birth_day
      t.string :email, null: false, unique: true
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.string :password_digest, null: false
      t.string :remember_token
      t.timestamps
    end
  end
end
