class CreateSubjectVoices < ActiveRecord::Migration
  def change
    create_table :subject_voices do |t|
      t.column :subject_teacher_id, :integer, null: false
      t.string :voice_filename
      t.timestamps null: false
    end
  end
end
