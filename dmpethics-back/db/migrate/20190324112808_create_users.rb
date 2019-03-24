class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_firstname
      t.string :user_surname
      t.string :user_email
      t.string :user_password

      t.timestamps
    end
  end
end
