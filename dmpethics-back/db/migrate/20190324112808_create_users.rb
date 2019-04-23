class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_firstname
      t.string :user_surname
      t.string :user_email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
