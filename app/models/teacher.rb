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

  def subject_voice_file_name(subject_id)
    teacher_id = self.id
    st = SubjectTeacher.find_by(:subject_id => subject_id, :teacher_id => teacher_id)
    if st.nil?
      false
    else
      st
    end
  end

  def major
    case self.major_id
      when 0
        '知識科学主専攻'
      when 1
        '情報資源経営主専攻'
      when 2
        '知識情報システム主専攻'
      else
        ''
    end
  end
end
