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

puts "Deleting managers"
Student.destroy_all
puts "Done: Deleting managers"

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

puts "Adding new managers"
(1..25).to_a.each do |digit|
  Manager.create(email: "manager#{digit}@mail.com",
                 password: "12345678")
end
puts "Done: Adding new managers"

puts "Adding admin"
Admin.create(email: "admin@mail.com", password: "12345678")
puts "Done: Adding admin"

puts "Adding posts"
10.times do
  Post.create(
    title: "seed posts",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, \
           sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \
           Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\
           nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in \
           reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \
           Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt \
           mollit anim id est laborum.",
    manager_id: 1
  )
end
Post.limit(3).update_all(important: true)
puts "Done: Adding posts"
