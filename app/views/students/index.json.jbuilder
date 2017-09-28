json.students @students do |student|
  json.cache! student, expires_in: 10.minutes do
    json.partial! 'students/student.compact', student: student
  end
end
