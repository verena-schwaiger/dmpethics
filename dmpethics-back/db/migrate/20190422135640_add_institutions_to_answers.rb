class AddInstitutionsToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :institutions, :string
  end
end
