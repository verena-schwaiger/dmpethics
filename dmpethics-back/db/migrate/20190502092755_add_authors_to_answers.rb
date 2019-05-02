class AddAuthorsToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :authors, :string
  end
end
