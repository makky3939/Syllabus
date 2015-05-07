class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.binary :name
      t.binary :face_main
      t.binary :face_sub
      t.binary :voice
      t.timestamps null: false
    end
  end
end
