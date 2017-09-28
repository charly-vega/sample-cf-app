# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

1000.times { Course.create(title: "#{Faker::Job.field} #{rand(100)}") }
100.times { Student.create name: Faker::Name.name, courses: Course.all.sample(50) }