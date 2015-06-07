class CreateSubjectVoices < ActiveRecord::Migration
  def change
    create_table :subject_voices do |t|

      t.timestamps null: false
    end
  end
end
