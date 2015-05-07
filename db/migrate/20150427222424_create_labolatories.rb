class CreateLabolatories < ActiveRecord::Migration
  def change
    create_table :labolatories do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
