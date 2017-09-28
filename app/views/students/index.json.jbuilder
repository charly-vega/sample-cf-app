json.students @students do |student|
  json.partial! 'students/student.compact', student: student
end
