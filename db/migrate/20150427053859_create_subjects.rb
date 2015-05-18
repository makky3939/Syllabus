class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :allow_auditor
      t.string :code
      t.string :condition
      t.string :credit
      t.string :default_grade
      t.string :method
      t.string :location
      t.string :period
      t.string :semester
      t.string :title
      t.string :title_sub
      t.text :abstract
      t.text :note
      t.timestamps null: false
    end
  end
end
