# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create!(email: 'test@test.com',
                    password: 'password',
                    password_confirmation: 'password')

puts "Created test@test.com user"

post_count = 10

post_count.times do |i|
  Post.create!(user: @user,
              level: Random.new.rand(89..120),
              created_at: Date.today + i.days)
end

puts "Created #{post_count} posts"
