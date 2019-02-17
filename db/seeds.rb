# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Deleting students"
Student.destroy_all
puts "Done: Deleting students"

puts "Deleting admins"
Admin.destroy_all
puts "Done: Deleting admins"

puts "Adding new students"
(1..25).to_a.each do |digit|
  Student.create(first_name: "Denys",
                 last_name: "Lomosko",
                 email: "student#{digit}@mail.com",
                 password: "12345678",
                 student_id: "BK №124662#{digit}",
                 dorm_number: (digit % 6))
end
puts "Done: Adding new students"

puts "Adding admin"
Admin.create(email: "admin@mail.com", password: "12345678")
puts "Done: Adding admin"
