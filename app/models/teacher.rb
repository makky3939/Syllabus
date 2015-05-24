class Teacher < ActiveRecord::Base
  has_many :subject_teachers
  has_many :subjects, through: :subject_teachers

  def face_path
    if self.face_filename
      return "/images/teachers/#{self.face_filename}"
    else
      return "/images/default/teacher.png"
    end
  end

  def body_path
    if self.body_filename
      return "/images/teachers/#{self.body_filename}"
    else
      return "/images/default/teacher.png"
    end
  end
end
