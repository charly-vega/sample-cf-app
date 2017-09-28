json.extract! student, :id, :name
json.courses do
  json.array! student.courses, partial: 'courses/course.compact', as: :course
end
