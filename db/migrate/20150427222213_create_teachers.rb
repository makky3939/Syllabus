class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :kana
      t.string :face_filename
      t.string :body_filename
      t.column :major_id, :integer
      t.string :theme
      t.text :description
      t.string :room
      t.string :office_hour
      t.binary :voice
      t.timestamps null: false
    end
  end
end
