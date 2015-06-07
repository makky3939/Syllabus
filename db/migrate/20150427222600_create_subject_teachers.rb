class CreateSubjectTeachers < ActiveRecord::Migration
  def change
    create_table :subject_teachers do |t|
      t.column :subject_id, :integer, null: false
      t.column :teacher_id, :integer, null: false
      t.string :voice_filename
      t.timestamps null: false
    end
  end
end
