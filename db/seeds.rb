# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' },
#  { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


path = 'db/source/kdb.tsv'

puts 'Creating tables'
open(path) do |tsv|
  tsv.each.with_index(1) do |line, index|
    row = line.split "\t"

    # 科目番号, 科目名, 授業方法, 単位数, 標準履修年次,
    # 実施学期, 曜時限, 教室, 担当教員, 授業概要, 備考,
    # 科目等履修生申請可否, 申請条件, 英語(日本語)科目名
    subject = Subject.new(
      code: row[0],
      title: row[1],
      method: row[2],
      credit: row[3],
      default_grade: row[4],
      semester: row[5],
      period: row[6],
      location: row[7],
      abstract: row[9],
      note: row[10],
      allow_auditor: row[11],
      condition: row[12],
      title_sub: row[13]
    )
    subject.save

    row[8].split(',').each do |name|
      teacher = Teacher.find_by(name: name)
      if teacher.nil?
        teacher = Teacher.new(
          name: name
        )
        teacher.save
      end
      subject_teacher = SubjectTeacher.new(
        subject_id: subject.id,
        teacher_id: teacher.id
      )
      subject_teacher.save
    end

    print "\rLine ##{index} "
  end
end
puts 'done!'

def resize(path, _filename, format, type)
  hex = (0...32).map { ('a'..'z').to_a[rand(26)] }.join
  filename = "#{hex}.#{format}"
  original = Magick::ImageList.new "db/source/teachers/#{path}/#{_filename}"
  if type == 'face'
    image = original.resize_to_fit(512, 512)
  else
    image = original.resize_to_fit(1280, 1280)
  end
  image.write "public/#{path}/teachers/#{filename}"
  return filename
end

def cp2(path, _filename, format)
  hex = (0...32).map { ('a'..'z').to_a[rand(26)] }.join
  filename = "#{hex}.#{format}"
  File.copy_stream "db/source/teachers/#{path}/#{_filename}", "public/#{path}/teachers/#{filename}"
  return filename
end

FileUtils.mkdir_p('public/images/teachers') unless FileTest.exist?('public/images/teachers')
FileUtils.mkdir_p('public/audios/teachers') unless FileTest.exist?('public/audios/teachers')
teachers = YAML.load_file "db/source/teachers.yaml"

teachers.each do |teacher|
  puts teacher['name']
  _teacher = Teacher.find_by name: teacher['name']
  unless _teacher.nil?
    unless teacher['face_filename'] == 'nil'
      fn = resize('images', teacher['face_filename'], 'png', 'face')
      _teacher.update face_filename: fn
    end
    unless teacher['body_filename'] == 'nil'
      fn = resize('images', teacher['body_filename'], 'png', 'body')
      _teacher.update body_filename: fn
    end
    unless teacher['voice_filename'] == 'nil'
      fn = cp2('audios', teacher['voice_filename'], 'mp3')
      _teacher.update voice_filename: fn
    end
    _teacher.update kana: teacher['kana']
    _teacher.update major_id: teacher['major_id']
    _teacher.update theme: teacher['theme']
    _teacher.update description: teacher['description']
    _teacher.update room: teacher['room']
    _teacher.update office_hour: teacher['office_hour']
  end
end

FileUtils.mkdir_p('public/audios/subjects') unless FileTest.exist?('public/audios/subjects')
subjects = YAML.load_file "db/source/subjects.yaml"

subjects.each do |subject|
  subject_name = Subject.find_by id: subject['id']
  subject['teachers'].each do |teacher|
    _teacher = Teacher.find_by name: teacher['name']
    st = SubjectTeacher.find_by(:subject_id => subject['id'], :teacher_id => _teacher.id)
    st.update voice_filename: teacher['voice_filename']
    File.copy_stream "db/source/subjects/audios/#{teacher['voice_filename']}", "public/audios/subjects/#{teacher['voice_filename']}"
  end
end
