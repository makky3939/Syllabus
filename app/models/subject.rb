class Subject < ActiveRecord::Base
  has_many :subject_teachers
  has_many :teachers, through: :subject_teachers

  def same_subjects
    Subject
      .includes(:teachers)
      .where(
        Subject.arel_table[:title].matches("%#{self.title.gsub(/-\d/, '')}%")
      )
      .where.not(id: self.id)
  end
end
