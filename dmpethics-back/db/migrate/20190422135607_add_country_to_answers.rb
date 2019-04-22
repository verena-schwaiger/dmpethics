class AddCountryToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :country, :string
  end
end
