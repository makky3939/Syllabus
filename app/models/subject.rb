class Subject < ActiveRecord::Base
  has_many :subject_teachers
  has_many :teachers, through: :subject_teachers
end
