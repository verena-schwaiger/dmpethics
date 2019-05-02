class AddEthicsToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :ethics, :string
  end
end
