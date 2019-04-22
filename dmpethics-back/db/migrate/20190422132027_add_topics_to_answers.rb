class AddTopicsToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :topics, :string, array: true, default: '{}'
  end
end
