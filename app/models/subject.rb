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

  def abstract_abstract
    if self.abstract.length == 0
      '概要は未登録です'
    else
      self.abstract[0, 140]
    end
  end

  def timetable
    _period = self.period
    day = _period[0]
    puts day
    _period = _period.delete(day)
    period = _period.split(',').map{|item|
      unless item.nil?
        item.to_i
      end
    }
    return {day: day, period: period}
  end

  def tags
    code = self.code

    def setCounty(code)
      case code[0, 1]
        when 'G'
          '情報学群'
        else
          'その他'
      end
    end

    def setGenus(code)
      case code[0, 2]
      when 'GA'
        '情報科学類'
      when 'GC'
        '情報メディア創成学類'
      when 'GE'
        '知識情報・図書館学類'
      else
        'その他'
      end
    end

    def setCluster(code)
      case code[0, 3]
        when 'GE10'
          '1年次科目'
        when 'GE11'
          '2年次科目'
        when 'GE4'
          '学類共通専門科目'
        when 'GE5'
          '専門科目必修'
        when 'GE6'
          '知識科学主専攻'
        when 'GE7'
          '知識情報システム主専攻'
        when 'GE8'
          '情報経営・図書館主専攻'
        else
          'その他'
      end
    end

    tags = []
    tags.push setCounty code
    tags.push setGenus code
    tags.push setCluster code
  end
end
