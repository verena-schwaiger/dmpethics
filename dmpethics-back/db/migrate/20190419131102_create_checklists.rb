class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.string :study_id
      t.json :list

      t.timestamps
    end
  end
end
