class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :study
      t.json :data

      t.timestamps
    end
  end
end
