class AddTitleToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :title, :string
  end
end
