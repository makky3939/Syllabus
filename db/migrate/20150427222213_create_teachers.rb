class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :face_filename
      t.string :body_filename
      t.binary :voice
      t.timestamps null: false
    end
  end
end
