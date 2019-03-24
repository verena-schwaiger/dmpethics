class CreateStudyDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :study_details do |t|
      t.string :institution
      t.string :user_id
      t.string :researchgroup_id
      t.string :study_description
      t.string :study_id

      t.timestamps
    end
  end
end
