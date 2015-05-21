# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' },
#  { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# path = 'kdb_xxxxxxxxxxxxxx.tsv'

# puts 'Creating tables'
# open(path) do |tsv|
#   tsv.each.with_index(1) do |line, index|
#     row = line.split "\t"

#     # 科目番号, 科目名, 授業方法, 単位数, 標準履修年次,
#     # 実施学期, 曜時限, 教室, 担当教員, 授業概要, 備考,
#     # 科目等履修生申請可否, 申請条件, 英語(日本語)科目名
#     subject = Subject.new(
#       code: row[0],
#       title: row[1],
#       method: row[2],
#       credit: row[3],
#       default_grade: row[4],
#       semester: row[5],
#       period: row[6],
#       location: row[7],
#       abstract: row[9],
#       note: row[10],
#       allow_auditor: row[11],
#       condition: row[12],
#       title_sub: row[13]
#     )
#     subject.save

#     row[8].split(',').each do |name|
#       teacher = Teacher.find_by(name: name)
#       if teacher.nil?
#         teacher = Teacher.new(
#           name: name
#         )
#         teacher.save
#       end
#       subject_teacher = SubjectTeacher.new(
#         subject_id: subject.id,
#         teacher_id: teacher.id
#       )
#       subject_teacher.save
#     end

#     print "\rLine ##{index} "
#   end
# end
# puts 'done!'

teachers = YAML.load_file "db/source/teachers.yaml"

teachers.each do |teacher|
  puts teacher['name']
  _teacher = Teacher.find_by name: teacher['name']
  puts teacher['face_filename']
  _teacher.update face_filename: teacher['face_filename']
  File.copy_stream "db/source/teachers/#{teacher['face_filename']}", "public/images/teachers/#{teacher['face_filename']}"
end