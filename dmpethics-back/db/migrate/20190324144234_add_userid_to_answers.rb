class AddUseridToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :user_id, :string
  end
end
