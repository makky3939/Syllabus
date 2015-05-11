class Teacher < ActiveRecord::Base
  has_many :subject_teachers
  has_many :subjects, through: :subject_teachers
end
